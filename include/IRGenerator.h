// --- START OF FILE IRGenerator.h ---

#pragma once
#include <any>
#include <string>
#include <iostream>
#include <vector>
#include <sstream>
#include <numeric>
#include "IR.h"
#include "IRBuilder.h"
#include "SymbolTable.h"
#include "antlr4-runtime.h"
#include "SysYParserBaseVisitor.h"
#include "SysYParser.h" 

class ExtendedModule : public Module {
public:
    std::vector<std::string> globalLines;
    std::string print() const {
        std::stringstream ss;
        ss << "declare i32 @getint()\ndeclare void @putint(i32)\n\n";
        for (const auto& line : globalLines) ss << line << "\n";
        ss << "\n";
        for (const auto& f : funcList) ss << f->print() << "\n";
        return ss.str();
    }
};

class IRGenerator : public SysYParserBaseVisitor {
private:
    std::unique_ptr<ExtendedModule> module;
    IRBuilder builder;
    SymbolTable symbolTable;
    Function* currentFunction = nullptr;

    std::string getTokenText(antlr4::tree::TerminalNode* node) {
        return node ? node->getSymbol()->getText() : "";
    }

    int parseInteger(const std::string& str) {
        try {
            if (str.length() > 2 && (str.rfind("0x", 0) == 0 || str.rfind("0X", 0) == 0)) 
                return std::stoi(str, nullptr, 16);
            if (str.length() > 1 && str.rfind("0", 0) == 0) 
                return std::stoi(str, nullptr, 8);
            return std::stoi(str);
        } catch (...) { return 0; }
    }

    int evalConstExp(SysYParser::ExpContext* ctx) {
        if (!ctx) return 0;
        if (auto p = dynamic_cast<SysYParser::ParenExpContext*>(ctx)) return evalConstExp(p->exp());
        if (auto n = dynamic_cast<SysYParser::NumberExpContext*>(ctx)) return parseInteger(getTokenText(n->number()->IntConst()));
        
        if (auto u = dynamic_cast<SysYParser::UnaryExpContext*>(ctx)) {
            int val = evalConstExp(u->exp());
            if (u->MINUS()) return -val;
            if (u->NOT()) return !val; 
            return val;
        }
        if (auto m = dynamic_cast<SysYParser::MulDivModExpContext*>(ctx)) {
            int l = evalConstExp(m->exp(0));
            int r = evalConstExp(m->exp(1));
            if (m->MUL()) return l * r;
            if (r == 0) return 0;
            if (m->DIV()) return l / r;
            if (m->MOD()) return l % r;
        }
        if (auto a = dynamic_cast<SysYParser::AddSubExpContext*>(ctx)) {
            int l = evalConstExp(a->exp(0));
            int r = evalConstExp(a->exp(1));
            return a->PLUS() ? (l + r) : (l - r);
        }
        if (auto l = dynamic_cast<SysYParser::LValExpContext*>(ctx)) {
            std::string name = getTokenText(l->lVal()->IDENT());
            SymbolInfo* info = symbolTable.lookup(name);
            if (info && info->isConst && !info->isArray) return info->constIntVal;
        }
        return 0;
    }

    ValuePtr getLValPointer(SysYParser::LValContext* ctx) {
        std::string name = getTokenText(ctx->IDENT());
        SymbolInfo* info = symbolTable.lookup(name);
        if (!info) {
            return nullptr;
        }

        ValuePtr base = info->value;
        if (!info->isArray || ctx->L_BRACK().empty()) {
            return base; 
        }

        ValuePtr offset = nullptr;
        size_t n = ctx->exp().size();
        
        for (size_t i = 0; i < n; ++i) {
            ValuePtr idx = std::any_cast<ValuePtr>(visit(ctx->exp(i)));
            
            int stride = 1;
            for (size_t k = i + 1; k < info->dims.size(); ++k) {
                stride *= info->dims[k];
            }
            
            ValuePtr term = idx;
            if (stride > 1) {
                ValuePtr strideVal = new ConstantInt(stride);
                term = builder.CreateBinary("mul", idx, strideVal);
            }
            
            if (offset == nullptr) {
                offset = term;
            } else {
                offset = builder.CreateBinary("add", offset, term);
            }
        }
        
        if (!offset) offset = new ConstantInt(0);

        int totalSize = 1;
        for(int d : info->dims) totalSize *= d;

        return builder.CreateGEP(base, offset, totalSize);
    }

    // Helper: 计算当前维度的 Block Size
    int getDimSize(const std::vector<int>& dims, int level) {
        int sz = 1;
        for (size_t i = level; i < dims.size(); ++i) sz *= dims[i];
        return sz;
    }

    // 修复后的常量数组扁平化（带 Padding）
    void flattenConstInitVal(std::vector<int>& target, int& currentIdx, SysYParser::ConstInitValContext* ctx, 
                             const std::vector<int>& dims, int dimLevel) {
        int startIdx = currentIdx;
        if (ctx->constExp()) {
            if (currentIdx < target.size()) target[currentIdx++] = evalConstExp(ctx->constExp()->exp());
            return;
        }
        if (ctx->L_BRACE()) {
            for (auto child : ctx->constInitVal()) {
                if (child->L_BRACE()) {
                    flattenConstInitVal(target, currentIdx, child, dims, dimLevel + 1);
                } else {
                    flattenConstInitVal(target, currentIdx, child, dims, dimLevel + 1); 
                }
            }
            // Padding
            int blockSize = getDimSize(dims, dimLevel);
            int expectedEnd = startIdx + blockSize;
            while(currentIdx < expectedEnd && currentIdx < target.size()) {
                target[currentIdx++] = 0;
            }
        }
    }
    
    // 新增：变量数组扁平化（支持运行时表达式，带 Padding）
    void flattenVarInitVal(std::vector<ValuePtr>& target, int& currentIdx, SysYParser::InitValContext* ctx, 
                           const std::vector<int>& dims, int dimLevel) {
        int startIdx = currentIdx;
        if (ctx->exp()) {
             if (currentIdx < target.size()) {
                 target[currentIdx++] = std::any_cast<ValuePtr>(visit(ctx->exp()));
             }
             return;
        }
        if (ctx->L_BRACE()) {
            for (auto child : ctx->initVal()) {
                if (child->L_BRACE()) {
                    flattenVarInitVal(target, currentIdx, child, dims, dimLevel + 1);
                } else {
                    flattenVarInitVal(target, currentIdx, child, dims, dimLevel + 1);
                }
            }
            // Padding
            int blockSize = getDimSize(dims, dimLevel);
            int expectedEnd = startIdx + blockSize;
            while(currentIdx < expectedEnd && currentIdx < target.size()) {
                target[currentIdx++] = new ConstantInt(0);
            }
        }
    }

public:
    IRGenerator() : module(std::make_unique<ExtendedModule>()) {
        builder.module = module.get();
    }
    
    std::string getIR() const { return module->print(); }

    antlrcpp::Any visitCompUnit(SysYParser::CompUnitContext *ctx) override {
        for (auto child : ctx->children) {
            if (auto func = dynamic_cast<SysYParser::FuncDefContext*>(child)) visit(func);
            else if (auto decl = dynamic_cast<SysYParser::DeclContext*>(child)) visit(decl);
        }
        return nullptr;
    }

    antlrcpp::Any visitFuncDef(SysYParser::FuncDefContext *ctx) override {
        std::string name = getTokenText(ctx->IDENT());
        currentFunction = new Function(Type::getInt32Ty(), name);
        module->addFunction(std::unique_ptr<Function>(currentFunction));
        
        symbolTable.enterScope();
        builder.setInsertPoint(currentFunction->getEntryBlock());
        builder.reset();

        if (ctx->funcFParams()) {
            for (auto param : ctx->funcFParams()->funcFParam()) {
                std::string paramName = getTokenText(param->IDENT());
                std::string argReg = "%" + std::to_string(builder.regCounter++);
                currentFunction->args.push_back(argReg);

                ValuePtr ptr = builder.CreateAlloca("i32"); 
                ValuePtr argVal = new Value(Type::getInt32Ty(), argReg);
                builder.CreateStore(argVal, ptr);
                
                // 参数可能是数组，但这里简单处理为 i32 标量或指针
                // 真正的数组参数处理需要指针类型支持，这里暂时保留原样
                symbolTable.addSymbol(paramName, Type::getInt32Ty(), ptr, false, 0);
            }
        }
        
        visit(ctx->block());
        symbolTable.exitScope();
        currentFunction = nullptr;
        return nullptr;
    }

    antlrcpp::Any visitBlock(SysYParser::BlockContext *ctx) override {
        symbolTable.enterScope();
        for (auto item : ctx->blockItem()) visit(item);
        symbolTable.exitScope();
        return nullptr;
    }

    antlrcpp::Any visitAssignStmt(SysYParser::AssignStmtContext *ctx) override {
        ValuePtr ptr = getLValPointer(ctx->lVal());
        ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp()));
        if (ptr && rhs) builder.CreateStore(rhs, ptr);
        return nullptr;
    }

    antlrcpp::Any visitExpStmt(SysYParser::ExpStmtContext *ctx) override {
        if(ctx->exp()) visit(ctx->exp());
        return nullptr;
    }

    antlrcpp::Any visitDecl(SysYParser::DeclContext *ctx) override {
        if (ctx->constDecl()) return visit(ctx->constDecl());
        if (ctx->varDecl()) return visit(ctx->varDecl());
        return nullptr;
    }

    antlrcpp::Any visitConstDecl(SysYParser::ConstDeclContext *ctx) override {
        for (auto def : ctx->constDef()) {
            std::string name = getTokenText(def->IDENT());
            
            if (!def->L_BRACK().empty()) {
                std::vector<int> dims;
                int totalSize = 1;
                for(auto d : def->constExp()) {
                    int sz = evalConstExp(d->exp());
                    dims.push_back(sz);
                    totalSize *= sz;
                }
                
                std::vector<int> initValues(totalSize, 0);
                if (def->constInitVal()) {
                    int currentIdx = 0;
                    flattenConstInitVal(initValues, currentIdx, def->constInitVal(), dims, 0);
                }

                if (currentFunction) {
                    std::string typeStr = "[" + std::to_string(totalSize) + " x i32]";
                    ValuePtr ptr = builder.CreateAlloca(typeStr);
                    symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, true, 0, true, dims);
                    
                    // 局部常量数组必须全部存储，包括 0 值，因为 alloca 内存未初始化
                    for (int i = 0; i < totalSize; ++i) {
                         ValuePtr idxVal = new ConstantInt(i);
                         ValuePtr elemPtr = builder.CreateGEP(ptr, idxVal, totalSize);
                         builder.CreateStore(initValues[i], elemPtr);
                    }
                } else {
                    std::stringstream ss;
                    ss << "@" << name << " = dso_local constant [" << totalSize << " x i32] [";
                    for (int i = 0; i < totalSize; ++i) {
                        ss << "i32 " << initValues[i];
                        if (i < totalSize - 1) ss << ", ";
                    }
                    ss << "], align 16";
                    module->globalLines.push_back(ss.str());
                    
                    ValuePtr ptr = new Value(Type::getInt32Ty(), "@" + name);
                    symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, true, 0, true, dims);
                }
                continue;
            }

            // 标量处理
            if (!def->constInitVal()->constExp()) continue; 
            int val = evalConstExp(def->constInitVal()->constExp()->exp());
            
            if (currentFunction) {
                ValuePtr ptr = builder.CreateAlloca("i32");
                builder.CreateStore(val, ptr);
                symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, true, val);
            } else {
                std::string ir = "@" + name + " = dso_local constant i32 " + std::to_string(val) + ", align 4";
                module->globalLines.push_back(ir);
                ValuePtr ptr = new Value(Type::getInt32Ty(), "@" + name);
                symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, true, val);
            }
        }
        return nullptr;
    }

    antlrcpp::Any visitVarDecl(SysYParser::VarDeclContext *ctx) override {
        for (auto def : ctx->varDef()) {
            std::string name = getTokenText(def->IDENT());

            // 数组处理
            if (!def->L_BRACK().empty()) {
                std::vector<int> dims;
                int totalSize = 1;
                for(auto d : def->constExp()) {
                    int sz = evalConstExp(d->exp());
                    dims.push_back(sz);
                    totalSize *= sz;
                }

                if (currentFunction) {
                    std::string typeStr = "[" + std::to_string(totalSize) + " x i32]";
                    ValuePtr ptr = builder.CreateAlloca(typeStr);
                    symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, false, 0, true, dims);

                    if (def->ASSIGN() && def->initVal()) {
                        // 局部数组初始化：使用 flattenVarInitVal 获取所有初始值（包括 padding 的 0）
                        std::vector<ValuePtr> initVals(totalSize);
                        for(int i=0; i<totalSize; ++i) initVals[i] = new ConstantInt(0);
                        
                        int idx = 0;
                        flattenVarInitVal(initVals, idx, def->initVal(), dims, 0);
                        
                        // 全部存储以初始化栈内存
                        for(int i=0; i<totalSize; ++i) {
                             ValuePtr idxVal = new ConstantInt(i);
                             ValuePtr elemPtr = builder.CreateGEP(ptr, idxVal, totalSize);
                             builder.CreateStore(initVals[i], elemPtr);
                        }
                    } 
                    // 如果没有初始化列表，则内容未定义，不需要 store
                } else {
                    // 全局数组：必须是常量初始化
                    std::vector<int> constInitValues(totalSize, 0);
                    bool hasStaticInit = false;
                    if (def->ASSIGN() && def->initVal()) {
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
                        std::function<void(SysYParser::InitValContext*, int&, int)> helper;
                        helper = [&](SysYParser::InitValContext* v, int& currentIdx, int dimLevel) {
                            if (v->exp()) {
                                if (currentIdx < totalSize) constInitValues[currentIdx++] = evalConstExp(v->exp());
                            } else if (v->L_BRACE()) {
                                int startPos = currentIdx;
                                for(auto child : v->initVal()) helper(child, currentIdx, dimLevel + 1);
                                int blockSize = getDimSize(dims, dimLevel);
                                while(currentIdx < startPos + blockSize && currentIdx < totalSize) {
                                    constInitValues[currentIdx++] = 0;
                                }
                            }
                        };
                        
                        helper(def->initVal(), idx, 0);
                        hasStaticInit = true;
                    }
                    
                    std::stringstream ss;
                    ss << "@" << name << " = dso_local global [" << totalSize << " x i32] ";
                    if (hasStaticInit) {
                        ss << "[";
                        for (int i = 0; i < totalSize; ++i) {
                            ss << "i32 " << constInitValues[i];
                            if (i < totalSize - 1) ss << ", ";
                        }
                        ss << "]";
                    } else {
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
            if (currentFunction) {
                ValuePtr ptr = builder.CreateAlloca("i32");
                if (def->ASSIGN() && def->initVal()->exp()) {
                    ValuePtr initVal = std::any_cast<ValuePtr>(visit(def->initVal()->exp()));
                    if (initVal) builder.CreateStore(initVal, ptr);
                }
                symbolTable.addSymbol(name, Type::getInt32Ty(), ptr, false, 0);
            } else {
                int initVal = 0;
                if (def->ASSIGN() && def->initVal()->exp()) {
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

    antlrcpp::Any visitReturnStmt(SysYParser::ReturnStmtContext *ctx) override {
        if (ctx->exp()) {
            ValuePtr val = std::any_cast<ValuePtr>(visit(ctx->exp()));
            if (val) builder.CreateRet(val);
        } else {
             builder.CreateRet(new ConstantInt(0));
        }
        return nullptr;
    }

    antlrcpp::Any visitNumberExp(SysYParser::NumberExpContext *ctx) override {
        int val = parseInteger(getTokenText(ctx->number()->IntConst()));
        return (ValuePtr)new ConstantInt(val);
    }

    antlrcpp::Any visitLValExp(SysYParser::LValExpContext *ctx) override {
        std::string name = getTokenText(ctx->lVal()->IDENT());
        SymbolInfo* info = symbolTable.lookup(name);
        
        if (info && info->isConst && !info->isArray) {
            return (ValuePtr)new ConstantInt(info->constIntVal);
        }

        ValuePtr ptr = getLValPointer(ctx->lVal());
        if (ptr) return builder.CreateLoad(ptr);
        
        return (ValuePtr)new ConstantInt(0);
    }

    antlrcpp::Any visitAddSubExp(SysYParser::AddSubExpContext *ctx) override {
        ValuePtr lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));
        if (!lhs || !rhs) return (ValuePtr)nullptr;

        auto c1 = dynamic_cast<ConstantInt*>(lhs);
        auto c2 = dynamic_cast<ConstantInt*>(rhs);
        if (c1 && c2) return (ValuePtr)new ConstantInt(ctx->PLUS() ? c1->value + c2->value : c1->value - c2->value);

        std::string op = ctx->PLUS() ? "add" : "sub";
        auto inst = builder.CreateBinary(op, lhs, rhs);
        return (ValuePtr)inst;
    }

    antlrcpp::Any visitMulDivModExp(SysYParser::MulDivModExpContext *ctx) override {
        ValuePtr lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));
        if (!lhs || !rhs) return (ValuePtr)nullptr;

        auto c1 = dynamic_cast<ConstantInt*>(lhs);
        auto c2 = dynamic_cast<ConstantInt*>(rhs);
        if (c1 && c2) {
             if (ctx->MUL()) return (ValuePtr)new ConstantInt(c1->value * c2->value);
             if (c2->value != 0) {
                 if (ctx->DIV()) return (ValuePtr)new ConstantInt(c1->value / c2->value);
                 if (ctx->MOD()) return (ValuePtr)new ConstantInt(c1->value % c2->value);
             }
        }

        std::string op = ctx->MUL() ? "mul" : (ctx->DIV() ? "sdiv" : "srem");
        auto inst = builder.CreateBinary(op, lhs, rhs);
        return (ValuePtr)inst;
    }

    antlrcpp::Any visitUnaryExp(SysYParser::UnaryExpContext *ctx) override {
        if (ctx->PLUS()) return visit(ctx->exp());
        ValuePtr val = std::any_cast<ValuePtr>(visit(ctx->exp()));
        if (!val) return (ValuePtr)nullptr;

        if (auto c = dynamic_cast<ConstantInt*>(val)) {
            if (ctx->MINUS()) return (ValuePtr)new ConstantInt(-c->value);
            if (ctx->NOT()) return (ValuePtr)new ConstantInt(!c->value);
        }
        if (ctx->MINUS()) {
            ValuePtr zero = new ConstantInt(0);
            return builder.CreateBinary("sub", zero, val);
        }
        if (ctx->NOT()) {
            ValuePtr zero = new ConstantInt(0);
            ValuePtr cmp = builder.CreateICmp("eq", val, zero);
            return builder.CreateZExt(cmp);
        }
        return val;
    }
    
    antlrcpp::Any visitRelExp(SysYParser::RelExpContext *ctx) override {
        ValuePtr lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));
        
        std::string op;
        if (ctx->LT()) op = "slt";
        else if (ctx->GT()) op = "sgt";
        else if (ctx->LE()) op = "sle";
        else if (ctx->GE()) op = "sge";
        
        ValuePtr cmp = builder.CreateICmp(op, lhs, rhs);
        return builder.CreateZExt(cmp);
    }
    
    antlrcpp::Any visitEqNeqExp(SysYParser::EqNeqExpContext *ctx) override {
        ValuePtr lhs = std::any_cast<ValuePtr>(visit(ctx->exp(0)));
        ValuePtr rhs = std::any_cast<ValuePtr>(visit(ctx->exp(1)));
        
        std::string op = ctx->EQ() ? "eq" : "ne";
        ValuePtr cmp = builder.CreateICmp(op, lhs, rhs);
        return builder.CreateZExt(cmp);
    }

    antlrcpp::Any visitParenExp(SysYParser::ParenExpContext *ctx) override {
        return visit(ctx->exp());
    }

    antlrcpp::Any visitFuncCallExp(SysYParser::FuncCallExpContext *ctx) override {
        std::string funcName = getTokenText(ctx->IDENT());
        std::string argsStr = "";
        
        if (ctx->funcRParams()) {
            for (size_t i = 0; i < ctx->funcRParams()->exp().size(); ++i) {
                ValuePtr argVal = std::any_cast<ValuePtr>(visit(ctx->funcRParams()->exp(i)));
                if (i > 0) argsStr += ", ";
                argsStr += "i32 " + argVal->to_string();
            }
        }
        
        std::string name = builder.nextName();
        auto inst = std::make_unique<Instruction>(Type::getInt32Ty(), name, "call", 
            "i32 @" + funcName + "(" + argsStr + ")");
        ValuePtr res = inst.get();
        builder.currentBlock->addInstruction(std::move(inst));
        return res;
    }
};