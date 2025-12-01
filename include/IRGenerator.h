#pragma once
#include <any>
#include "IR.h"
#include "IRBuilder.h"
#include "SymbolTable.h"

// ANTLR Generated Headers (Assuming you ran 'make antlr')
#include "antlr4-runtime.h"
#include "SysYParserBaseVisitor.h"
#include "SysYParser.h" 

class IRGenerator : public SysYParserBaseVisitor {
public:
    IRGenerator() : module(std::make_unique<Module>()) {}
    
    std::string getIR() const {
        return module->to_string();
    }

private:
    std::unique_ptr<Module> module;
    IRBuilder builder;
    SymbolTable symbolTable;
    Function* currentFunction = nullptr;

    // Helper: Gets the text of a terminal node (e.g., IDENT, IntConst)
    std::string getTokenText(antlr4::tree::TerminalNode* node) {
        return node->getSymbol()->getText();
    }

    // Helper: Extracts integer value from IntConst token
    int getIntValue(antlr4::tree::TerminalNode* node) {
        std::string text = getTokenText(node);
        return std::stoi(text); // Basic decimal integer parsing
    }

public:
    // --- Visitor Overrides ---
    
    // Visit CompUnit: Top-level node
    antlrcpp::Any visitCompUnit(SysYParser::CompUnitContext *ctx) override {
        // Only interested in funcDef for now
        for (auto funcDef : ctx->funcDef()) {
            visit(funcDef);
        }
        return nullptr; 
    }

    // Visit FuncDef: int main() { ... }
    antlrcpp::Any visitFuncDef(SysYParser::FuncDefContext *ctx) override {
        TypePtr retType = (ctx->funcType()->VOID() != nullptr) ? Type::getVoidTy() : Type::getInt32Ty();
        std::string funcName = getTokenText(ctx->IDENT());
        
        // 1. Create Function object
        auto func = std::make_unique<Function>(retType, funcName);
        currentFunction = func.get();
        module->addFunction(std::move(func));

        // 2. Setup Scope and Builder
        symbolTable.enterScope(); 
        builder.reset();
        builder.setInsertPoint(currentFunction->getEntryBlock());

        // 3. Visit the function block
        visit(ctx->block());

        // 4. Clean up
        symbolTable.exitScope();
        currentFunction = nullptr; 
        return nullptr;
    }

    // Visit Block: { blockItem* }
    antlrcpp::Any visitBlock(SysYParser::BlockContext *ctx) override {
        symbolTable.enterScope();
        for (auto item : ctx->blockItem()) {
            visit(item);
        }
        symbolTable.exitScope();
        return nullptr;
    }
    
    // Visit VarDecl: int a = 1;
    antlrcpp::Any visitVarDecl(SysYParser::VarDeclContext *ctx) override {
        // SysY allows multiple varDefs in one varDecl, loop through them
        for (auto varDef : ctx->varDef()) {
            visit(varDef);
        }
        return nullptr;
    }

    // Visit VarDef: Variable definition with initialization (e.g., a = 1)
    antlrcpp::Any visitVarDef(SysYParser::VarDefContext *ctx) override {
        // Check for initialization (ASSIGN token presence)
        if (ctx->ASSIGN()) { 
            std::string varName = getTokenText(ctx->IDENT());
            TypePtr varType = Type::getInt32Ty();

            // 1. Allocate memory for the local variable: %a = alloca i32
            ValuePtr varAddress = builder.CreateAlloca(varType, varName);
            
            // 2. We assume the initVal is a direct integer constant expression (for this simple step)
            // ctx->initVal()->exp() is guaranteed to exist if ASSIGN is present.
            SysYParser::ExpContext* expCtx = ctx->initVal()->exp();
            
            // We check if the expression is a simple number literal (NumberExp context)
            if (auto numExpCtx = dynamic_cast<SysYParser::NumberExpContext*>(expCtx)) {
                int initVal = getIntValue(numExpCtx->number()->IntConst());
                // 3. Store the initial value: store i32 1, i32* %a
                builder.CreateStore(initVal, varAddress);
            } 
            // TODO: For a complete implementation, recursive visit(ctx->initVal()) is needed.
            
            // 4. Add the variable's address to the symbol table
            if (!symbolTable.addSymbol(varName, varType, varAddress)) {
                std::cerr << "Error: Redefinition of local variable " << varName << std::endl;
            }
        }
        return nullptr;
    }

    // Visit ReturnStmt: return exp;
    antlrcpp::Any visitReturnStmt(SysYParser::ReturnStmtContext *ctx) override {
        // Assumes integer function return
        if (ctx->exp()) {
            // 1. Visit the expression (e.g., 'a' in 'return a;') to get its value
            ValuePtr returnVal = std::any_cast<ValuePtr>(visit(ctx->exp()));

            // 2. Generate the return instruction: ret i32 %a1
            builder.CreateRet(returnVal);
        }
        return nullptr;
    }

    // --- Expression Implementations (Minimal for the example) ---

    // Visit LValExp: expression is a variable access (e.g., 'a' in 'return a;')
    antlrcpp::Any visitLValExp(SysYParser::LValExpContext *ctx) override {
        // Note: For this simple stage, we assume lVal is a simple identifier without array access
        std::string varName = getTokenText(ctx->lVal()->IDENT());
        
        // 1. Look up the variable's memory address (%a)
        SymbolInfo* info = symbolTable.lookup(varName);

        if (info) {
            // 2. Generate LOAD instruction: %a1 = load i32, i32* %a
            ValuePtr value = builder.CreateLoad(info->value);
            return value; // Return the loaded value (%a1)
        } else {
            std::cerr << "Error: Undefined variable reference " << varName << std::endl;
            // Throw an error or return a placeholder in a real compiler
            return new Value(Type::getInt32Ty(), "undef");
        }
    }

    // Visit NumberExp: expression is a constant number (e.g., 1)
    antlrcpp::Any visitNumberExp(SysYParser::NumberExpContext *ctx) override {
        // Get the integer literal value.
        std::string text = getTokenText(ctx->number()->IntConst());
        
        // In LLVM IR, a constant is its own Value.
        // We return a temporary Value object representing the constant.
        return (ValuePtr) new Value(Type::getInt32Ty(), text); 
    }
};