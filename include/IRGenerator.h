// --- START OF FILE IRGenerator.h ---

#pragma once
#include <any>
#include <string>
#include <iostream>
#include <vector>
#include <sstream>
#include <numeric>
#include <stack>
#include <functional>
#include "IR.h"
#include "IRBuilder.h"
#include "SymbolTable.h"
#include "antlr4-runtime.h"
#include "SysYParserBaseVisitor.h"
#include "SysYParser.h"

class ExtendedModule : public Module
{
public:
    std::vector<std::string> globalLines;
    std::string print() const
    {
        std::stringstream ss;
        ss << "declare i32 @getint()\n"
           << "declare i32 @getch()\n"
           << "declare float @getfloat()\n"
           << "declare i32 @getarray(i32*)\n"
           << "declare i32 @getfarray(float*)\n"
           << "declare void @putint(i32)\n"
           << "declare void @putch(i32)\n"
           << "declare void @putfloat(float)\n"
           << "declare void @putarray(i32, i32*)\n"
           << "declare void @putfarray(i32, float*)\n"
           << "declare void @starttime()\n"
           << "declare void @stoptime()\n\n";
        for (const auto &line : globalLines)
            ss << line << "\n";
        ss << "\n";
        for (const auto &f : funcList)
            ss << f->print() << "\n";
        return ss.str();
    }
};

class IRGenerator : public SysYParserBaseVisitor
{
private:
    std::unique_ptr<ExtendedModule> module;
    IRBuilder builder;
    SymbolTable symbolTable;
    Function *currentFunction = nullptr;

    // 记录当前声明的基础类型 (int 或 float)
    Type *currentDeclType = nullptr;

    // 用于记录 SysY 库中 void 函数的名称
    std::set<std::string> voidFuncs;

    std::map<std::string, Type *> funcRetTypes;

    // 循环上下文栈，用于break/continue语句
    std::stack<BasicBlock *> condBlockStack;  // 循环条件块栈
    std::stack<BasicBlock *> mergeBlockStack; // 循环合并块栈

    // 基本块计数器
    int basicBlockCounter = 0;
    std::string getUniqueBasicBlockName(const std::string &prefix)
    {
        return prefix + std::to_string(basicBlockCounter++);
    }

    std::string getTokenText(antlr4::tree::TerminalNode *node)
    {
        return node ? node->getSymbol()->getText() : "";
    }

    Type *getBType(SysYParser::BTypeContext *ctx)
    {
        if (ctx->INT())
            return Type::getInt32Ty();
        if (ctx->FLOAT())
            return Type::getFloatTy();
        if (ctx->STRUCT())
        {
            std::string name = ctx->IDENT()->getText();
            StructDef *def = symbolTable.lookupStruct(name);
            if (!def)
                throw std::runtime_error("Undefined struct: " + name);
            return def->type;
        }
        return Type::getInt32Ty();
    }

    int parseInteger(const std::string &str)
    {
        try
        {
            // 处理十六进制
            if (str.length() > 2 && (str.rfind("0x", 0) == 0 || str.rfind("0X", 0) == 0))
            {
                // 提取十六进制部分
                std::string hexStr = str.substr(2);
                return std::stoi(hexStr, nullptr, 16);
            }

            // 处理八进制
            if (str.length() > 1 && str[0] == '0')
            {
                // 检查是否包含8或9，如果有则可能是十进制
                bool hasInvalidOctal = false;
                for (size_t i = 1; i < str.length(); ++i)
                {
                    if (str[i] == '8' || str[i] == '9')
                    {
                        hasInvalidOctal = true;
                        break;
                    }
                }
                if (!hasInvalidOctal)
                {
                    return std::stoi(str, nullptr, 8);
                }
            }

            // 十进制
            return std::stoi(str);
        }
        catch (...)
        {
            return 0;
        }
    }

    float parseFloat(const std::string &str)
    {
        try
        {
            return std::stof(str);
        }
        catch (...)
        {
            return 0.0f;
        }
    }

    int evalConstExp(SysYParser::ExpContext *ctx)
    {
        if (!ctx)
            return 0;
        if (auto p = dynamic_cast<SysYParser::ParenExpContext *>(ctx))
            return evalConstExp(p->exp());
        if (auto n = dynamic_cast<SysYParser::NumberExpContext *>(ctx))
            return parseInteger(getTokenText(n->number()->IntConst()));

        if (auto u = dynamic_cast<SysYParser::UnaryExpContext *>(ctx))
        {
            int val = evalConstExp(u->exp());
            if (u->MINUS())
                return -val;
            if (u->NOT())
                return !val;
            return val;
        }
        if (auto m = dynamic_cast<SysYParser::MulDivModExpContext *>(ctx))
        {
            int l = evalConstExp(m->exp(0));
            int r = evalConstExp(m->exp(1));
            if (m->MUL())
                return l * r;
            if (r == 0)
                return 0;
            if (m->DIV())
                return l / r;
            if (m->MOD())
                return l % r;
        }
        if (auto a = dynamic_cast<SysYParser::AddSubExpContext *>(ctx))
        {
            int l = evalConstExp(a->exp(0));
            int r = evalConstExp(a->exp(1));
            return a->PLUS() ? (l + r) : (l - r);
        }
        // 添加逻辑表达式常量求值
        if (auto land = dynamic_cast<SysYParser::LandExpContext *>(ctx))
        {
            int l = evalConstExp(land->exp(0));
            int r = evalConstExp(land->exp(1));
            return l && r;
        }
        if (auto lor = dynamic_cast<SysYParser::LorExpContext *>(ctx))
        {
            int l = evalConstExp(lor->exp(0));
            int r = evalConstExp(lor->exp(1));
            return l || r;
        }
        // 添加关系表达式常量求值
        if (auto rel = dynamic_cast<SysYParser::RelExpContext *>(ctx))
        {
            int l = evalConstExp(rel->exp(0));
            int r = evalConstExp(rel->exp(1));
            if (rel->LT())
                return l < r;
            if (rel->GT())
                return l > r;
            if (rel->LE())
                return l <= r;
            if (rel->GE())
                return l >= r;
        }
        // 添加相等性表达式常量求值
        if (auto eq = dynamic_cast<SysYParser::EqNeqExpContext *>(ctx))
        {
            int l = evalConstExp(eq->exp(0));
            int r = evalConstExp(eq->exp(1));
            if (eq->EQ())
                return l == r;
            if (eq->NEQ())
                return l != r;
        }
        if (auto l = dynamic_cast<SysYParser::LValExpContext *>(ctx))
        {
            std::string name = getTokenText(l->lVal()->IDENT(0));
            SymbolInfo *info = symbolTable.lookup(name);
            if (info && info->isConst && !info->isArray)
                return info->constIntVal;
        }
        return 0;
    }

    // --- 编译期常量求值 (Float) ---
    float evalFloatConstExp(SysYParser::ExpContext *ctx)
    {
        if (!ctx)
            return 0.0f;
        if (auto p = dynamic_cast<SysYParser::ParenExpContext *>(ctx))
            return evalFloatConstExp(p->exp());
        if (auto n = dynamic_cast<SysYParser::NumberExpContext *>(ctx))
        {
            std::string text = n->getText();
            if (text.find('.') != std::string::npos || text.find('e') != std::string::npos || text.find('E') != std::string::npos)
            {
                return parseFloat(text);
            }
            return (float)parseInteger(text);
        }
        if (auto u = dynamic_cast<SysYParser::UnaryExpContext *>(ctx))
        {
            float val = evalFloatConstExp(u->exp());
            if (u->MINUS())
                return -val;
            if (u->NOT())
                return (float)(!((bool)val));
            return val;
        }
        if (auto m = dynamic_cast<SysYParser::MulDivModExpContext *>(ctx))
        {
            float l = evalFloatConstExp(m->exp(0));
            float r = evalFloatConstExp(m->exp(1));
            if (m->MUL())
                return l * r;
            if (r == 0)
                return 0.0f;
            if (m->DIV())
                return l / r;
            if (m->MOD())
                return (float)((int)l % (int)r); // 浮点取模强转int
        }
        if (auto a = dynamic_cast<SysYParser::AddSubExpContext *>(ctx))
        {
            float l = evalFloatConstExp(a->exp(0));
            float r = evalFloatConstExp(a->exp(1));
            return a->PLUS() ? (l + r) : (l - r);
        }
        if (auto l = dynamic_cast<SysYParser::LValExpContext *>(ctx))
        {
            std::string name = getTokenText(l->lVal()->IDENT(0));
            SymbolInfo *info = symbolTable.lookup(name);
            if (info && info->isConst && !info->isArray)
            {
                if (info->type->isFloatTy())
                    return info->constFloatVal;
                if (info->type->isInt32Ty())
                    return (float)info->constIntVal;
            }
        }
        return 0.0f;
    }

    ValuePtr getLValPointer(SysYParser::LValContext *ctx)
    {
        std::string name = ctx->IDENT(0)->getText();
        SymbolInfo *info = symbolTable.lookup(name);
        if (!info)
        {
            std::cerr << "Undefined variable: " << name << std::endl;
            return nullptr;
        }

        ValuePtr currentPtr = info->value;
        Type *currentType = info->type;

        // 1. Handle explicit dereference prefix (*p)
        bool isDereference = (ctx->pointerPrefix() != nullptr);
        bool loadedPointer = false;

        if (isDereference)
        {
            if (info->isPointer)
            {
                // p is int*. info->value is int**. *p -> load p.
                currentPtr = builder.CreateLoad(currentPtr);
                currentType = currentType->elementType;
                loadedPointer = true;
            }
            else if (info->isArray)
            {
                // *a -> a[0]. Decay array.
                std::vector<ValuePtr> idxs = {ConstantInt::get(0), ConstantInt::get(0)};
                currentPtr = builder.CreateInBoundsGEP(currentPtr, idxs, currentType);
                currentType = currentType->elementType;
            }
        }

        // 2. Iterate over suffixes ([...], .x)
        // Manual iteration to skip IDENT and pointerPrefix
        int childIdx = 0;
        // Skip pointerPrefix if exists
        if (ctx->pointerPrefix())
            childIdx++;
        // Skip IDENT
        childIdx++;

        while (childIdx < ctx->children.size())
        {
            std::string op = ctx->children[childIdx]->getText();

            if (op == "[")
            {
                SysYParser::ExpContext *exp = dynamic_cast<SysYParser::ExpContext *>(ctx->children[childIdx + 1]);
                ValuePtr idx = std::any_cast<ValuePtr>(visit(exp));

                // Lazy load for pointer variable p[i]
                if (info->isPointer && !loadedPointer && !isDereference)
                {
                    currentPtr = builder.CreateLoad(currentPtr);
                    loadedPointer = true;
                }

                std::vector<ValuePtr> indices;
                if (currentType->isArrayTy())
                {
                    indices.push_back(new ConstantInt(0));
                    indices.push_back(idx);
                    currentType = static_cast<Type *>(currentType)->elementType;
                }
                else if (currentType->isPointerTy())
                {
                    indices.push_back(idx);
                    currentType = static_cast<Type *>(currentType)->elementType;
                }
                else
                {
                    throw std::runtime_error("Indexing non-array/non-pointer");
                }

                currentPtr = builder.CreateInBoundsGEP(currentPtr, indices, currentType);
                childIdx += 3; // [ exp ]
            }
            else if (op == ".")
            {
                std::string member = ctx->children[childIdx + 1]->getText();

                if (!currentType->isStructTy())
                    throw std::runtime_error("Dot access on non-struct");

                std::string structName = currentType->irName.substr(8);
                StructDef *def = symbolTable.lookupStruct(structName);
                if (!def)
                    throw std::runtime_error("Unknown struct definition for " + structName);

                auto it = def->memberIndices.find(member);
                if (it == def->memberIndices.end())
                    throw std::runtime_error("Unknown member " + member);
                int idx = it->second;

                std::vector<ValuePtr> indices = {new ConstantInt(0), new ConstantInt(idx)};

                currentType = def->type->memberTypes[idx];
                currentPtr = builder.CreateInBoundsGEP(currentPtr, indices, currentType);

                childIdx += 2; // . IDENT
            }
            else
            {
                childIdx++;
            }
        }

        return currentPtr;
    }

    // Helper: 计算当前维度的 Block Size
    int getDimSize(const std::vector<int> &dims, int level)
    {
        int sz = 1;
        for (size_t i = level; i < dims.size(); ++i)
            sz *= dims[i];
        return sz;
    }

    // 修复后的常量数组扁平化（带 Padding）
    template <typename T>
    void flattenConstInitVal(std::vector<T> &target, int &currentIdx, SysYParser::ConstInitValContext *ctx,
                             const std::vector<int> &dims, int dimLevel, bool isFloat)
    {
        int startIdx = currentIdx;
        if (ctx->constExp())
        {
            if (currentIdx < target.size())
            {
                if constexpr (std::is_same_v<T, float>)
                    target[currentIdx++] = evalFloatConstExp(ctx->constExp()->exp());
                else
                    target[currentIdx++] = evalConstExp(ctx->constExp()->exp());
            }
            return;
        }
        if (ctx->L_BRACE())
        {
            for (auto child : ctx->constInitVal())
            {
                flattenConstInitVal(target, currentIdx, child, dims, dimLevel + 1, isFloat);
            }
            int blockSize = getDimSize(dims, dimLevel);
            while (currentIdx < startIdx + blockSize && currentIdx < target.size())
            {
                target[currentIdx++] = 0;
            }
        }
    }

    // 新增：变量数组扁平化（支持运行时表达式，带 Padding）
    void flattenVarInitVal(std::vector<ValuePtr> &target, int &currentIdx, SysYParser::InitValContext *ctx,
                           const std::vector<int> &dims, int dimLevel)
    {
        int startIdx = currentIdx;
        if (ctx->exp())
        {
            if (currentIdx < target.size())
            {
                ValuePtr val = std::any_cast<ValuePtr>(visit(ctx->exp()));
                // 关键：隐式转换
                val = ensureType(val, currentDeclType);
                target[currentIdx++] = val;
            }
            return;
        }
        if (ctx->L_BRACE())
        {
            for (auto child : ctx->initVal())
            {
                flattenVarInitVal(target, currentIdx, child, dims, dimLevel + 1);
            }
            int blockSize = getDimSize(dims, dimLevel);
            while (currentIdx < startIdx + blockSize && currentIdx < target.size())
            {
                // Padding 0
                if (currentDeclType->isFloatTy())
                    target[currentIdx++] = ConstantFloat::get(0.0f);
                else
                    target[currentIdx++] = ConstantInt::get(0);
            }
        }
    }

    // 辅助函数：在入口块创建 Alloca 指令
    ValuePtr createEntryBlockAlloca(Type *type, const std::string &name = "")
    {
        BasicBlock *entryBB = currentFunction->blockList.front().get();
        static int allocCounter = 0;
        int id = allocCounter++;
        // 使用非数字名称以避免 LLVM 编号顺序约束
        // 必须以 % 开头
        std::string varName = "%alloc_" + std::to_string(id);
        if (!name.empty())
        {
            // 简单的清理名称中的非字母数字字符（如果需要），这里假设 name 合法
            // 添加前缀区别于普通变量
            varName = "%" + name + "_addr_" + std::to_string(id);
        }

        auto allocInst = std::make_unique<AllocaInst>(type, varName);
        ValuePtr data = allocInst.get();

        // 插入到入口块的起始位置
        entryBB->instList.insert(entryBB->instList.begin(), std::move(allocInst));
        return data;
    }

    // 辅助函数：创建新的基本块并设置插入点
    BasicBlock *createAndSetBasicBlock(const std::string &name)
    {
        BasicBlock *bb = new BasicBlock(name);
        currentFunction->addBasicBlock(bb);
        builder.setInsertPoint(bb);
        return bb;
    }

    // 将 val 转换为 targetTy 类型，如果类型不同则插入 cast 指令
    ValuePtr ensureType(ValuePtr val, Type *targetTy)
    {
        if (!val)
            return nullptr;
        Type *srcTy = val->getType();
        if (srcTy == targetTy)
            return val;

        // int -> float
        if (srcTy->isInt32Ty() && targetTy->isFloatTy())
        {
            return builder.CreateSITOFP(val);
        }
        // float -> int
        if (srcTy->isFloatTy() && targetTy->isInt32Ty())
        {
            return builder.CreateFPTOSI(val);
        }
        // i1 -> i32 (for logic ops used in arithmetic)
        if (srcTy->isInt1Ty() && targetTy->isInt32Ty())
        {
            return builder.CreateZExt(val, Type::getInt32Ty());
        }
        // i1 -> float
        if (srcTy->isInt1Ty() && targetTy->isFloatTy())
        {
            auto i32Val = builder.CreateZExt(val, Type::getInt32Ty());
            return builder.CreateSITOFP(i32Val);
        }

        return val;
    }

public:
    IRGenerator() : module(std::make_unique<ExtendedModule>())
    {
        builder.module = module.get();

        // 初始化系统库函数为 void 类型
        voidFuncs.insert("putint");
        voidFuncs.insert("putch");
        voidFuncs.insert("putfloat");
        voidFuncs.insert("putarray");
        voidFuncs.insert("putfarray");
        voidFuncs.insert("starttime");
        voidFuncs.insert("stoptime");

        funcRetTypes["putint"] = Type::getVoidTy();
        funcRetTypes["putch"] = Type::getVoidTy();
        funcRetTypes["putfloat"] = Type::getVoidTy(); // 注意这里是 void
        funcRetTypes["putarray"] = Type::getVoidTy();
        funcRetTypes["putfarray"] = Type::getVoidTy();
        funcRetTypes["starttime"] = Type::getVoidTy();
        funcRetTypes["stoptime"] = Type::getVoidTy();

        // 2. Int 类型
        funcRetTypes["getint"] = Type::getInt32Ty();
        funcRetTypes["getch"] = Type::getInt32Ty();
        funcRetTypes["getarray"] = Type::getInt32Ty();
        funcRetTypes["getfarray"] = Type::getInt32Ty();

        // 3. Float 类型
        funcRetTypes["getfloat"] = Type::getFloatTy();
    }

    std::string getIR() const { return module->print(); }

    antlrcpp::Any visitCompUnit(SysYParser::CompUnitContext *ctx) override
    {
        // --- Pass 1: 扫描所有函数定义，注册函数类型 ---
        // 这解决了 main 调用后面定义的函数时类型未知的问题
        for (auto child : ctx->children)
        {
            if (auto func = dynamic_cast<SysYParser::FuncDefContext *>(child))
            {
                std::string name = getTokenText(func->IDENT());
                std::string typeStr = func->funcType()->getText();

                Type *retType = Type::getInt32Ty();
                if (typeStr == "void")
                {
                    retType = Type::getVoidTy();
                    voidFuncs.insert(name);
                }
                else if (typeStr == "float")
                {
                    retType = Type::getFloatTy();
                }

                // 记录函数返回类型
                funcRetTypes[name] = retType;
            }
        }

        // --- Pass 2: 生成代码 ---
        for (auto child : ctx->children)
        {
            if (auto func = dynamic_cast<SysYParser::FuncDefContext *>(child))
                visit(func);
            else if (auto decl = dynamic_cast<SysYParser::DeclContext *>(child))
                visit(decl);
            else if (auto st = dynamic_cast<SysYParser::StructDefContext *>(child))
                visit(st);
        }
        return nullptr;
    }

    antlrcpp::Any visitStructDef(SysYParser::StructDefContext *ctx) override
    {
        std::string name = ctx->IDENT()->getText();

        std::vector<Type *> memberTypes;
        std::vector<std::string> memberNames;

        for (auto memberCtx : ctx->memberDef())
        {
            Type *baseType = getBType(memberCtx->bType());
            std::string memberName = memberCtx->IDENT()->getText();

            std::vector<int> dims;
            for (auto exp : memberCtx->constExp())
            {
                dims.push_back(evalConstExp(exp->exp()));
            }

            Type *type = baseType;
            for (auto it = dims.rbegin(); it != dims.rend(); ++it)
            {
                type = Type::getArrayTy(type, *it);
            }

            memberTypes.push_back(type);
            memberNames.push_back(memberName);
        }

        Type *structType = Type::getStructTy(name, memberTypes);
        if (!symbolTable.addStruct(name, structType, memberNames))
        {
            std::cerr << "Redefinition of struct " << name << std::endl;
        }

        std::stringstream ss;
        ss << structType->toString() << " = type { ";
        for (size_t i = 0; i < memberTypes.size(); ++i)
        {
            if (i > 0)
                ss << ", ";
            ss << memberTypes[i]->toString();
        }
        ss << " }";
        module->globalLines.push_back(ss.str());

        return nullptr;
    }

    antlrcpp::Any visitFuncDef(SysYParser::FuncDefContext *ctx) override
    {
        std::string name = ctx->IDENT()->getText();

        // 1. Return Type
        std::string typeStr = ctx->funcType()->getText();
        TypePtr returnType;
        if (typeStr == "void")
        {
            returnType = Type::getVoidTy();
            voidFuncs.insert(name);
        }
        else if (typeStr == "float")
        {
            returnType = Type::getFloatTy();
        }
        else
        {
            returnType = Type::getInt32Ty();
        }
        funcRetTypes[name] = returnType;

        currentFunction = new Function(returnType, name);
        module->addFunction(std::unique_ptr<Function>(currentFunction));
        symbolTable.enterScope();

        // Entry Block
        BasicBlock *entryBB = new BasicBlock(getUniqueBasicBlockName("entry"));
        currentFunction->addBasicBlock(entryBB);
        builder.setInsertPoint(entryBB);
        builder.reset();

        // 2. Params
        int argIndex = 0;
        if (ctx->funcFParams())
        {
            for (auto param : ctx->funcFParams()->funcFParam())
            {
                std::string paramName = param->IDENT()->getText();
                std::string argReg = "%arg" + std::to_string(argIndex);

                Type *baseType = getBType(param->bType());

                bool isArrayDecl = !param->L_BRACK().empty();
                bool isPtrDecl = (param->pointerPrefix() != nullptr);

                std::vector<int> dims;
                if (isArrayDecl)
                {
                    dims.push_back(0);
                    for (auto expr : param->exp())
                    {
                        dims.push_back(evalConstExp(expr));
                    }
                }

                Type *paramType = baseType;
                if (isArrayDecl)
                {
                    for (size_t k = dims.size() - 1; k >= 1; --k)
                    {
                        paramType = Type::getArrayTy(paramType, dims[k]);
                    }
                    paramType = Type::getPointerTy(paramType);
                }
                else if (isPtrDecl)
                {
                    paramType = Type::getPointerTy(paramType);
                }

                currentFunction->args.push_back(argReg);
                currentFunction->argTypes.push_back(paramType);

                ValuePtr allocaPtr = builder.CreateAlloca(paramType);
                ValuePtr argVal = new Value(paramType, argReg);
                builder.CreateStore(argVal, allocaPtr);

                symbolTable.addSymbol(paramName, paramType, allocaPtr, false, 0, 0.0f, isArrayDecl, dims, isPtrDecl || isArrayDecl);

                argIndex++;
            }
            builder.regCounter = argIndex;
        }

        // Body
        if (ctx->block())
        {
            for (auto item : ctx->block()->blockItem())
                visit(item);
        }

        // Return fix
        if (!builder.getInsertBlock()->isTerminated())
        {
            if (returnType->isVoidTy())
                builder.CreateVoidRet();
            else if (returnType->isFloatTy())
                builder.CreateRet(ConstantFloat::get(0.0f));
            else
                builder.CreateRet(ConstantInt::get(0));
        }

        symbolTable.exitScope();
        currentFunction = nullptr;
        return nullptr;
    }

    antlrcpp::Any visitBlock(SysYParser::BlockContext *ctx) override
    {
        symbolTable.enterScope();
        for (auto item : ctx->blockItem())
            visit(item);
        symbolTable.exitScope();
        return nullptr;
    }

    antlrcpp::Any visitAssignStmt(SysYParser::AssignStmtContext *ctx) override
    {
        ValuePtr ptr = getLValPointer(ctx->lVal());
        ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp()));
        if (ptr && rhs)
            builder.CreateStore(rhs, ptr);
        return nullptr;
    }

    antlrcpp::Any visitExpStmt(SysYParser::ExpStmtContext *ctx) override
    {
        if (ctx->exp())
            visit(ctx->exp());
        return nullptr;
    }

    antlrcpp::Any visitDecl(SysYParser::DeclContext *ctx) override
    {
        if (ctx->constDecl())
            return visit(ctx->constDecl());
        if (ctx->varDecl())
            return visit(ctx->varDecl());
        if (ctx->structDecl())
            return visit(ctx->structDecl());
        return nullptr;
    }

    antlrcpp::Any visitConstDecl(SysYParser::ConstDeclContext *ctx) override
    {
        Type *baseType = getBType(ctx->bType());

        for (auto def : ctx->constDef())
        {
            std::string name = getTokenText(def->IDENT());

            if (!def->L_BRACK().empty())
            {
                std::vector<int> dims;
                for (auto d : def->constExp())
                {
                    dims.push_back(evalConstExp(d->exp()));
                }

                Type *fullType = baseType;
                for (auto it = dims.rbegin(); it != dims.rend(); ++it)
                {
                    fullType = Type::getArrayTy(fullType, *it);
                }

                int totalSize = getTypeSize(fullType);
                std::vector<int> initValues(totalSize, 0);
                if (def->constInitVal())
                {
                    int currentIdx = 0;
                    flattenConstInitVal(initValues, currentIdx, def->constInitVal(), dims, 0, false);
                }

                if (currentFunction)
                {
                    // Local
                    ValuePtr ptr = builder.CreateAlloca(fullType);
                    symbolTable.addSymbol(name, fullType, ptr, true, 0, 0.0f, true, dims);

                    Type *flatPtrTy = Type::getPointerTy(Type::getInt32Ty());
                    ValuePtr flatPtr = builder.CreateBitCast(ptr, flatPtrTy);

                    for (int i = 0; i < totalSize; ++i)
                    {
                        ValuePtr idxVal = new ConstantInt(i);
                        std::vector<ValuePtr> idxs = {idxVal};
                        ValuePtr elemPtr = builder.CreateInBoundsGEP(flatPtr, idxs, Type::getInt32Ty());
                        builder.CreateStore(ConstantInt::get(initValues[i]), elemPtr);
                    }
                }
                else
                {
                    // Global
                    std::stringstream ss;
                    int offset = 0;
                    std::string initStr = printGlobalConstInit(fullType, initValues, offset);

                    ss << "@" << name << " = dso_local constant " << initStr << ", align 16";
                    module->globalLines.push_back(ss.str());

                    ValuePtr ptr = new Value(Type::getPointerTy(fullType), "@" + name);
                    symbolTable.addSymbol(name, fullType, ptr, true, 0, 0.0f, true, dims);
                }
                continue;
            }

            // Scalar
            if (!def->constInitVal()->constExp())
                continue;

            if (currentFunction)
            {
                ValuePtr ptr = createEntryBlockAlloca(baseType);
                if (baseType->isFloatTy())
                {
                    float fval = evalFloatConstExp(def->constInitVal()->constExp()->exp());
                    builder.CreateStore(ConstantFloat::get(fval), ptr);
                    symbolTable.addSymbol(name, baseType, ptr, true, 0, fval);
                }
                else
                {
                    int val = evalConstExp(def->constInitVal()->constExp()->exp());
                    builder.CreateStore(ConstantInt::get(val), ptr);
                    symbolTable.addSymbol(name, baseType, ptr, true, val);
                }
            }
            else
            {
                std::string ir;
                if (baseType->isFloatTy())
                {
                    float fval = evalFloatConstExp(def->constInitVal()->constExp()->exp());
                    ir = "@" + name + " = dso_local constant float " + ConstantFloat::get(fval)->to_string() + ", align 4";
                    ValuePtr ptr = new Value(Type::getPointerTy(baseType), "@" + name);
                    symbolTable.addSymbol(name, baseType, ptr, true, 0, fval);
                }
                else
                {
                    int val = evalConstExp(def->constInitVal()->constExp()->exp());
                    ir = "@" + name + " = dso_local constant i32 " + std::to_string(val) + ", align 4";
                    ValuePtr ptr = new Value(Type::getPointerTy(baseType), "@" + name);
                    symbolTable.addSymbol(name, baseType, ptr, true, val);
                }
                module->globalLines.push_back(ir);
            }
        }
        return nullptr;
    }

    int getTypeSize(Type *t)
    {
        if (t->isArrayTy())
            return t->arraySize * getTypeSize(t->elementType);
        return 1;
    }

    void processArrayInit(SysYParser::InitValContext *ctx, Type *type, int &offset, ValuePtr flatBasePtr)
    {
        Type *scalarTy = flatBasePtr->getType()->elementType;

        if (ctx->exp())
        {
            ValuePtr val = std::any_cast<ValuePtr>(visit(ctx->exp()));
            if (!val)
                return;
            val = ensureType(val, scalarTy);
            std::vector<ValuePtr> idxs = {ConstantInt::get(offset)};
            ValuePtr elemPtr = builder.CreateInBoundsGEP(flatBasePtr, idxs, scalarTy);
            builder.CreateStore(val, elemPtr);
            offset++;
            return;
        }

        int startOffset = offset;
        // Braces
        for (auto child : ctx->initVal())
        {
            if (child->exp())
            {
                // Element is scalar
                processArrayInit(child, type, offset, flatBasePtr);
            }
            else
            {
                Type *subType = type->isArrayTy() ? type->elementType : type;
                processArrayInit(child, subType, offset, flatBasePtr);
            }
        }

        int currentSize = getTypeSize(type);
        int endOffset = startOffset + currentSize;
        while (offset < endOffset)
        {
            std::vector<ValuePtr> idxs = {ConstantInt::get(offset)};
            ValuePtr elemPtr = builder.CreateInBoundsGEP(flatBasePtr, idxs, scalarTy);
            ValuePtr zero = scalarTy->isFloatTy() ? (ValuePtr)ConstantFloat::get(0.0f) : (ValuePtr)ConstantInt::get(0);
            builder.CreateStore(zero, elemPtr);
            offset++;
        }
    }

    std::string printGlobalConstInit(Type *type, const std::vector<int> &data, int &offset)
    {
        if (!type->isArrayTy())
        {
            return "i32 " + std::to_string(data[offset++]);
        }
        std::stringstream ss;
        ss << type->toString() << " [";
        int elemCount = type->arraySize;
        Type *elemType = type->elementType;
        for (int i = 0; i < elemCount; ++i)
        {
            ss << printGlobalConstInit(elemType, data, offset);
            if (i < elemCount - 1)
                ss << ", ";
        }
        ss << "]";
        return ss.str();
    }

    antlrcpp::Any visitVarDecl(SysYParser::VarDeclContext *ctx) override
    {
        Type *baseType = getBType(ctx->bType());

        for (auto def : ctx->varDef())
        {
            std::string name = def->IDENT()->getText();

            // 1. Pointer Declaration (int *p)
            bool isPtrDecl = (def->pointerPrefix() != nullptr);
            if (isPtrDecl)
            {
                Type *ptrType = Type::getPointerTy(baseType);

                if (currentFunction)
                {
                    ValuePtr allocaPtr = builder.CreateAlloca(ptrType);
                    symbolTable.addSymbol(name, ptrType, allocaPtr, false, 0, 0.0f, false, {}, true);

                    if (def->ASSIGN() && def->initVal())
                    {
                        if (def->initVal()->exp())
                        {
                            ValuePtr initVal = std::any_cast<ValuePtr>(visit(def->initVal()->exp()));
                            builder.CreateStore(initVal, allocaPtr);
                        }
                    }
                }
                continue;
            }

            // 2. Scalar or Array
            std::vector<int> dims;
            bool isArray = !def->L_BRACK().empty();
            Type *fullType = baseType;
            int totalElemCount = 1;

            if (isArray)
            {
                for (auto d : def->constExp())
                {
                    int sz = evalConstExp(d->exp());
                    dims.push_back(sz);
                    totalElemCount *= sz;
                }
                for (auto it = dims.rbegin(); it != dims.rend(); ++it)
                {
                    fullType = Type::getArrayTy(fullType, *it);
                }
            }

            if (currentFunction)
            {
                // Local Variable
                ValuePtr ptr = builder.CreateAlloca(fullType);
                symbolTable.addSymbol(name, fullType, ptr, false, 0, 0.0f, isArray, dims);

                if (def->ASSIGN() && def->initVal())
                {
                    if (isArray)
                    {
                        // Local Array Initialization
                        Type *flatPtrTy = Type::getPointerTy(baseType->isFloatTy() ? Type::getFloatTy() : Type::getInt32Ty());
                        ValuePtr flatPtr = builder.CreateBitCast(ptr, flatPtrTy);
                        int offset = 0;
                        processArrayInit(def->initVal(), fullType, offset, flatPtr);
                    }
                    else
                    {
                        // Scalar Init
                        ValuePtr initVal = std::any_cast<ValuePtr>(visit(def->initVal()->exp()));
                        builder.CreateStore(initVal, ptr);
                    }
                }
            }
            else
            {
                // Global Variable
                std::stringstream ss;
                ss << "@" << name << " = dso_local global " << fullType->toString() << " ";

                if (def->ASSIGN() && def->initVal())
                {
                    if (!isArray)
                    {
                        if (baseType->isFloatTy())
                        {
                            float val = evalFloatConstExp(def->initVal()->exp());
                            ss << ConstantFloat::get(val)->to_string();
                        }
                        else
                        {
                            int val = evalConstExp(def->initVal()->exp());
                            ss << val;
                        }
                    }
                    else
                    {
                        // Global Array Init (Support 1D explicit init)
                        if (dims.size() == 1 && def->initVal() && !def->initVal()->exp())
                        {
                            std::stringstream ssInit;
                            ssInit << "[";
                            int total = dims[0];
                            int count = 0;
                            auto children = def->initVal()->initVal();
                            for (auto child : children)
                            {
                                if (child->exp())
                                {
                                    if (baseType->isFloatTy())
                                    {
                                        float val = evalFloatConstExp(child->exp());
                                        ssInit << "float " << ConstantFloat::get(val)->to_string();
                                    }
                                    else
                                    {
                                        int val = evalConstExp(child->exp());
                                        ssInit << "i32 " << val;
                                    }
                                }
                                else
                                {
                                    // Nested brace in 1D array?
                                    ssInit << (baseType->isFloatTy() ? "float 0.0" : "i32 0");
                                }
                                count++;
                                if (count < total)
                                    ssInit << ", ";
                            }
                            while (count < total)
                            {
                                ssInit << (baseType->isFloatTy() ? "float 0.0" : "i32 0");
                                count++;
                                if (count < total)
                                    ssInit << ", ";
                            }
                            ssInit << "]";
                            ss << ssInit.str();
                        }
                        else
                        {
                            ss << "zeroinitializer";
                        }
                    }
                }
                else
                {
                    ss << "zeroinitializer";
                }

                ss << ", align 4";
                module->globalLines.push_back(ss.str());

                ValuePtr ptr = new Value(Type::getPointerTy(fullType), "@" + name);
                symbolTable.addSymbol(name, fullType, ptr, false, 0, 0.0f, isArray, dims);
            }
        }
        return nullptr;
    }

    antlrcpp::Any visitReturnStmt(SysYParser::ReturnStmtContext *ctx) override
    {
        if (ctx->exp())
        {
            // 有返回值的 return
            ValuePtr val = std::any_cast<ValuePtr>(visit(ctx->exp()));
            if (currentFunction && val)
            {
                val = ensureType(val, currentFunction->returnType);
            }

            if (val)
                builder.CreateRet(val);
        }
        else
        {
            // 无返回值的 return
            if (currentFunction && currentFunction->returnType->isVoidTy())
            {
                builder.CreateVoidRet(); // 生成 ret void
            }
            else
            {
                builder.CreateRet(new ConstantInt(0)); // 兼容旧逻辑，默认 ret 0
            }
        }
        return nullptr;
    }

    antlrcpp::Any visitNumberExp(SysYParser::NumberExpContext *ctx) override
    {
        // [修复] 获取完整文本，无论是 IntConst 还是 FloatConst
        std::string text = ctx->number()->getText();

        // 判断是否为浮点数（包含小数点或指数 e/E）
        if (text.find('.') != std::string::npos ||
            text.find('e') != std::string::npos ||
            text.find('E') != std::string::npos)
        {
            float val = parseFloat(text);
            return (ValuePtr)ConstantFloat::get(val);
        }

        // 否则当作整数处理
        int val = parseInteger(text);
        return (ValuePtr) new ConstantInt(val);
    }

    antlrcpp::Any visitLValExp(SysYParser::LValExpContext *ctx) override
    {
        std::string name = getTokenText(ctx->lVal()->IDENT(0));
        SymbolInfo *info = symbolTable.lookup(name);

        if (info && info->isConst && !info->isArray)
        {
            return (ValuePtr) new ConstantInt(info->constIntVal);
        }

        ValuePtr ptr = getLValPointer(ctx->lVal());
        if (!ptr)
            return (ValuePtr) new ConstantInt(0);

        // 数组名退化为指针 (Array Decay)
        if (info && info->isArray)
        {
            int indices = ctx->lVal()->L_BRACK().size();
            int dims = info->dims.size();
            // 当提供的下标数量少于数组维度时（通常是作为参数传递数组名）
            if (indices < dims)
            {
                // 情况 1: 指针参数 (int arr[] 或 int *p)
                // ptr 是 i32** (参数变量在栈上的地址)
                // 我们需要传递的是它存的值 (i32*)
                if (info->isPointer)
                {
                    return builder.CreateLoad(ptr);
                }

                // 情况 2: 普通数组 (int a[10])
                // ptr 是 [10 x i32]* (数组首地址)
                // 使用 GEP 获取 &a[0] (i32*)
                if (!info->isPointer && ctx->lVal()->L_BRACK().empty())
                {
                    int totalSize = 1;
                    for (int d : info->dims)
                        totalSize *= d;
                    return builder.CreateGEP(ptr, new ConstantInt(0), totalSize);
                }

                return ptr;
            }
        }

        // 普通变量或解引用：读取值
        return builder.CreateLoad(ptr);
    }

    antlrcpp::Any visitAddSubExp(SysYParser::AddSubExpContext *ctx) override
    {
        auto lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        auto rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));

        // 检查是否涉及浮点数
        bool isFloat = lhs->getType()->isFloatTy() || rhs->getType()->isFloatTy();

        if (isFloat)
        {
            // 只要有一方是 float，两边都转 float
            lhs = ensureType(lhs, Type::getFloatTy());
            rhs = ensureType(rhs, Type::getFloatTy());

            // 生成 fadd / fsub
            if (ctx->PLUS())
                return builder.CreateFAdd(lhs, rhs);
            else
                return builder.CreateFSub(lhs, rhs);
        }
        else
        {
            // 纯整数情况 (保持原有常数折叠逻辑或直接生成指令)
            // 简单起见直接生成指令，优化交给 LLVM 后端或你的 ConstantInt 检查
            if (ctx->PLUS())
                return builder.CreateAdd(lhs, rhs);
            else
                return builder.CreateSub(lhs, rhs);
        }
    }

    antlrcpp::Any visitMulDivModExp(SysYParser::MulDivModExpContext *ctx) override
    {
        ValuePtr lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));
        if (!lhs || !rhs)
        {
            return (ValuePtr) nullptr;
        }

        bool isFloat = lhs->getType()->isFloatTy() || rhs->getType()->isFloatTy();
        if (isFloat)
        {
            lhs = ensureType(lhs, Type::getFloatTy());
            rhs = ensureType(rhs, Type::getFloatTy());

            if (ctx->MOD())
            {
                // SysY 语言规范通常不支持浮点取模。
                // 如果需要支持，LLVM 指令是 "frem"
                std::cerr << "Error: Modulo operator on floating point numbers is invalid." << std::endl;
                return (ValuePtr) nullptr;
            }

            std::string op = ctx->MUL() ? "fmul" : "fdiv";
            return builder.CreateBinary(op, lhs, rhs);
        }

        auto c1 = dynamic_cast<ConstantInt *>(lhs);
        auto c2 = dynamic_cast<ConstantInt *>(rhs);
        if (c1 && c2)
        {
            if (ctx->MUL())
                return (ValuePtr) new ConstantInt(c1->value * c2->value);
            if (c2->value != 0)
            {
                if (ctx->DIV())
                    return (ValuePtr) new ConstantInt(c1->value / c2->value);
                if (ctx->MOD())
                    return (ValuePtr) new ConstantInt(c1->value % c2->value);
            }
        }

        std::string op = ctx->MUL() ? "mul" : (ctx->DIV() ? "sdiv" : "srem");
        auto inst = builder.CreateBinary(op, lhs, rhs);
        return (ValuePtr)inst;
    }

    antlrcpp::Any visitUnaryExp(SysYParser::UnaryExpContext *ctx) override
    {
        // 1. 处理取地址 & (Address-Of)
        // 必须优先处理，因为我们需要的是地址而不是值
        if (ctx->BITAND())
        {
            // 语法检查：& 后面必须是左值 (例如 &a, &arr[0])
            // 虽然 parser 允许 &exp，但在语义上只能是 &lVal
            if (auto lValExp = dynamic_cast<SysYParser::LValExpContext *>(ctx->exp()))
            {
                // 获取左值的地址，不进行 load
                return getLValPointer(lValExp->lVal());
            }
            else
            {
                std::cerr << "Error: operand of '&' must be an l-value" << std::endl;
                return (ValuePtr) nullptr;
            }
        }
        if (ctx->PLUS())
            return visit(ctx->exp());

        ValuePtr val = std::any_cast<ValuePtr>(visit(ctx->exp()));
        if (!val)
            return (ValuePtr) nullptr;

        // 1. 常量折叠优化 (增加 Float 支持)
        if (auto cInt = dynamic_cast<ConstantInt *>(val))
        {
            if (ctx->MINUS())
                return (ValuePtr) new ConstantInt(-cInt->value);
            if (ctx->NOT())
                return (ValuePtr) new ConstantInt(!cInt->value);
        }
        if (auto cFloat = dynamic_cast<ConstantFloat *>(val))
        {
            if (ctx->MINUS())
                return (ValuePtr)ConstantFloat::get(-cFloat->value);
            // !float 通常语义为 val == 0.0
            if (ctx->NOT())
                return (ValuePtr) new ConstantInt(cFloat->value == 0.0f);
        }

        // 2. 指令生成
        if (ctx->MINUS())
        {
            // [修复] 根据类型生成 fsub 或 sub
            if (val->getType()->isFloatTy())
            {
                ValuePtr zero = ConstantFloat::get(0.0f);
                return builder.CreateBinary("fsub", zero, val);
            }
            else
            {
                ValuePtr zero = new ConstantInt(0);
                return builder.CreateBinary("sub", zero, val);
            }
        }
        if (ctx->NOT())
        {
            // [修复] 根据类型生成 fcmp 或 icmp
            ValuePtr zero = val->getType()->isFloatTy() ? (ValuePtr)ConstantFloat::get(0.0f) : (ValuePtr) new ConstantInt(0);

            ValuePtr cmp;
            if (val->getType()->isFloatTy())
            {
                // 浮点数判 0 使用 fcmp oeq (Ordered Equal)
                cmp = builder.CreateFCmp("oeq", val, zero);
            }
            else
            {
                cmp = builder.CreateICmp("eq", val, zero);
            }
            return builder.CreateZExt(cmp);
        }
        return val;
    }

    antlrcpp::Any visitRelExp(SysYParser::RelExpContext *ctx) override
    {
        auto lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        auto rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));

        bool isFloat = lhs->getType()->isFloatTy() || rhs->getType()->isFloatTy();
        ValuePtr cmpRes;

        if (isFloat)
        {
            lhs = ensureType(lhs, Type::getFloatTy());
            rhs = ensureType(rhs, Type::getFloatTy());

            std::string op;
            if (ctx->LT())
                op = "olt"; // Ordered Less Than
            else if (ctx->GT())
                op = "ogt"; // Ordered Greater Than
            else if (ctx->LE())
                op = "ole";
            else if (ctx->GE())
                op = "oge";

            cmpRes = builder.CreateFCmp(op, lhs, rhs);
        }
        else
        {
            std::string op;
            if (ctx->LT())
                op = "slt";
            else if (ctx->GT())
                op = "sgt";
            else if (ctx->LE())
                op = "sle";
            else if (ctx->GE())
                op = "sge";

            cmpRes = builder.CreateICmp(op, lhs, rhs);
        }

        // 关系表达式在 C/SysY 中返回 i32 (0 或 1)
        return builder.CreateZExt(cmpRes, Type::getInt32Ty());
    }

    antlrcpp::Any visitEqNeqExp(SysYParser::EqNeqExpContext *ctx) override
    {
        ValuePtr lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));
        if (!lhs || !rhs)
            return (ValuePtr) nullptr;

        // [修复] 检查是否涉及浮点数
        bool isFloat = lhs->getType()->isFloatTy() || rhs->getType()->isFloatTy();
        ValuePtr cmp;

        if (isFloat)
        {
            // 1. 类型统一转为 float
            lhs = ensureType(lhs, Type::getFloatTy());
            rhs = ensureType(rhs, Type::getFloatTy());

            // 2. 选择浮点比较谓词
            // == 使用 oeq (Ordered and Equal)
            // != 使用 une (Unordered or Not Equal) - 这样处理 NaN 比较更符合直觉
            std::string op = ctx->EQ() ? "oeq" : "une";

            // 3. 生成 fcmp 指令
            cmp = builder.CreateFCmp(op, lhs, rhs);
        }
        else
        {
            // 整数情况保持不变
            std::string op = ctx->EQ() ? "eq" : "ne";
            cmp = builder.CreateICmp(op, lhs, rhs);
        }

        // fcmp/icmp 返回 i1，需要 zext 扩展为 i32 (0 或 1)
        return builder.CreateZExt(cmp);
    }

    antlrcpp::Any visitParenExp(SysYParser::ParenExpContext *ctx) override
    {
        return visit(ctx->exp());
    }

    antlrcpp::Any visitFuncCallExp(SysYParser::FuncCallExpContext *ctx) override
    {
        std::string funcName = getTokenText(ctx->IDENT());
        std::vector<ValuePtr> args;

        if (ctx->funcRParams())
        {
            for (auto expCtx : ctx->funcRParams()->exp())
            {
                ValuePtr argVal = std::any_cast<ValuePtr>(visit(expCtx));
                args.push_back(argVal);
            }
        }

        // Fix for Array Decay in Function Calls (e.g. passing array to getarray or user function)
        // Check user functions
        Function *callee = nullptr;
        for (const auto &f : module->funcList)
        {
            // f->name stores "@name"
            if (f->name == "@" + funcName)
            {
                callee = f.get();
                break;
            }
        }

        auto decayArray = [&](int idx, Type *targetElemTy)
        {
            if (idx < args.size())
            {
                Type *argTy = args[idx]->getType();
                if (argTy->isPointerTy() && argTy->elementType->isArrayTy())
                {
                    // Check if decaying gives target type (simplistic)
                    std::vector<ValuePtr> idxs = {ConstantInt::get(0), ConstantInt::get(0)};
                    args[idx] = builder.CreateInBoundsGEP(args[idx], idxs, argTy->elementType->elementType);
                }
            }
        };

        if (callee)
        {
            for (size_t i = 0; i < args.size() && i < callee->argTypes.size(); ++i)
            {
                Type *paramTy = callee->argTypes[i];
                if (paramTy->isPointerTy() && !paramTy->elementType->isArrayTy())
                {
                    // Expected i32*, got [N x i32]* -> Decay
                    decayArray(i, paramTy->elementType);
                }
                args[i] = ensureType(args[i], paramTy);
            }
        }
        else
        {
            // Library functions
            if (funcName == "getarray" || funcName == "getfarray")
            {
                decayArray(0, nullptr);
            }
            if (funcName == "putarray" || funcName == "putfarray")
            {
                decayArray(1, nullptr);
            }
            // putfloat/putint logic...
            if (funcName == "putfloat" && args.size() == 1)
            {
                args[0] = ensureType(args[0], Type::getFloatTy());
            }
            else if ((funcName == "putint" || funcName == "putch") && args.size() == 1)
            {
                args[0] = ensureType(args[0], Type::getInt32Ty());
            }
        }

        Type *retType = Type::getInt32Ty();
        if (funcRetTypes.find(funcName) != funcRetTypes.end())
        {
            retType = funcRetTypes[funcName];
        }
        else
        {
            // Assume i32 for external
        }

        return builder.CreateCall(funcName, args, retType);
    }
    // 修复逻辑与表达式（&&）
    antlrcpp::Any visitLandExp(SysYParser::LandExpContext *ctx) override
    {
        // 短路求值：左操作数为false则结果为false

        // 计算左操作数
        ValuePtr lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        if (!lhs)
            return (ValuePtr) nullptr;

        // 常量折叠优化
        auto lhsConst = dynamic_cast<ConstantInt *>(lhs);
        if (lhsConst)
        {
            if (lhsConst->value == 0)
            {
                // 左操作数为false，短路返回0
                return (ValuePtr) new ConstantInt(0);
            }
            else
            {
                // 左操作数为true，需要计算右操作数
                ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));
                if (!rhs)
                    return (ValuePtr) nullptr;

                auto rhsConst = dynamic_cast<ConstantInt *>(rhs);
                if (rhsConst)
                {
                    // 右操作数也是常量，直接计算结果
                    return (ValuePtr) new ConstantInt(rhsConst->value != 0 ? 1 : 0);
                }
            }
        }

        // 获取当前基本块作为左操作数计算后的块
        BasicBlock *lhsBB = builder.getInsertBlock();

        // 创建新基本块
        BasicBlock *rhsBB = new BasicBlock(getUniqueBasicBlockName("land.rhs"));
        BasicBlock *mergeBB = new BasicBlock(getUniqueBasicBlockName("land.merge"));

        // 将左操作数转换为布尔值（i1类型）
        ValuePtr zero = new ConstantInt(0);
        ValuePtr lhsBool = builder.CreateICmp("ne", lhs, zero);

        // 条件跳转：lhs为true时计算rhs，为false时跳转到merge
        builder.CreateCondBr(lhsBool, rhsBB, mergeBB);

        // 处理右操作数
        currentFunction->addBasicBlock(rhsBB);
        builder.setInsertPoint(rhsBB);

        ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));
        if (!rhs)
            return (ValuePtr) nullptr;

        // 将右操作数转换为布尔值（0或1）
        ValuePtr rhsBool = builder.CreateICmp("ne", rhs, zero);
        ValuePtr rhsResult = builder.CreateZExt(rhsBool); // 将i1转换为i32

        builder.CreateBr(mergeBB);

        BasicBlock *rhsEndBB = builder.getInsertBlock();

        // 合并块
        currentFunction->addBasicBlock(mergeBB);
        builder.setInsertPoint(mergeBB);

        // 创建phi节点合并结果
        auto phi = builder.CreatePhi(Type::getInt32Ty());

        // 添加前驱块的值
        // 来自lhs为false的情况：结果为0
        phi->addIncoming(new ConstantInt(0), lhsBB);
        // 来自rhs计算的情况：结果为rhsResult
        phi->addIncoming(rhsResult, rhsEndBB);

        return (ValuePtr)phi;
    }

    // 修复逻辑或表达式（||）
    antlrcpp::Any visitLorExp(SysYParser::LorExpContext *ctx) override
    {
        // 短路求值：左操作数为true则结果为true

        // 计算左操作数
        ValuePtr lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        if (!lhs)
            return (ValuePtr) nullptr;

        // 常量折叠优化
        auto lhsConst = dynamic_cast<ConstantInt *>(lhs);
        if (lhsConst)
        {
            if (lhsConst->value != 0)
            {
                // 左操作数为true，短路返回1
                return (ValuePtr) new ConstantInt(1);
            }
            else
            {
                // 左操作数为false，需要计算右操作数
                ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));
                if (!rhs)
                    return (ValuePtr) nullptr;

                auto rhsConst = dynamic_cast<ConstantInt *>(rhs);
                if (rhsConst)
                {
                    // 右操作数也是常量，直接计算结果
                    return (ValuePtr) new ConstantInt(rhsConst->value != 0 ? 1 : 0);
                }
            }
        }

        // 获取当前基本块作为左操作数计算后的块
        BasicBlock *lhsBB = builder.getInsertBlock();

        // 创建新基本块
        BasicBlock *rhsBB = new BasicBlock(getUniqueBasicBlockName("lor.rhs"));
        BasicBlock *mergeBB = new BasicBlock(getUniqueBasicBlockName("lor.merge"));

        // 将左操作数转换为布尔值（i1类型）
        ValuePtr zero = new ConstantInt(0);
        ValuePtr lhsBool = builder.CreateICmp("ne", lhs, zero);

        // 条件跳转：lhs为true时跳转到merge，为false时计算rhs
        builder.CreateCondBr(lhsBool, mergeBB, rhsBB);

        // 处理右操作数
        currentFunction->addBasicBlock(rhsBB);
        builder.setInsertPoint(rhsBB);

        ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));
        if (!rhs)
            return (ValuePtr) nullptr;

        // 将右操作数转换为布尔值（0或1）
        ValuePtr rhsBool = builder.CreateICmp("ne", rhs, zero);
        ValuePtr rhsResult = builder.CreateZExt(rhsBool); // 将i1转换为i32

        builder.CreateBr(mergeBB);

        BasicBlock *rhsEndBB = builder.getInsertBlock();

        // 合并块
        currentFunction->addBasicBlock(mergeBB);
        builder.setInsertPoint(mergeBB);

        // 创建phi节点合并结果
        auto phi = builder.CreatePhi(Type::getInt32Ty());

        // 添加前驱块的值
        // 来自lhs为true的情况：结果为1
        phi->addIncoming(new ConstantInt(1), lhsBB);
        // 来自rhs计算的情况：结果为rhsResult
        phi->addIncoming(rhsResult, rhsEndBB);

        return (ValuePtr)phi;
    }

    // 新增：if语句（需要支持else）
    antlrcpp::Any visitIfStmt(SysYParser::IfStmtContext *ctx) override
    {
        static int ifCounter = 0;
        int currentIf = ifCounter++;

        // 计算条件表达式
        ValuePtr cond = std::any_cast<ValuePtr>(visit(ctx->cond()));
        if (!cond)
            return nullptr;

        // 将条件转换为布尔值
        ValuePtr zero = new ConstantInt(0);
        ValuePtr condBool = builder.CreateICmp("ne", cond, zero);

        // 创建基本块
        BasicBlock *thenBB = new BasicBlock("if.then" + std::to_string(currentIf));
        BasicBlock *elseBB = ctx->ELSE() ? new BasicBlock("if.else" + std::to_string(currentIf)) : nullptr;
        BasicBlock *mergeBB = new BasicBlock("if.merge" + std::to_string(currentIf));

        // 条件跳转
        if (elseBB)
        {
            builder.CreateCondBr(condBool, thenBB, elseBB);
        }
        else
        {
            builder.CreateCondBr(condBool, thenBB, mergeBB);
        }

        // then分支
        currentFunction->addBasicBlock(thenBB);
        builder.setInsertPoint(thenBB);
        visit(ctx->stmt(0)); // 处理then语句

        // 检查基本块是否已终止（如果有return语句）
        if (!builder.getInsertBlock()->isTerminated())
        {
            builder.CreateBr(mergeBB); // 只有未终止时才添加跳转
        }

        // else分支（如果有）
        if (elseBB)
        {
            currentFunction->addBasicBlock(elseBB);
            builder.setInsertPoint(elseBB);
            visit(ctx->stmt(1)); // 处理else语句
            if (!builder.getInsertBlock()->isTerminated())
            {
                builder.CreateBr(mergeBB);
            }
        }

        // 合并块
        currentFunction->addBasicBlock(mergeBB);
        builder.setInsertPoint(mergeBB);

        return nullptr;
    }

    // 新增：while语句
    antlrcpp::Any visitWhileStmt(SysYParser::WhileStmtContext *ctx) override
    {
        // 为当前循环生成唯一ID
        static int whileCounter = 0;
        int currentWhile = whileCounter++;

        // 保存当前循环上下文
        BasicBlock *prevCondBB = condBlockStack.empty() ? nullptr : condBlockStack.top();
        BasicBlock *prevMergeBB = mergeBlockStack.empty() ? nullptr : mergeBlockStack.top();

        // 创建循环基本块，使用唯一名称
        BasicBlock *condBB = new BasicBlock("while.cond." + std::to_string(currentWhile));
        BasicBlock *bodyBB = new BasicBlock("while.body." + std::to_string(currentWhile));
        BasicBlock *mergeBB = new BasicBlock("while.merge." + std::to_string(currentWhile));

        // 设置当前循环上下文
        condBlockStack.push(condBB);
        mergeBlockStack.push(mergeBB);

        // 跳转到条件判断
        builder.CreateBr(condBB);

        // 条件块
        currentFunction->addBasicBlock(condBB);
        builder.setInsertPoint(condBB);
        ValuePtr cond = std::any_cast<ValuePtr>(visit(ctx->cond()));
        if (!cond)
            return nullptr;

        ValuePtr zero = new ConstantInt(0);
        ValuePtr condBool = builder.CreateICmp("ne", cond, zero);
        builder.CreateCondBr(condBool, bodyBB, mergeBB);

        // 循环体
        currentFunction->addBasicBlock(bodyBB);
        builder.setInsertPoint(bodyBB);
        visit(ctx->stmt()); // 处理循环体

        // 只有在循环体未终止时才添加跳转（防止return后还有代码）
        if (!builder.getInsertBlock()->isTerminated())
        {
            builder.CreateBr(condBB); // 跳回条件判断
        }

        // 合并块
        currentFunction->addBasicBlock(mergeBB);
        builder.setInsertPoint(mergeBB);

        // 恢复之前的循环上下文
        condBlockStack.pop();
        mergeBlockStack.pop();

        return nullptr;
    }

    antlrcpp::Any visitForStmt(SysYParser::ForStmtContext *ctx) override
    {
        symbolTable.enterScope();

        if (ctx->initDecl)
        {
            visit(ctx->initDecl);
        }
        else if (ctx->initStmt)
        {
            visit(ctx->initStmt);
        }

        static int forCounter = 0;
        int currentFor = forCounter++;

        BasicBlock *condBB = new BasicBlock("for.cond." + std::to_string(currentFor));
        BasicBlock *bodyBB = new BasicBlock("for.body." + std::to_string(currentFor));
        // Check member pointers directly
        bool hasStep = (ctx->stepLVal != nullptr) || (ctx->stepExp != nullptr);
        BasicBlock *stepBB = hasStep ? new BasicBlock("for.step." + std::to_string(currentFor)) : nullptr;
        BasicBlock *mergeBB = new BasicBlock("for.merge." + std::to_string(currentFor));

        BasicBlock *continueTarget = hasStep ? stepBB : condBB;
        condBlockStack.push(continueTarget);
        mergeBlockStack.push(mergeBB);

        builder.CreateBr(condBB);

        currentFunction->addBasicBlock(condBB);
        builder.setInsertPoint(condBB);

        if (ctx->condition)
        {
            ValuePtr cond = std::any_cast<ValuePtr>(visit(ctx->condition));
            if (cond)
            {
                ValuePtr zero = new ConstantInt(0);
                ValuePtr condBool = builder.CreateICmp("ne", cond, zero);
                builder.CreateCondBr(condBool, bodyBB, mergeBB);
            }
        }
        else
        {
            builder.CreateBr(bodyBB);
        }

        currentFunction->addBasicBlock(bodyBB);
        builder.setInsertPoint(bodyBB);
        visit(ctx->body);

        if (!builder.getInsertBlock()->isTerminated())
        {
            builder.CreateBr(continueTarget);
        }

        if (hasStep)
        {
            currentFunction->addBasicBlock(stepBB);
            builder.setInsertPoint(stepBB);
            if (ctx->stepLVal)
            {
                ValuePtr ptr = getLValPointer(ctx->stepLVal);
                ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->stepRVal));
                if (ptr && rhs)
                    builder.CreateStore(rhs, ptr);
            }
            else
            {
                visit(ctx->stepExp);
            }
            builder.CreateBr(condBB);
        }

        currentFunction->addBasicBlock(mergeBB);
        builder.setInsertPoint(mergeBB);

        condBlockStack.pop();
        mergeBlockStack.pop();
        symbolTable.exitScope();

        return nullptr;
    }

    // 新增：break语句
    antlrcpp::Any visitBreakStmt(SysYParser::BreakStmtContext *ctx) override
    {
        if (mergeBlockStack.empty())
        {
            // 错误：break不在循环内
            std::cerr << "Error: break statement not within a loop" << std::endl;
            return nullptr;
        }

        builder.CreateBr(mergeBlockStack.top());

        // 创建不可达块（break后的代码不会被执行）
        BasicBlock *unreachable = new BasicBlock("break.unreachable");
        currentFunction->addBasicBlock(unreachable);
        builder.setInsertPoint(unreachable);

        return nullptr;
    }

    // 新增：continue语句
    antlrcpp::Any visitContinueStmt(SysYParser::ContinueStmtContext *ctx) override
    {
        if (condBlockStack.empty())
        {
            // 错误：continue不在循环内
            std::cerr << "Error: continue statement not within a loop" << std::endl;
            return nullptr;
        }

        builder.CreateBr(condBlockStack.top());

        // 创建不可达块（continue后的代码不会被执行）
        BasicBlock *unreachable = new BasicBlock("continue.unreachable");
        currentFunction->addBasicBlock(unreachable);
        builder.setInsertPoint(unreachable);

        return nullptr;
    }
};
