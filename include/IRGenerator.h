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
    Type* currentDeclType = nullptr;

    // 用于记录 SysY 库中 void 函数的名称
    std::set<std::string> voidFuncs;

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
        try {
            return std::stof(str);
        } catch (...) {
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
            std::string name = getTokenText(l->lVal()->IDENT());
            SymbolInfo *info = symbolTable.lookup(name);
            if (info && info->isConst && !info->isArray)
                return info->constIntVal;
        }
        return 0;
    }

    // --- 编译期常量求值 (Float) ---
    float evalFloatConstExp(SysYParser::ExpContext *ctx)
    {
        if (!ctx) return 0.0f;
        if (auto p = dynamic_cast<SysYParser::ParenExpContext *>(ctx)) return evalFloatConstExp(p->exp());
        if (auto n = dynamic_cast<SysYParser::NumberExpContext *>(ctx)) {
            std::string text = n->getText();
            if (text.find('.') != std::string::npos || text.find('e') != std::string::npos || text.find('E') != std::string::npos) {
                return parseFloat(text);
            }
            return (float)parseInteger(text);
        }
        if (auto u = dynamic_cast<SysYParser::UnaryExpContext *>(ctx)) {
            float val = evalFloatConstExp(u->exp());
            if (u->MINUS()) return -val;
            if (u->NOT()) return (float)(!((bool)val));
            return val;
        }
        if (auto m = dynamic_cast<SysYParser::MulDivModExpContext *>(ctx)) {
            float l = evalFloatConstExp(m->exp(0));
            float r = evalFloatConstExp(m->exp(1));
            if (m->MUL()) return l * r;
            if (r == 0) return 0.0f;
            if (m->DIV()) return l / r;
            if (m->MOD()) return (float)((int)l % (int)r); // 浮点取模强转int
        }
        if (auto a = dynamic_cast<SysYParser::AddSubExpContext *>(ctx)) {
            float l = evalFloatConstExp(a->exp(0));
            float r = evalFloatConstExp(a->exp(1));
            return a->PLUS() ? (l + r) : (l - r);
        }
        if (auto l = dynamic_cast<SysYParser::LValExpContext *>(ctx)) {
            std::string name = getTokenText(l->lVal()->IDENT());
            SymbolInfo *info = symbolTable.lookup(name);
            if (info && info->isConst && !info->isArray) {
                if (info->type->isFloatTy()) return info->constFloatVal;
                if (info->type->isInt32Ty()) return (float)info->constIntVal;
            }
        }
        return 0.0f;
    }

    ValuePtr getLValPointer(SysYParser::LValContext *ctx)
    {
        std::string name = getTokenText(ctx->IDENT());
        SymbolInfo *info = symbolTable.lookup(name);
        if (!info) {
            std::cerr << "Undefined variable: " << name << std::endl;
            return nullptr;
        }

        ValuePtr base = info->value;
        if (info->isPointer) {
            base = builder.CreatePointerLoad(base);
        }

        if (!info->isArray || ctx->L_BRACK().empty()) return base;

        ValuePtr offset = nullptr;
        size_t n = ctx->exp().size();

        for (size_t i = 0; i < n; ++i) {
            ValuePtr idx = std::any_cast<ValuePtr>(visit(ctx->exp(i)));
            // 数组下标必须是 int
            idx = ensureType(idx, Type::getInt32Ty());

            int stride = 1;
            for (size_t k = i + 1; k < info->dims.size(); ++k)
                stride *= info->dims[k];

            ValuePtr term = idx;
            if (stride > 1) {
                ValuePtr strideVal = ConstantInt::get(stride);
                term = builder.CreateBinary("mul", idx, strideVal);
            }

            if (!offset) offset = term;
            else offset = builder.CreateBinary("add", offset, term);
        }

        if (!offset) offset = ConstantInt::get(0);

        if (info->isPointer) {
            return builder.CreatePointerGEP(base, offset);
        } else {
            int totalSize = 1;
            for (int d : info->dims) totalSize *= d;
            return builder.CreateGEP(base, offset, totalSize);
        }
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
        if (ctx->constExp()) {
            if (currentIdx < target.size()) {
                if constexpr (std::is_same_v<T, float>)
                    target[currentIdx++] = evalFloatConstExp(ctx->constExp()->exp());
                else
                    target[currentIdx++] = evalConstExp(ctx->constExp()->exp());
            }
            return;
        }
        if (ctx->L_BRACE()) {
            for (auto child : ctx->constInitVal()) {
                flattenConstInitVal(target, currentIdx, child, dims, dimLevel + 1, isFloat);
            }
            int blockSize = getDimSize(dims, dimLevel);
            while (currentIdx < startIdx + blockSize && currentIdx < target.size()) {
                target[currentIdx++] = 0;
            }
        }
    }

    // 新增：变量数组扁平化（支持运行时表达式，带 Padding）
    void flattenVarInitVal(std::vector<ValuePtr> &target, int &currentIdx, SysYParser::InitValContext *ctx,
                           const std::vector<int> &dims, int dimLevel)
    {
        int startIdx = currentIdx;
        if (ctx->exp()) {
            if (currentIdx < target.size()) {
                ValuePtr val = std::any_cast<ValuePtr>(visit(ctx->exp()));
                // 关键：隐式转换
                val = ensureType(val, currentDeclType); 
                target[currentIdx++] = val;
            }
            return;
        }
        if (ctx->L_BRACE()) {
            for (auto child : ctx->initVal()) {
                flattenVarInitVal(target, currentIdx, child, dims, dimLevel + 1);
            }
            int blockSize = getDimSize(dims, dimLevel);
            while (currentIdx < startIdx + blockSize && currentIdx < target.size()) {
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
    ValuePtr ensureType(ValuePtr val, Type* targetTy) {
        if (!val) return nullptr;
        Type* srcTy = val->getType();
        if (srcTy == targetTy) return val;

        // int -> float
        if (srcTy->isInt32Ty() && targetTy->isFloatTy()) {
            return builder.CreateSITOFP(val);
        }
        // float -> int
        if (srcTy->isFloatTy() && targetTy->isInt32Ty()) {
            return builder.CreateFPTOSI(val);
        }
        // i1 -> i32 (for logic ops used in arithmetic)
        if (srcTy->isInt1Ty() && targetTy->isInt32Ty()) {
            return builder.CreateZExt(val, Type::getInt32Ty());
        }
        // i1 -> float
        if (srcTy->isInt1Ty() && targetTy->isFloatTy()) {
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
        voidFuncs.insert("putint"); voidFuncs.insert("putch"); voidFuncs.insert("putfloat");
        voidFuncs.insert("putarray"); voidFuncs.insert("putfarray");
        voidFuncs.insert("starttime"); voidFuncs.insert("stoptime");
    }

    std::string getIR() const { return module->print(); }

    antlrcpp::Any visitCompUnit(SysYParser::CompUnitContext *ctx) override
    {
        for (auto child : ctx->children)
        {
            if (auto func = dynamic_cast<SysYParser::FuncDefContext *>(child))
                visit(func);
            else if (auto decl = dynamic_cast<SysYParser::DeclContext *>(child))
                visit(decl);
        }
        return nullptr;
    }

    antlrcpp::Any visitFuncDef(SysYParser::FuncDefContext *ctx) override {
        std::string name = getTokenText(ctx->IDENT());
        
        // 1. 处理返回类型
        std::string typeStr = ctx->funcType()->getText();
        TypePtr returnType;
        if (typeStr == "void") {
            returnType = Type::getVoidTy();
            voidFuncs.insert(name);
        } else if (typeStr == "float") {
            returnType = Type::getFloatTy();
        } else {
            returnType = Type::getInt32Ty();
        }

        currentFunction = new Function(returnType, name);
        module->addFunction(std::unique_ptr<Function>(currentFunction));
        symbolTable.enterScope();

        // 创建 Entry Block
        BasicBlock *entryBB = new BasicBlock(getUniqueBasicBlockName("entry"));
        currentFunction->addBasicBlock(entryBB);
        builder.setInsertPoint(entryBB);
        builder.reset();

        // 2. 处理参数
        if (ctx->funcFParams()) {
            int i = 0;
            for (auto param : ctx->funcFParams()->funcFParam()) {
                std::string paramName = getTokenText(param->IDENT());
                std::string argReg = "%arg" + std::to_string(i); // 使用别名更清晰

                // 识别参数类型
                Type* paramType = Type::getInt32Ty();
                if (param->bType()->getText() == "float") paramType = Type::getFloatTy();

                bool isArray = !param->L_BRACK().empty();
                std::vector<int> dims;
                if (isArray) {
                    dims.push_back(0); // 第一维省略
                    for (auto expr : param->exp()) dims.push_back(evalConstExp(expr));
                }

                currentFunction->args.push_back(argReg); // 记录参数名用于打印

                if (isArray) {
                    // 数组参数作为指针传递
                    Type* ptrType = Type::getPointerTy(paramType);
                    currentFunction->argTypes.push_back(ptrType);

                    ValuePtr argVal = new Value(ptrType, argReg);
                    ValuePtr allocaPtr = builder.CreateAlloca(ptrType);
                    builder.CreatePointerStore(argVal, allocaPtr);
                    symbolTable.addSymbol(paramName, paramType, allocaPtr, false, 0, 0.0f, true, dims, true);
                } else {
                    // 标量参数
                    currentFunction->argTypes.push_back(paramType);
                    ValuePtr argVal = new Value(paramType, argReg);
                    ValuePtr allocaPtr = builder.CreateAlloca(paramType);
                    builder.CreateStore(argVal, allocaPtr);
                    symbolTable.addSymbol(paramName, paramType, allocaPtr, false); // 利用默认参数
                }
                i++;
            }
            builder.regCounter = i; // 更新寄存器计数
        }

        // 处理函数体
        if (ctx->block()) {
            // block 会再次 enterScope，这里已经是函数 scope 了
            // 为了避免多余 scope，可以直接手动遍历 blockItems，或者在 visitBlock 里调整
            // 这里最简单的方法是直接 visit(block)，虽然会多一层 scope 但不影响逻辑
            for (auto item : ctx->block()->blockItem()) visit(item);
        }

        // 补全 return
        if (!builder.getInsertBlock()->isTerminated()) {
            if (returnType->isVoidTy()) builder.CreateVoidRet();
            else if (returnType->isFloatTy()) builder.CreateRet(ConstantFloat::get(0.0f));
            else builder.CreateRet(ConstantInt::get(0));
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
        return nullptr;
    }

    antlrcpp::Any visitConstDecl(SysYParser::ConstDeclContext *ctx) override
    {
        for (auto def : ctx->constDef())
        {
            std::string name = getTokenText(def->IDENT());

            if (!def->L_BRACK().empty())
            {
                std::vector<int> dims;
                int totalSize = 1;
                for (auto d : def->constExp())
                {
                    int sz = evalConstExp(d->exp());
                    dims.push_back(sz);
                    totalSize *= sz;
                }

                std::vector<int> initValues(totalSize, 0);
                if (def->constInitVal())
                {
                    int currentIdx = 0;
                    flattenConstInitVal(initValues, currentIdx, def->constInitVal(), dims, 0, false);
                }

                if (currentFunction)
                {
                    // 使用 createEntryBlockAlloca 替代 builder.CreateAlloca 防止在循环中并不停分配栈空间
                    Type *arrType = Type::getArrayTy(Type::getInt32Ty(), totalSize);
                    ValuePtr ptr = createEntryBlockAlloca(arrType);
                    symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, true, 0, 0.0f, true, dims);

                    // 局部常量数组必须全部存储，包括 0 值，因为 alloca 内存未初始化
                    for (int i = 0; i < totalSize; ++i)
                    {
                        ValuePtr idxVal = new ConstantInt(i);
                        ValuePtr elemPtr = builder.CreateGEP(ptr, idxVal, totalSize);
                        builder.CreateStore(ConstantInt::get(initValues[i]), elemPtr);
                    }
                }
                else
                {
                    std::stringstream ss;
                    ss << "@" << name << " = dso_local constant [" << totalSize << " x i32] [";
                    for (int i = 0; i < totalSize; ++i)
                    {
                        ss << "i32 " << initValues[i];
                        if (i < totalSize - 1)
                            ss << ", ";
                    }
                    ss << "], align 16";
                    module->globalLines.push_back(ss.str());

                    Type* arrType = Type::getArrayTy(Type::getInt32Ty(), totalSize);
                    ValuePtr ptr = new Value(Type::getPointerTy(arrType), "@" + name);
                    symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, true, 0, 0.0f, true, dims);
                }
                continue;
            }

            // 标量处理
            if (!def->constInitVal()->constExp())
                continue;
            int val = evalConstExp(def->constInitVal()->constExp()->exp());

            if (currentFunction)
            {
                ValuePtr ptr = createEntryBlockAlloca(Type::getInt32Ty());
                builder.CreateStore(ConstantInt::get(val), ptr);
                symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, true, val);
            }
            else
            {
                std::string ir = "@" + name + " = dso_local constant i32 " + std::to_string(val) + ", align 4";
                module->globalLines.push_back(ir);
                ValuePtr ptr = new Value(Type::getPointerTy(Type::getInt32Ty()), "@" + name);
                symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, true, val);
            }
        }
        return nullptr;
    }

    antlrcpp::Any visitVarDecl(SysYParser::VarDeclContext *ctx) override{
        // [关键修改 1] 获取当前声明的基础类型 (int 或 float)
        Type *declType = Type::getInt32Ty(); // 默认为 int
        if (ctx->bType()->FLOAT())
        {
            declType = Type::getFloatTy();
        }

        // 更新类成员 currentDeclType，供 flattenVarInitVal 等辅助函数使用
        currentDeclType = declType;

        for (auto def : ctx->varDef())
        {
            std::string name = getTokenText(def->IDENT());

            // === 数组处理 ===
            if (!def->L_BRACK().empty())
            {
                std::vector<int> dims;
                int totalSize = 1;
                for (auto d : def->constExp())
                {
                    int sz = evalConstExp(d->exp()); // 数组维度必须是整数
                    dims.push_back(sz);
                    totalSize *= sz;
                }

                Type *arrType = Type::getArrayTy(declType, totalSize);

                if (currentFunction)
                {
                    // [局部数组]
                    ValuePtr ptr = createEntryBlockAlloca(arrType);
                    // 注册符号表 (注意传入 declType 和 dims)
                    symbolTable.addSymbol(name, declType, ptr, false, 0, 0.0f, true, dims);

                    if (def->ASSIGN() && def->initVal())
                    {
                        // 局部数组初始化：获取所有初始值
                        std::vector<ValuePtr> initVals(totalSize);

                        // 填充默认值 (0 或 0.0)
                        ValuePtr zeroVal = declType->isFloatTy() ? 
                                           (ValuePtr)ConstantFloat::get(0.0f) : 
                                           (ValuePtr)ConstantInt::get(0);
                        std::fill(initVals.begin(), initVals.end(), zeroVal);

                        int idx = 0;
                        // 复用类成员函数 flattenVarInitVal (它会利用 currentDeclType 进行隐式转换)
                        flattenVarInitVal(initVals, idx, def->initVal(), dims, 0);

                        // 生成 Store 指令初始化栈内存
                        for (int i = 0; i < totalSize; ++i)
                        {
                            // 优化：如果初始值就是默认的 0，且之后没有再次赋值，其实可以跳过 Store
                            // 但为了正确性，这里全量生成
                            ValuePtr idxVal = ConstantInt::get(i);
                            ValuePtr elemPtr = builder.CreateGEP(ptr, idxVal, totalSize);
                            builder.CreateStore(initVals[i], elemPtr);
                        }
                    }
                }
                else
                {
                    // [全局数组]：必须是常量初始化
                    // 我们使用字符串列表来存储初始化的 IR 文本 (e.g. "i32 5" 或 "float 0x...")
                    std::vector<std::string> initStrs; 
                    bool hasInit = (def->ASSIGN() && def->initVal());

                    if (hasInit)
                    {
                        int idx = 0;

                        // [关键修改 2] 升级 lambda 以支持 float/int
                        std::function<void(SysYParser::InitValContext *, int &, int)> globalHelper;

                        globalHelper = [&](SysYParser::InitValContext *v, int &currentIdx, int dimLevel)
                        {
                            if (v->exp())
                            {
                                if (currentIdx < totalSize)
                                {
                                    // 根据类型求值并生成 IR 字符串
                                    if (declType->isFloatTy()) {
                                        float val = evalFloatConstExp(v->exp());
                                        initStrs.push_back("float " + ConstantFloat::get(val)->to_string());
                                    } else {
                                        int val = evalConstExp(v->exp());
                                        initStrs.push_back("i32 " + std::to_string(val));
                                    }
                                    currentIdx++;
                                }
                            }
                            else if (v->L_BRACE())
                            {
                                int startPos = currentIdx;
                                for (auto child : v->initVal())
                                {
                                    globalHelper(child, currentIdx, dimLevel + 1);
                                }
                                int blockSize = getDimSize(dims, dimLevel);
                                // 补零
                                while (currentIdx < startPos + blockSize && currentIdx < totalSize)
                                {
                                    if (declType->isFloatTy()) initStrs.push_back("float " + ConstantFloat::get(0.0f)->to_string());
                                    else initStrs.push_back("i32 0");
                                    currentIdx++;
                                }
                            }
                        };

                        globalHelper(def->initVal(), idx, 0);

                        // 如果初始化列表比数组短，补齐剩余的零
                        while(initStrs.size() < totalSize) {
                            if (declType->isFloatTy()) initStrs.push_back("float " + ConstantFloat::get(0.0f)->to_string());
                            else initStrs.push_back("i32 0");
                        }
                    }

                    std::stringstream ss;
                    ss << "@" << name << " = dso_local global " << arrType->toString() << " ";
                    if (hasInit)
                    {
                        ss << "[";
                        for (size_t i = 0; i < initStrs.size(); ++i)
                        {
                            ss << initStrs[i];
                            if (i < initStrs.size() - 1)
                                ss << ", ";
                        }
                        ss << "]";
                    }
                    else
                    {
                        ss << "zeroinitializer";
                    }
                    ss << ", align 16";
                    module->globalLines.push_back(ss.str());

                    ValuePtr ptr = new Value(Type::getPointerTy(arrType), "@" + name);
                    // 注册全局数组符号
                    symbolTable.addSymbol(name, declType, ptr, false, 0, 0.0f, true, dims);
                }
                continue;
            }

            // === 标量处理 ===
            if (currentFunction)
            {
                ValuePtr ptr = createEntryBlockAlloca(declType);
                if (def->ASSIGN() && def->initVal() && def->initVal()->exp())
                {
                    ValuePtr initVal = std::any_cast<ValuePtr>(visit(def->initVal()->exp()));
                    // [关键修改 3] 隐式类型转换 (int <-> float)
                    initVal = ensureType(initVal, declType);
                    if (initVal)
                        builder.CreateStore(initVal, ptr);
                }
                symbolTable.addSymbol(name, declType, ptr, false);
            }
            else
            {
                // 全局标量
                std::string initStr;
                if (def->ASSIGN() && def->initVal() && def->initVal()->exp())
                {
                    // 全局变量初始值求值
                    if (declType->isFloatTy()) {
                        float val = evalFloatConstExp(def->initVal()->exp());
                        initStr = ConstantFloat::get(val)->to_string();
                    } else {
                        int val = evalConstExp(def->initVal()->exp());
                        initStr = std::to_string(val);
                    }
                }
                else
                {
                    initStr = declType->isFloatTy() ? "0.0" : "0";
                }

                std::string ir = "@" + name + " = dso_local global " + declType->toString() + " " + initStr + ", align 4";
                module->globalLines.push_back(ir);

                ValuePtr ptr = new Value(Type::getPointerTy(declType), "@" + name);
                symbolTable.addSymbol(name, declType, ptr, false);
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
            return (ValuePtr) ConstantFloat::get(val);
        }
        
        // 否则当作整数处理
        int val = parseInteger(text);
        return (ValuePtr) new ConstantInt(val);
    }

    antlrcpp::Any visitLValExp(SysYParser::LValExpContext *ctx) override
    {
        std::string name = getTokenText(ctx->lVal()->IDENT());
        SymbolInfo *info = symbolTable.lookup(name);

        if (info && info->isConst && !info->isArray)
        {
            return (ValuePtr) new ConstantInt(info->constIntVal);
        }

        ValuePtr ptr = getLValPointer(ctx->lVal());
        if (!ptr)
            return (ValuePtr) new ConstantInt(0);

        if (info && info->isArray)
        {
            int indices = ctx->lVal()->L_BRACK().size();
            int dims = info->dims.size();
            if (indices < dims)
            {
                // If ptr is [N x i32]*, decay it to i32*
                // This only happens for global/local arrays when accessed without brackets
                if (!info->isPointer && ctx->lVal()->L_BRACK().empty())
                {
                    int totalSize = 1;
                    for (int d : info->dims)
                        totalSize *= d;
                    return builder.CreateGEP(ptr, new ConstantInt(0), totalSize);
                }
                // Otherwise ptr is already i32* (either param or result of GEP)
                return ptr;
            }
        }

        return builder.CreateLoad(ptr);
    }

    antlrcpp::Any visitAddSubExp(SysYParser::AddSubExpContext *ctx) override {
        auto lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        auto rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));
        
        // 检查是否涉及浮点数
        bool isFloat = lhs->getType()->isFloatTy() || rhs->getType()->isFloatTy();
        
        if (isFloat) {
            // 只要有一方是 float，两边都转 float
            lhs = ensureType(lhs, Type::getFloatTy());
            rhs = ensureType(rhs, Type::getFloatTy());

            // 生成 fadd / fsub
            if (ctx->PLUS()) return builder.CreateFAdd(lhs, rhs);
            else return builder.CreateFSub(lhs, rhs);
        } else {
            // 纯整数情况 (保持原有常数折叠逻辑或直接生成指令)
            // 简单起见直接生成指令，优化交给 LLVM 后端或你的 ConstantInt 检查
            if (ctx->PLUS()) return builder.CreateAdd(lhs, rhs);
            else return builder.CreateSub(lhs, rhs);
        }
    }

    antlrcpp::Any visitMulDivModExp(SysYParser::MulDivModExpContext *ctx) override
    {
        ValuePtr lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));
        if (!lhs || !rhs){return (ValuePtr) nullptr;}
        
        bool isFloat = lhs->getType()->isFloatTy() || rhs->getType()->isFloatTy();
        if (isFloat) {
            lhs = ensureType(lhs, Type::getFloatTy());
            rhs = ensureType(rhs, Type::getFloatTy());

            if (ctx->MOD()) {
                // SysY 语言规范通常不支持浮点取模。
                // 如果需要支持，LLVM 指令是 "frem"
                std::cerr << "Error: Modulo operator on floating point numbers is invalid." << std::endl;
                return (ValuePtr)nullptr; 
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
        if (ctx->PLUS())
            return visit(ctx->exp());
            
        ValuePtr val = std::any_cast<ValuePtr>(visit(ctx->exp()));
        if (!val) return (ValuePtr) nullptr;

        // 1. 常量折叠优化 (增加 Float 支持)
        if (auto cInt = dynamic_cast<ConstantInt *>(val)) {
             if (ctx->MINUS()) return (ValuePtr) new ConstantInt(-cInt->value);
             if (ctx->NOT()) return (ValuePtr) new ConstantInt(!cInt->value);
        }
        if (auto cFloat = dynamic_cast<ConstantFloat *>(val)) {
             if (ctx->MINUS()) return (ValuePtr) ConstantFloat::get(-cFloat->value);
             // !float 通常语义为 val == 0.0
             if (ctx->NOT()) return (ValuePtr) new ConstantInt(cFloat->value == 0.0f); 
        }

        // 2. 指令生成
        if (ctx->MINUS())
        {
            // [修复] 根据类型生成 fsub 或 sub
            if (val->getType()->isFloatTy()) {
                ValuePtr zero = ConstantFloat::get(0.0f);
                return builder.CreateBinary("fsub", zero, val);
            } else {
                ValuePtr zero = new ConstantInt(0);
                return builder.CreateBinary("sub", zero, val);
            }
        }
        if (ctx->NOT())
        {
            // [修复] 根据类型生成 fcmp 或 icmp
            ValuePtr zero = val->getType()->isFloatTy() ? 
                            (ValuePtr)ConstantFloat::get(0.0f) : 
                            (ValuePtr)new ConstantInt(0);
            
            ValuePtr cmp;
            if (val->getType()->isFloatTy()) {
                // 浮点数判 0 使用 fcmp oeq (Ordered Equal)
                cmp = builder.CreateFCmp("oeq", val, zero);
            } else {
                cmp = builder.CreateICmp("eq", val, zero);
            }
            return builder.CreateZExt(cmp);
        }
        return val;
    }

    antlrcpp::Any visitRelExp(SysYParser::RelExpContext *ctx) override {
        auto lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        auto rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));

        bool isFloat = lhs->getType()->isFloatTy() || rhs->getType()->isFloatTy();
        ValuePtr cmpRes;

        if (isFloat) {
            lhs = ensureType(lhs, Type::getFloatTy());
            rhs = ensureType(rhs, Type::getFloatTy());

            std::string op;
            if (ctx->LT()) op = "olt";      // Ordered Less Than
            else if (ctx->GT()) op = "ogt"; // Ordered Greater Than
            else if (ctx->LE()) op = "ole";
            else if (ctx->GE()) op = "oge";

            cmpRes = builder.CreateFCmp(op, lhs, rhs);
        } else {
            std::string op;
            if (ctx->LT()) op = "slt";
            else if (ctx->GT()) op = "sgt";
            else if (ctx->LE()) op = "sle";
            else if (ctx->GE()) op = "sge";

            cmpRes = builder.CreateICmp(op, lhs, rhs);
        }

        // 关系表达式在 C/SysY 中返回 i32 (0 或 1)
        return builder.CreateZExt(cmpRes, Type::getInt32Ty());
    }

    antlrcpp::Any visitEqNeqExp(SysYParser::EqNeqExpContext *ctx) override
    {
        ValuePtr lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));
        if (!lhs || !rhs) return (ValuePtr)nullptr;

        // [修复] 检查是否涉及浮点数
        bool isFloat = lhs->getType()->isFloatTy() || rhs->getType()->isFloatTy();
        ValuePtr cmp;

        if (isFloat) {
            // 1. 类型统一转为 float
            lhs = ensureType(lhs, Type::getFloatTy());
            rhs = ensureType(rhs, Type::getFloatTy());

            // 2. 选择浮点比较谓词
            // == 使用 oeq (Ordered and Equal)
            // != 使用 une (Unordered or Not Equal) - 这样处理 NaN 比较更符合直觉
            std::string op = ctx->EQ() ? "oeq" : "une";
            
            // 3. 生成 fcmp 指令
            cmp = builder.CreateFCmp(op, lhs, rhs);
        } else {
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

        // --- 修复开始：针对 SysY 运行时库函数的参数类型检查 ---
        // 这里的逻辑对应之前的建议：由于没有函数符号表，手动修正已知库函数的参数类型
        if (funcName == "putfloat" && args.size() == 1) {
            // 确保 putfloat(float) 接收的是 float
            args[0] = ensureType(args[0], Type::getFloatTy());
        }
        else if ((funcName == "putint" || funcName == "putch") && args.size() == 1) {
            // 确保 putint(int) 和 putch(int) 接收的是 int
            args[0] = ensureType(args[0], Type::getInt32Ty());
        }
        // 注意：对于自定义函数，理想做法是在 SymbolTable 中记录函数签名(ArgTypes)，
        // 然后在这里查表并循环调用 ensureType。目前的硬编码仅适用于标准库。
        // --- 修复结束 ---

        // 判断是否为 SysY 库中的 void 函数
        bool isVoid = (voidFuncs.find(funcName) != voidFuncs.end());
        return builder.CreateCall(funcName, args, isVoid);
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
        mergeBlockStack.push(prevMergeBB);

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