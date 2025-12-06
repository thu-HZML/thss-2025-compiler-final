#pragma once

#include "IR.h"
#include <string>

// Forward declarations
class Function;
class BasicBlock;

class IRBuilder {
private:
    BasicBlock* currentBlock = nullptr;
    int regCounter = 0;

    // Helper to generate unique virtual register names like %1, %2, %a1, etc.
    std::string nextName() {
        return "%" + std::to_string(regCounter++);
    }

public:
    void setInsertPoint(BasicBlock* block) {
        currentBlock = block;
    }

    void reset() {
        regCounter = 0;
    }

    // 1. ALLOCA (Allocate memory for local variables)
    ValuePtr CreateAlloca(TypePtr type, const std::string& varName) {
        // Alloca result is an i32* (pointer to i32).
        // For simplicity, we use the variable name as the LLVM address name (%a).
        std::string name = "%" + varName;
        std::string irCode = "alloca i32, align 4";
        
        // We set the instruction's *result* type to i32 (the pointer target is implicit in the instruction).
        auto inst = std::make_unique<Instruction>(Type::getInt32Ty(), name, irCode); 
        ValuePtr result = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return result;
    }

    // 2. STORE (Saves a value to an address)
    void CreateStore(int constantValue, ValuePtr ptr) {
        // ptr->to_string() gets the name of the memory location, e.g., %a
        // The pointer type is implicitly i32* in our simplified world.
        std::string irCode = "store i32 " + std::to_string(constantValue) + 
                             ", i32* " + ptr->to_string() + ", align 4";
        currentBlock->addInstruction(std::make_unique<Instruction>(Type::getVoidTy(), "", irCode));
    }


    // 3. LOAD (Loads a value from an address)
    ValuePtr CreateLoad(ValuePtr ptr) {
        // The result of load is the value itself (i32).
        TypePtr loadedType = Type::getInt32Ty(); 
        std::string name = nextName(); // Generates %a1, %a2 etc.
        // ptr->to_string() gets the name of the address (%a)
        std::string irCode = "load i32, i32* " + ptr->to_string() + ", align 4";

        auto inst = std::make_unique<Instruction>(loadedType, name, irCode);
        ValuePtr result = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return result;
    }

    // 4. RET (Returns a value from the function)
    void CreateRet(ValuePtr value) {
        // value->to_string() gets the value name, e.g., %a1
        std::string irCode = "ret i32 " + value->to_string();
        currentBlock->addInstruction(std::make_unique<Instruction>(Type::getVoidTy(), "", irCode));
    }
};