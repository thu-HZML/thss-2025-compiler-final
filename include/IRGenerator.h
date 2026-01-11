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
           << "declare i32 @getarray(i32*)\n"
           << "declare void @putint(i32)\n"
           << "declare void @putch(i32)\n"
           << "declare void @putarray(i32, i32*)\n"
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

    ValuePtr getLValPointer(SysYParser::LValContext *ctx)
    {
        std::string name = getTokenText(ctx->IDENT());
        SymbolInfo *info = symbolTable.lookup(name);
        if (!info)
        {
            return nullptr;
        }

        ValuePtr base = info->value;
        if (!info->isArray || ctx->L_BRACK().empty())
        {
            return base;
        }

        ValuePtr offset = nullptr;
        size_t n = ctx->exp().size();

        for (size_t i = 0; i < n; ++i)
        {
            ValuePtr idx = std::any_cast<ValuePtr>(visit(ctx->exp(i)));

            int stride = 1;
            for (size_t k = i + 1; k < info->dims.size(); ++k)
            {
                stride *= info->dims[k];
            }

            ValuePtr term = idx;
            if (stride > 1)
            {
                ValuePtr strideVal = new ConstantInt(stride);
                term = builder.CreateBinary("mul", idx, strideVal);
            }

            if (offset == nullptr)
            {
                offset = term;
            }
            else
            {
                offset = builder.CreateBinary("add", offset, term);
            }
        }

        if (!offset)
            offset = new ConstantInt(0);

        int totalSize = 1;
        for (int d : info->dims)
            totalSize *= d;

        return builder.CreateGEP(base, offset, totalSize);
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
    void flattenConstInitVal(std::vector<int> &target, int &currentIdx, SysYParser::ConstInitValContext *ctx,
                             const std::vector<int> &dims, int dimLevel)
    {
        int startIdx = currentIdx;
        if (ctx->constExp())
        {
            if (currentIdx < target.size())
                target[currentIdx++] = evalConstExp(ctx->constExp()->exp());
            return;
        }
        if (ctx->L_BRACE())
        {
            for (auto child : ctx->constInitVal())
            {
                if (child->L_BRACE())
                {
                    flattenConstInitVal(target, currentIdx, child, dims, dimLevel + 1);
                }
                else
                {
                    flattenConstInitVal(target, currentIdx, child, dims, dimLevel + 1);
                }
            }
            // Padding
            int blockSize = getDimSize(dims, dimLevel);
            int expectedEnd = startIdx + blockSize;
            while (currentIdx < expectedEnd && currentIdx < target.size())
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
                target[currentIdx++] = std::any_cast<ValuePtr>(visit(ctx->exp()));
            }
            return;
        }
        if (ctx->L_BRACE())
        {
            for (auto child : ctx->initVal())
            {
                if (child->L_BRACE())
                {
                    flattenVarInitVal(target, currentIdx, child, dims, dimLevel + 1);
                }
                else
                {
                    flattenVarInitVal(target, currentIdx, child, dims, dimLevel + 1);
                }
            }
            // Padding
            int blockSize = getDimSize(dims, dimLevel);
            int expectedEnd = startIdx + blockSize;
            while (currentIdx < expectedEnd && currentIdx < target.size())
            {
                target[currentIdx++] = new ConstantInt(0);
            }
        }
    }

    // 辅助函数：创建新的基本块并设置插入点
    BasicBlock *createAndSetBasicBlock(const std::string &name)
    {
        BasicBlock *bb = new BasicBlock(name);
        currentFunction->addBasicBlock(bb);
        builder.setInsertPoint(bb);
        return bb;
    }

public:
    IRGenerator() : module(std::make_unique<ExtendedModule>())
    {
        builder.module = module.get();

        // 初始化系统库函数为 void 类型
        voidFuncs.insert("putint");
        voidFuncs.insert("putch");
        voidFuncs.insert("putarray");
        voidFuncs.insert("starttime");
        voidFuncs.insert("stoptime");
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

    antlrcpp::Any visitFuncDef(SysYParser::FuncDefContext *ctx) override
    {
        std::string name = getTokenText(ctx->IDENT());

        // 处理返回类型
        std::string typeStr = ctx->funcType()->getText(); // 获取 "int" 或 "void"
        TypePtr returnType;

        if (typeStr == "void")
        {
            returnType = Type::getVoidTy();
            voidFuncs.insert(name); // 记录该自定义函数为 void
        }
        else
        {
            returnType = Type::getInt32Ty();
        }

        currentFunction = new Function(returnType, name);

        module->addFunction(std::unique_ptr<Function>(currentFunction));

        symbolTable.enterScope();
        builder.setInsertPoint(currentFunction->getEntryBlock());
        builder.reset();

        // 1. 先统计参数个数
        int paramCount = 0;
        if (ctx->funcFParams())
        {
            paramCount = ctx->funcFParams()->funcFParam().size();
        }

        // 2. 关键：将寄存器计数器跳过参数占用的编号 (例如有1个参数，它占用%0，下条指令应从%1开始)
        builder.regCounter = paramCount;

        // 3. 处理参数
        if (ctx->funcFParams())
        {
            int i = 0;
            for (auto param : ctx->funcFParams()->funcFParam())
            {
                std::string paramName = getTokenText(param->IDENT());

                // 实参的值来源于对应的寄存器 %i
                std::string argReg = "%" + std::to_string(i);
                currentFunction->args.push_back(argReg);

                // 构造参数的 Value 对象
                ValuePtr argVal = new Value(Type::getInt32Ty(), argReg);

                // 在栈上分配空间 (builder.CreateAlloca 会使用 regCounter，此时已经是 i+1 了)
                // 例如：参数是 %0，这里生成的 ptr 将是 %1
                ValuePtr allocaPtr = builder.CreateAlloca("i32");

                // 将参数值存入栈空间
                builder.CreateStore(argVal, allocaPtr);

                // 将栈地址注册到符号表，这样后续用到 paramName 时会加载这个地址
                symbolTable.addSymbol(paramName, Type::getInt32Ty(), allocaPtr, false, 0);

                i++;
            }
        }

        // 修改：不调用 visit(ctx->block()) 以避免创建双重作用域
        // 而是直接遍历 block 中的 item，使参数和函数体在同一作用域
        if (ctx->block())
        {
            for (auto item : ctx->block()->blockItem())
            {
                visit(item);
            }
        }

        // 检查当前基本块是否已终止，未终止则补充 return 指令
        if (builder.getInsertBlock() && !builder.getInsertBlock()->isTerminated())
        {
            if (returnType->isVoidTy())
            {
                builder.CreateVoidRet();
            }
            else
            {
                builder.CreateRet(new ConstantInt(0));
            }
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
                    flattenConstInitVal(initValues, currentIdx, def->constInitVal(), dims, 0);
                }

                if (currentFunction)
                {
                    std::string typeStr = "[" + std::to_string(totalSize) + " x i32]";
                    ValuePtr ptr = builder.CreateAlloca(typeStr);
                    symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, true, 0, true, dims);

                    // 局部常量数组必须全部存储，包括 0 值，因为 alloca 内存未初始化
                    for (int i = 0; i < totalSize; ++i)
                    {
                        ValuePtr idxVal = new ConstantInt(i);
                        ValuePtr elemPtr = builder.CreateGEP(ptr, idxVal, totalSize);
                        builder.CreateStore(initValues[i], elemPtr);
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

                    ValuePtr ptr = new Value(Type::getInt32Ty(), "@" + name);
                    symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, true, 0, true, dims);
                }
                continue;
            }

            // 标量处理
            if (!def->constInitVal()->constExp())
                continue;
            int val = evalConstExp(def->constInitVal()->constExp()->exp());

            if (currentFunction)
            {
                ValuePtr ptr = builder.CreateAlloca("i32");
                builder.CreateStore(val, ptr);
                symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, true, val);
            }
            else
            {
                std::string ir = "@" + name + " = dso_local constant i32 " + std::to_string(val) + ", align 4";
                module->globalLines.push_back(ir);
                ValuePtr ptr = new Value(Type::getInt32Ty(), "@" + name);
                symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, true, val);
            }
        }
        return nullptr;
    }

    antlrcpp::Any visitVarDecl(SysYParser::VarDeclContext *ctx) override
    {
        for (auto def : ctx->varDef())
        {
            std::string name = getTokenText(def->IDENT());

            // 数组处理
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

                if (currentFunction)
                {
                    std::string typeStr = "[" + std::to_string(totalSize) + " x i32]";
                    ValuePtr ptr = builder.CreateAlloca(typeStr);
                    symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, false, 0, true, dims);

                    if (def->ASSIGN() && def->initVal())
                    {
                        // 局部数组初始化：使用 flattenVarInitVal 获取所有初始值（包括 padding 的 0）
                        std::vector<ValuePtr> initVals(totalSize);
                        for (int i = 0; i < totalSize; ++i)
                            initVals[i] = new ConstantInt(0);

                        int idx = 0;
                        flattenVarInitVal(initVals, idx, def->initVal(), dims, 0);

                        // 全部存储以初始化栈内存
                        for (int i = 0; i < totalSize; ++i)
                        {
                            ValuePtr idxVal = new ConstantInt(i);
                            ValuePtr elemPtr = builder.CreateGEP(ptr, idxVal, totalSize);
                            builder.CreateStore(initVals[i], elemPtr);
                        }
                    }
                    // 如果没有初始化列表，则内容未定义，不需要 store
                }
                else
                {
                    // 全局数组：必须是常量初始化
                    std::vector<int> constInitValues(totalSize, 0);
                    bool hasStaticInit = false;
                    if (def->ASSIGN() && def->initVal())
                    {
                        int idx = 0;
                        // 注意：全局变量初始化必须也是常量结构，复用 flattenConstInitVal 逻辑即可
                        // 但 InitValContext 和 ConstInitValContext 类型不同，需小心。
                        // 由于全局变量初始化必须是 constExp，我们可以假设这里可以求值。
                        // 简单处理：我们使用 flattenInitVal 的逻辑变体，或者强制转型。
                        // 为了安全性，最好为全局变量再写个适配器，或者假定测试点中全局变量只用字面量。
                        // 实际上 SysY 语法要求全局 InitVal 必须是常量表达式。
                        // 我们这里暂时只处理简单的常量初始化，复杂情况可能需要递归求值器。
                        // 这里简化：假设测试用例的全局初始化可以通过 evalConstExp 求值

                        // 临时 lambda 适配
                        std::function<void(SysYParser::InitValContext *, int &, int)> helper;
                        helper = [&](SysYParser::InitValContext *v, int &currentIdx, int dimLevel)
                        {
                            if (v->exp())
                            {
                                if (currentIdx < totalSize)
                                    constInitValues[currentIdx++] = evalConstExp(v->exp());
                            }
                            else if (v->L_BRACE())
                            {
                                int startPos = currentIdx;
                                for (auto child : v->initVal())
                                    helper(child, currentIdx, dimLevel + 1);
                                int blockSize = getDimSize(dims, dimLevel);
                                while (currentIdx < startPos + blockSize && currentIdx < totalSize)
                                {
                                    constInitValues[currentIdx++] = 0;
                                }
                            }
                        };

                        helper(def->initVal(), idx, 0);
                        hasStaticInit = true;
                    }

                    std::stringstream ss;
                    ss << "@" << name << " = dso_local global [" << totalSize << " x i32] ";
                    if (hasStaticInit)
                    {
                        ss << "[";
                        for (int i = 0; i < totalSize; ++i)
                        {
                            ss << "i32 " << constInitValues[i];
                            if (i < totalSize - 1)
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

                    ValuePtr ptr = new Value(Type::getInt32Ty(), "@" + name);
                    symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, false, 0, true, dims);
                }
                continue;
            }

            // 标量处理
            if (currentFunction)
            {
                ValuePtr ptr = builder.CreateAlloca("i32");
                if (def->ASSIGN() && def->initVal()->exp())
                {
                    ValuePtr initVal = std::any_cast<ValuePtr>(visit(def->initVal()->exp()));
                    if (initVal)
                        builder.CreateStore(initVal, ptr);
                }
                symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, false, 0);
            }
            else
            {
                int initVal = 0;
                if (def->ASSIGN() && def->initVal()->exp())
                {
                    initVal = evalConstExp(def->initVal()->exp());
                }
                std::string ir = "@" + name + " = dso_local global i32 " + std::to_string(initVal) + ", align 4";
                module->globalLines.push_back(ir);
                ValuePtr ptr = new Value(Type::getInt32Ty(), "@" + name);
                symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, false, 0);
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
        std::string text = getTokenText(ctx->number()->IntConst());
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
        if (ptr)
            return builder.CreateLoad(ptr);

        return (ValuePtr) new ConstantInt(0);
    }

    antlrcpp::Any visitAddSubExp(SysYParser::AddSubExpContext *ctx) override
    {
        ValuePtr lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));
        if (!lhs || !rhs)
            return (ValuePtr) nullptr;

        auto c1 = dynamic_cast<ConstantInt *>(lhs);
        auto c2 = dynamic_cast<ConstantInt *>(rhs);
        if (c1 && c2)
            return (ValuePtr) new ConstantInt(ctx->PLUS() ? c1->value + c2->value : c1->value - c2->value);

        std::string op = ctx->PLUS() ? "add" : "sub";
        auto inst = builder.CreateBinary(op, lhs, rhs);
        return (ValuePtr)inst;
    }

    antlrcpp::Any visitMulDivModExp(SysYParser::MulDivModExpContext *ctx) override
    {
        ValuePtr lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));
        if (!lhs || !rhs)
            return (ValuePtr) nullptr;

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
        if (!val)
            return (ValuePtr) nullptr;

        if (auto c = dynamic_cast<ConstantInt *>(val))
        {
            if (ctx->MINUS())
                return (ValuePtr) new ConstantInt(-c->value);
            if (ctx->NOT())
                return (ValuePtr) new ConstantInt(!c->value);
        }
        if (ctx->MINUS())
        {
            ValuePtr zero = new ConstantInt(0);
            return builder.CreateBinary("sub", zero, val);
        }
        if (ctx->NOT())
        {
            ValuePtr zero = new ConstantInt(0);
            ValuePtr cmp = builder.CreateICmp("eq", val, zero);
            return builder.CreateZExt(cmp);
        }
        return val;
    }

    antlrcpp::Any visitRelExp(SysYParser::RelExpContext *ctx) override
    {
        ValuePtr lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));

        std::string op;
        if (ctx->LT())
            op = "slt";
        else if (ctx->GT())
            op = "sgt";
        else if (ctx->LE())
            op = "sle";
        else if (ctx->GE())
            op = "sge";

        ValuePtr cmp = builder.CreateICmp(op, lhs, rhs);
        return builder.CreateZExt(cmp);
    }

    antlrcpp::Any visitEqNeqExp(SysYParser::EqNeqExpContext *ctx) override
    {
        ValuePtr lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));

        std::string op = ctx->EQ() ? "eq" : "ne";
        ValuePtr cmp = builder.CreateICmp(op, lhs, rhs);
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
        mergeBlockStack.pop();
        if (prevCondBB)
            condBlockStack.push(prevCondBB);
        if (prevMergeBB)
            mergeBlockStack.push(prevMergeBB);

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