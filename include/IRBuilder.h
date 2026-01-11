#pragma once

#include "IR.h"
#include <string>
#include <vector>
#include <memory>

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

    BasicBlock* getInsertBlock() {
        return currentBlock;
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

    // 3. Load - 增强版本
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
    
    void CreateRetVoid() {
        currentBlock->addInstruction(std::make_unique<Instruction>(Type::getVoidTy(), "", "ret", ""));
    }

    // 5. Binary Ops (用于数组地址计算)
    ValuePtr CreateBinary(std::string op, ValuePtr lhs, ValuePtr rhs) {
        std::string name = nextName();
        auto inst = std::make_unique<BinaryInst>(op, lhs, rhs, name);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }
    
    // 6. ICmp
    ValuePtr CreateICmp(std::string cond, ValuePtr lhs, ValuePtr rhs) {
        std::string name = nextName();
        std::string args = cond + " i32 " + lhs->to_string() + ", " + rhs->to_string();
        auto inst = std::make_unique<Instruction>(Type::getInt32Ty(), name, "icmp", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }
    
    // 7. ZExt - 增强版本
    ValuePtr CreateZExt(ValuePtr val) {
        std::string name = nextName();
        std::string args = "i1 " + val->to_string() + " to i32";
        auto inst = std::make_unique<Instruction>(Type::getInt32Ty(), name, "zext", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }
    
    // 8. GEP (支持扁平化数组寻址)
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

    // 9. 条件跳转 - 新增
    void CreateCondBr(ValuePtr cond, BasicBlock* trueBB, BasicBlock* falseBB) {
        std::string args = "i1 " + cond->to_string() + ", label %" + 
                          trueBB->getName() + ", label %" + falseBB->getName();
        currentBlock->addInstruction(std::make_unique<Instruction>(Type::getVoidTy(), "", "br", args));
    }

    // 10. 无条件跳转 - 新增
    void CreateBr(BasicBlock* targetBB) {
        std::string args = "label %" + targetBB->getName();
        currentBlock->addInstruction(std::make_unique<Instruction>(Type::getVoidTy(), "", "br", args));
    }

    // 11. Phi节点 - 新增
    PhiNode* CreatePhi(Type* type, const std::string& name) {
        // 确保phi节点名称以%开头
        std::string phiName = name;
        if (!phiName.empty() && phiName[0] != '%') {
            phiName = "%" + phiName;
        }
        
        auto phi = std::make_unique<PhiNode>(type, phiName);
        PhiNode* res = phi.get();
        currentBlock->addInstruction(std::move(phi));
        return res;
    }

    // 12. Call指令 - 新增
    ValuePtr CreateCall(const std::string& funcName, const std::vector<ValuePtr>& args) {
        std::string name = nextName();
        
        // 构造参数列表
        std::string argsStr;
        for (size_t i = 0; i < args.size(); ++i) {
            if (i > 0) argsStr += ", ";
            argsStr += args[i]->getType()->toString() + " " + args[i]->to_string();
        }
        
        std::string callStr = "i32 @" + funcName + "(" + argsStr + ")";
        auto inst = std::make_unique<Instruction>(Type::getInt32Ty(), name, "call", callStr);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    // 13. 比较操作助手函数 - 新增
    ValuePtr CreateCmpEQ(ValuePtr lhs, ValuePtr rhs) {
        return CreateICmp("eq", lhs, rhs);
    }
    
    ValuePtr CreateCmpNE(ValuePtr lhs, ValuePtr rhs) {
        return CreateICmp("ne", lhs, rhs);
    }
    
    ValuePtr CreateCmpLT(ValuePtr lhs, ValuePtr rhs) {
        return CreateICmp("slt", lhs, rhs);
    }
    
    ValuePtr CreateCmpLE(ValuePtr lhs, ValuePtr rhs) {
        return CreateICmp("sle", lhs, rhs);
    }
    
    ValuePtr CreateCmpGT(ValuePtr lhs, ValuePtr rhs) {
        return CreateICmp("sgt", lhs, rhs);
    }
    
    ValuePtr CreateCmpGE(ValuePtr lhs, ValuePtr rhs) {
        return CreateICmp("sge", lhs, rhs);
    }

    // 14. 逻辑运算助手函数 - 新增
    ValuePtr CreateLogicalAnd(ValuePtr lhs, ValuePtr rhs) {
        // 将操作数转换为布尔值
        ValuePtr zero = new ConstantInt(0);
        ValuePtr lhsBool = CreateCmpNE(lhs, zero);
        ValuePtr rhsBool = CreateCmpNE(rhs, zero);
        
        // 逻辑与：and i1 %lhs_bool, %rhs_bool
        std::string name = nextName();
        std::string args = "i1 " + lhsBool->to_string() + ", " + rhsBool->to_string();
        auto inst = std::make_unique<Instruction>(Type::getInt1Ty(), name, "and", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        
        // 转换为i32
        return CreateZExt(res);
    }
    
    ValuePtr CreateLogicalOr(ValuePtr lhs, ValuePtr rhs) {
        // 将操作数转换为布尔值
        ValuePtr zero = new ConstantInt(0);
        ValuePtr lhsBool = CreateCmpNE(lhs, zero);
        ValuePtr rhsBool = CreateCmpNE(rhs, zero);
        
        // 逻辑或：or i1 %lhs_bool, %rhs_bool
        std::string name = nextName();
        std::string args = "i1 " + lhsBool->to_string() + ", " + rhsBool->to_string();
        auto inst = std::make_unique<Instruction>(Type::getInt1Ty(), name, "or", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        
        // 转换为i32
        return CreateZExt(res);
    }

    // 15. 一元操作 - 新增
    ValuePtr CreateNeg(ValuePtr val) {
        // 0 - val
        ValuePtr zero = new ConstantInt(0);
        return CreateBinary("sub", zero, val);
    }
    
    ValuePtr CreateNot(ValuePtr val) {
        // val == 0 ? 1 : 0
        ValuePtr zero = new ConstantInt(0);
        ValuePtr cmp = CreateCmpEQ(val, zero);
        return CreateZExt(cmp);
    }

    // 16. 数组访问助手函数 - 增强
    ValuePtr CreateArrayAccess(ValuePtr arrayPtr, ValuePtr index, 
                               const std::vector<int>& dims) {
        // 计算扁平化索引
        ValuePtr flatIndex = index;
        
        // 如果是多维数组，需要计算偏移
        if (dims.size() > 1) {
            // 这里简化处理，假设index已经计算好
            // 实际应该根据多维索引计算扁平化索引
        }
        
        int totalSize = 1;
        for (int d : dims) totalSize *= d;
        
        return CreateGEP(arrayPtr, flatIndex, totalSize);
    }

    // 17. 创建常量 - 新增
    ValuePtr CreateConstantInt(int value) {
        return new ConstantInt(value);
    }
    
    ValuePtr CreateConstantBool(bool value) {
        return new ConstantInt(value ? 1 : 0);
    }

    // 18. 类型转换助手 - 新增
    ValuePtr CreateTrunc(ValuePtr val, Type* destType) {
        std::string name = nextName();
        std::string args = "i32 " + val->to_string() + " to " + destType->toString();
        
        auto inst = std::make_unique<Instruction>(destType, name, "trunc", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }
    
    ValuePtr CreateSExt(ValuePtr val, Type* destType) {
        std::string name = nextName();
        std::string args = val->getType()->toString() + " " + val->to_string() + " to " + destType->toString();
        
        auto inst = std::make_unique<Instruction>(destType, name, "sext", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }
};