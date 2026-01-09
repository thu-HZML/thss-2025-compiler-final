#pragma once

#include "IR.h"
#include <string>

class IRBuilder {
public:
    BasicBlock* currentBlock = nullptr;
    Module* module = nullptr;
    int regCounter = 0;

    std::string nextName() {
        return "%" + std::to_string(regCounter++);
    }

    void setInsertPoint(BasicBlock* block) {
        currentBlock = block;
    }

    void reset() {
        regCounter = 0;
    }

    // 1. Alloca
    ValuePtr CreateAlloca(const std::string& typeStr) {
        std::string name = nextName();
        std::string args = typeStr + ", align 4";
        auto inst = std::make_unique<Instruction>(Type::getInt32Ty(), name, "alloca", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    // 2. Store
    void CreateStore(ValuePtr val, ValuePtr ptr) {
        std::string args = "i32 " + val->to_string() + ", i32* " + ptr->to_string() + ", align 4";
        currentBlock->addInstruction(std::make_unique<Instruction>(Type::getVoidTy(), "", "store", args));
    }
    void CreateStore(int val, ValuePtr ptr) {
        std::string args = "i32 " + std::to_string(val) + ", i32* " + ptr->to_string() + ", align 4";
        currentBlock->addInstruction(std::make_unique<Instruction>(Type::getVoidTy(), "", "store", args));
    }

    // 3. Load
    ValuePtr CreateLoad(ValuePtr ptr) {
        std::string name = nextName();
        std::string args = "i32, i32* " + ptr->to_string() + ", align 4";
        auto inst = std::make_unique<Instruction>(Type::getInt32Ty(), name, "load", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    // 4. Ret
    void CreateRet(ValuePtr val) {
        std::string args = "i32 " + val->to_string();
        currentBlock->addInstruction(std::make_unique<Instruction>(Type::getVoidTy(), "", "ret", args));
    }

    // 5. Binary Ops (用于数组地址计算)
    ValuePtr CreateBinary(std::string op, ValuePtr lhs, ValuePtr rhs) {
        std::string name = nextName();
        auto inst = std::make_unique<BinaryInst>(op, lhs, rhs, name);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }
    
    // 6. ICmp / ZExt
    ValuePtr CreateICmp(std::string cond, ValuePtr lhs, ValuePtr rhs) {
        std::string name = nextName();
        std::string args = cond + " i32 " + lhs->to_string() + ", " + rhs->to_string();
        auto inst = std::make_unique<Instruction>(Type::getInt32Ty(), name, "icmp", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }
    ValuePtr CreateZExt(ValuePtr val) {
        std::string name = nextName();
        std::string args = "i1 " + val->to_string() + " to i32";
        auto inst = std::make_unique<Instruction>(Type::getInt32Ty(), name, "zext", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    // 7. GEP (支持扁平化数组寻址)
    // 扁平化后，数组总是一维 [Size x i32]
    // 访问时使用 calculated_index
    ValuePtr CreateGEP(ValuePtr ptr, ValuePtr idx, int totalSize) {
        std::string name = nextName();
        std::string type = "[" + std::to_string(totalSize) + " x i32]";
        std::string args = "inbounds " + type + ", " + type + "* " + ptr->to_string() + ", i32 0, i32 " + idx->to_string();
        
        auto inst = std::make_unique<Instruction>(Type::getInt32Ty(), name, "getelementptr", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }
};