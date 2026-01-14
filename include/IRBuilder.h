#pragma once

#include "IR.h"
#include <string>
#include <vector>
#include <memory>

class IRBuilder
{
public:
    BasicBlock *currentBlock = nullptr;
    Module *module = nullptr;
    int regCounter = 0;

    std::string nextName()
    {
        return "%" + std::to_string(regCounter++);
    }

    void setInsertPoint(BasicBlock *block)
    {
        currentBlock = block;
    }

    BasicBlock *getInsertBlock()
    {
        return currentBlock;
    }

    void reset()
    {
        regCounter = 0;
    }

    // 1. Alloca
    ValuePtr CreateAlloca(Type *ty)
    {
        std::string name = nextName();
        // 参数字符串： "i32, align 4"
        std::string args = ty->toString() + ", align 4";

        // 关键修复：alloca 的返回值类型是指向该类型的指针 (ty*)
        Type *ptrTy = Type::getPointerTy(ty);

        auto inst = std::make_unique<Instruction>(ptrTy, name, "alloca", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    // 浮点运算辅助方法
    ValuePtr CreateFAdd(ValuePtr lhs, ValuePtr rhs)
    {
        auto inst = std::make_unique<BinaryInst>("fadd", lhs, rhs, nextName());
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    ValuePtr CreateFSub(ValuePtr lhs, ValuePtr rhs)
    {
        auto inst = std::make_unique<BinaryInst>("fsub", lhs, rhs, nextName());
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    ValuePtr CreateFMul(ValuePtr lhs, ValuePtr rhs)
    {
        auto inst = std::make_unique<BinaryInst>("fmul", lhs, rhs, nextName());
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    ValuePtr CreateFDiv(ValuePtr lhs, ValuePtr rhs)
    {
        auto inst = std::make_unique<BinaryInst>("fdiv", lhs, rhs, nextName());
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    // 浮点比较
    ValuePtr CreateFCmp(std::string pred, ValuePtr lhs, ValuePtr rhs)
    {
        auto inst = std::make_unique<FCmpInst>(pred, lhs, rhs, nextName());
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    // 类型转换
    ValuePtr CreateFPTOSI(ValuePtr val)
    {
        auto inst = std::make_unique<FPTOSIInst>(val, nextName());
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    ValuePtr CreateSITOFP(ValuePtr val)
    {
        auto inst = std::make_unique<SITOFPInst>(val, nextName());
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    // 2. Store - 通用 (Merge Fix)
    void CreateStore(ValuePtr val, ValuePtr ptr)
    {
        std::string valTypeStr = val->getType()->toString(); // "i32" 或 "i32*"
        std::string ptrTypeStr = ptr->getType()->toString(); // "i32*" 或 "i32**"

        // 指针通常用 8字节对齐，整数用 4字节
        std::string align = val->getType()->isPointerTy() ? ", align 8" : ", align 4";

        std::string args = valTypeStr + " " + val->to_string() + ", " +
                           ptrTypeStr + " " + ptr->to_string() + align;

        currentBlock->addInstruction(std::make_unique<Instruction>(Type::getVoidTy(), "", "store", args));
    }

    // 保留重载版本用于存立即数
    void CreateStore(int val, ValuePtr ptr)
    {
        CreateStore(new ConstantInt(val), ptr);
    }

    // 3. Load - 通用 (Merge Fix)
    ValuePtr CreateLoad(ValuePtr ptr)
    {
        std::string name = nextName();
        Type *ptrType = ptr->getType();
        Type *valType;

        // 推导加载出的值的类型：如果是 i32*，则加载出 i32；如果是 i32**，则加载出 i32*
        if (ptrType->isPointerTy())
        {
            valType = ptrType->elementType;
        }
        else
        {
            // 默认回退情况
            valType = Type::getInt32Ty();
        }

        std::string align = valType->isPointerTy() ? ", align 8" : ", align 4";

        std::string args = valType->toString() + ", " +
                           ptrType->toString() + " " + ptr->to_string() + align;

        auto inst = std::make_unique<Instruction>(valType, name, "load", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }
    // 4. Ret
    void CreateRet(ValuePtr val)
    {
        std::string name = ""; // ret 指令没有返回值变量名
        // [修复] 使用 val->getType()->toString() 动态获取类型 (如 "float" 或 "i32")
        std::string args = val->getType()->toString() + " " + val->to_string();

        auto inst = std::make_unique<Instruction>(Type::getVoidTy(), name, "ret", args);
        currentBlock->addInstruction(std::move(inst));
    }

    // 支持 void 返回
    void CreateVoidRet()
    {
        currentBlock->addInstruction(std::make_unique<Instruction>(Type::getVoidTy(), "", "ret", "void"));
    }

    // 5. Binary Ops (用于数组地址计算)
    ValuePtr CreateBinary(std::string op, ValuePtr lhs, ValuePtr rhs)
    {
        std::string name = nextName();
        auto inst = std::make_unique<BinaryInst>(op, lhs, rhs, name);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    // 6. ICmp
    ValuePtr CreateICmp(std::string cond, ValuePtr lhs, ValuePtr rhs)
    {
        std::string name = nextName();
        std::string args = cond + " i32 " + lhs->to_string() + ", " + rhs->to_string();
        auto inst = std::make_unique<Instruction>(Type::getInt1Ty(), name, "icmp", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    // 7. ZExt - 增强版本
    ValuePtr CreateZExt(ValuePtr val, Type *targetTy = nullptr)
    {
        if (!targetTy)
            targetTy = Type::getInt32Ty();

        std::string name = nextName();
        std::string args = val->getType()->toString() + " " + val->to_string() + " to " + targetTy->toString();
        auto inst = std::make_unique<Instruction>(targetTy, name, "zext", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    ValuePtr CreateAdd(ValuePtr lhs, ValuePtr rhs)
    {
        return CreateBinary("add", lhs, rhs);
    }

    ValuePtr CreateSub(ValuePtr lhs, ValuePtr rhs)
    {
        return CreateBinary("sub", lhs, rhs);
    }

    // 8. GEP (支持扁平化数组寻址)
    // 扁平化后，数组总是一维 [Size x i32]
    // 访问时使用 calculated_index
    ValuePtr CreateGEP(ValuePtr ptr, ValuePtr idx, int arraySize)
    {
        std::string name = nextName();

        // 从 ptr 中获取实际的类型
        // ptr 类型通常是 [N x float]* 或 [N x i32]*
        Type *ptrType = ptr->getType();
        Type *arrayType = ptrType->elementType;     // 获取 [N x float]
        Type *elementType = arrayType->elementType; // 获取 float 或 i32

        std::string typeStr = arrayType->toString(); // e.g. "[3 x float]"

        // 构造指令: getelementptr inbounds [3 x float], [3 x float]* %ptr, i32 0, i32 %idx
        std::string args = "inbounds " + typeStr + ", " + ptrType->toString() + " " + ptr->to_string() +
                           ", i32 0, i32 " + idx->to_string();

        // 结果类型是指向元素的指针 (float* 或 i32*)
        auto inst = std::make_unique<Instruction>(Type::getPointerTy(elementType), name, "getelementptr", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    ValuePtr CreateInBoundsGEP(ValuePtr ptr, const std::vector<ValuePtr> &indices, Type *elementType)
    {
        std::string name = nextName();
        // ptr should be pointer type
        Type *baseType = static_cast<Type *>(ptr->getType())->elementType;

        std::string args = "inbounds " + baseType->toString() + ", " + ptr->getType()->toString() + " " + ptr->to_string();
        for (auto idx : indices)
        {
            args += ", " + idx->getType()->toString() + " " + idx->to_string();
        }

        Type *resultType = Type::getPointerTy(elementType);
        auto inst = std::make_unique<Instruction>(resultType, name, "getelementptr", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    // 9. Call 支持不同数量的参数
    ValuePtr CreateCall(std::string funcName, std::vector<ValuePtr> args, Type *retType)
    {
        // 如果是 void，名字为空；否则生成临时变量名
        std::string name = retType->isVoidTy() ? "" : nextName();

        std::string argStr = "";
        for (size_t i = 0; i < args.size(); ++i)
        {
            argStr += args[i]->getType()->toString() + " " + args[i]->to_string();
            if (i < args.size() - 1)
                argStr += ", ";
        }

        // 构造指令: call float @func(i32 %0, ...)
        std::string instArgs = retType->toString() + " @" + funcName + "(" + argStr + ")";

        auto inst = std::make_unique<Instruction>(retType, name, "call", instArgs);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    // 10. 条件跳转 - 新增
    void CreateCondBr(ValuePtr cond, BasicBlock *trueBB, BasicBlock *falseBB)
    {
        std::string args = "i1 " + cond->to_string() + ", label %" +
                           trueBB->getName() + ", label %" + falseBB->getName();
        currentBlock->addInstruction(std::make_unique<Instruction>(Type::getVoidTy(), "", "br", args));
    }

    // 11. 无条件跳转 - 新增
    void CreateBr(BasicBlock *targetBB)
    {
        std::string args = "label %" + targetBB->getName();
        currentBlock->addInstruction(std::make_unique<Instruction>(Type::getVoidTy(), "", "br", args));
    }

    // 12. Phi节点 - 新增
    PhiNode *CreatePhi(Type *type, const std::string &name = "")
    {
        // 如果名称为空，使用nextName()生成数字编号
        std::string phiName = name;
        if (phiName.empty())
        {
            phiName = nextName();
        }
        else if (phiName[0] != '%')
        {
            phiName = "%" + phiName;
        }

        auto phi = std::make_unique<PhiNode>(type, phiName);
        PhiNode *res = phi.get();
        currentBlock->addInstruction(std::move(phi));
        return res;
    }

    // 13. 比较操作助手函数 - 新增
    ValuePtr CreateCmpEQ(ValuePtr lhs, ValuePtr rhs)
    {
        return CreateICmp("eq", lhs, rhs);
    }

    ValuePtr CreateCmpNE(ValuePtr lhs, ValuePtr rhs)
    {
        return CreateICmp("ne", lhs, rhs);
    }

    ValuePtr CreateCmpLT(ValuePtr lhs, ValuePtr rhs)
    {
        return CreateICmp("slt", lhs, rhs);
    }

    ValuePtr CreateCmpLE(ValuePtr lhs, ValuePtr rhs)
    {
        return CreateICmp("sle", lhs, rhs);
    }

    ValuePtr CreateCmpGT(ValuePtr lhs, ValuePtr rhs)
    {
        return CreateICmp("sgt", lhs, rhs);
    }

    ValuePtr CreateCmpGE(ValuePtr lhs, ValuePtr rhs)
    {
        return CreateICmp("sge", lhs, rhs);
    }

    // 14. 逻辑运算助手函数 - 新增
    ValuePtr CreateLogicalAnd(ValuePtr lhs, ValuePtr rhs)
    {
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

    ValuePtr CreateLogicalOr(ValuePtr lhs, ValuePtr rhs)
    {
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
    ValuePtr CreateNeg(ValuePtr val)
    {
        // 0 - val
        ValuePtr zero = new ConstantInt(0);
        return CreateBinary("sub", zero, val);
    }

    ValuePtr CreateNot(ValuePtr val)
    {
        // val == 0 ? 1 : 0
        ValuePtr zero = new ConstantInt(0);
        ValuePtr cmp = CreateCmpEQ(val, zero);
        return CreateZExt(cmp);
    }

    ValuePtr CreateBitCast(ValuePtr val, Type *destTy)
    {
        std::string name = nextName();
        std::string args = val->getType()->toString() + " " + val->to_string() + " to " + destTy->toString();
        auto inst = std::make_unique<Instruction>(destTy, name, "bitcast", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    // 16. 数组访问助手函数 - 增强
    ValuePtr CreateArrayAccess(ValuePtr arrayPtr, ValuePtr index,
                               const std::vector<int> &dims)
    {
        // 计算扁平化索引
        ValuePtr flatIndex = index;

        // 如果是多维数组，需要计算偏移
        if (dims.size() > 1)
        {
            // 这里简化处理，假设index已经计算好
            // 实际应该根据多维索引计算扁平化索引
        }

        int totalSize = 1;
        for (int d : dims)
            totalSize *= d;

        return CreateGEP(arrayPtr, flatIndex, totalSize);
    }

    // 17. 创建常量 - 新增
    ValuePtr CreateConstantInt(int value)
    {
        return new ConstantInt(value);
    }

    ValuePtr CreateConstantBool(bool value)
    {
        return new ConstantInt(value ? 1 : 0);
    }

    // 18. 类型转换助手 - 新增
    ValuePtr CreateTrunc(ValuePtr val, Type *destType)
    {
        std::string name = nextName();
        std::string args = "i32 " + val->to_string() + " to " + destType->toString();

        auto inst = std::make_unique<Instruction>(destType, name, "trunc", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    ValuePtr CreateSExt(ValuePtr val, Type *destType)
    {
        std::string name = nextName();
        std::string args = val->getType()->toString() + " " + val->to_string() + " to " + destType->toString();

        auto inst = std::make_unique<Instruction>(destType, name, "sext", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }
    // 9. Pointer GEP (for int* and int[])
    ValuePtr CreatePointerGEP(ValuePtr ptr, ValuePtr idx)
    {
        std::string name = nextName();

        // ptr 类型是 float* 或 i32*
        Type *ptrType = ptr->getType();
        Type *elementType = ptrType->elementType; // float 或 i32

        // 构造指令: getelementptr float, float* %ptr, i32 %idx
        std::string args = elementType->toString() + ", " + ptrType->toString() + " " + ptr->to_string() +
                           ", i32 " + idx->to_string();

        // 结果类型依然是指针 (float* 或 i32*)
        auto inst = std::make_unique<Instruction>(ptrType, name, "getelementptr", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }

    // 10. Pointer Store/Load
    void CreatePointerStore(ValuePtr val, ValuePtr ptr)
    {
        std::string args = "i32* " + val->to_string() + ", i32** " + ptr->to_string() + ", align 8";
        currentBlock->addInstruction(std::make_unique<Instruction>(Type::getVoidTy(), "", "store", args));
    }

    ValuePtr CreatePointerLoad(ValuePtr ptr)
    {
        std::string name = nextName();
        std::string args = "i32*, i32** " + ptr->to_string() + ", align 8";
        auto inst = std::make_unique<Instruction>(Type::getPointerTy(Type::getInt32Ty()), name, "load", args);
        ValuePtr res = inst.get();
        currentBlock->addInstruction(std::move(inst));
        return res;
    }
};