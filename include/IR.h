#pragma once

#include <string>
#include <vector>
#include <memory>
#include <sstream>
#include <iostream>
#include <unordered_map>

// --- 前向声明 ---
class BasicBlock;
class Value;
class PhiNode;
using ValuePtr = Value*;
using TypePtr = class Type*;

// --- 1. 类型系统增强 ---
class Type {
public:
    enum TypeID { IntTyID, VoidTyID, LabelTyID, FunctionTyID, PointerTyID, ArrayTyID };
    std::string irName;
    TypeID id;
    
    // 数组类型专用字段
    Type* elementType;  // 数组元素类型
    int arraySize;      // 数组大小（-1表示可变长度）

    Type(TypeID id, const std::string& name, Type* elemType = nullptr, int size = -1) 
        : irName(name), id(id), elementType(elemType), arraySize(size) {}
    
    virtual ~Type() = default;

    static Type* getInt32Ty() { static Type t(IntTyID, "i32"); return &t; }
    static Type* getVoidTy() { static Type t(VoidTyID, "void"); return &t; }

    bool isVoidTy() const { return id == VoidTyID; }
    bool isIntegerTy() const { return id == IntTyID; }
    bool isPointerTy() const { return id == PointerTyID; }

    // 静态工厂方法
    static Type* getInt32Ty() { 
        static Type t(IntTyID, "i32"); 
        return &t; 
    }
    
    static Type* getVoidTy() { 
        static Type t(VoidTyID, "void"); 
        return &t; 
    }
    
    // 创建指针类型
    static Type* getPointerTy(Type* baseType) {
        static std::unordered_map<Type*, Type*> ptrTypes;
        if (ptrTypes.find(baseType) == ptrTypes.end()) {
            ptrTypes[baseType] = new Type(PointerTyID, baseType->irName + "*", baseType);
        }
        return ptrTypes[baseType];
    }
    
    // 创建数组类型
    static Type* getArrayTy(Type* elemType, int size) {
        return new Type(ArrayTyID, "[" + std::to_string(size) + " x " + elemType->irName + "]", 
                        elemType, size);
    }

    // 类型查询方法
    bool isInt32Ty() const { return id == IntTyID; }
    bool isVoidTy() const { return id == VoidTyID; }
    bool isArrayTy() const { return id == ArrayTyID; }
    bool isPointerTy() const { return id == PointerTyID; }
    
    // 获取类型字符串表示
    std::string toString() const {
        return irName;
    }
};

// --- 2. Value 基类 ---
class Value {
public:
    Type* type;
    std::string name;

    Value(Type* type, const std::string& name) : type(type), name(name) {}
    virtual ~Value() = default;
    
    virtual std::string to_string() const { 
        return name; 
    }
    
    Type* getType() const { 
        return type; 
    }
};

// --- 3. 常量类 ---
class ConstantInt : public Value {
public:
    int value;
    
    ConstantInt(int val) : Value(Type::getInt32Ty(), std::to_string(val)), value(val) {}
    
    ConstantInt(int val, Type* type) : Value(type, std::to_string(val)), value(val) {}
    
    static ConstantInt* get(int val) {
        static std::unordered_map<int, ConstantInt*> constants;
        if (constants.find(val) == constants.end()) {
            constants[val] = new ConstantInt(val);
        }
        return constants[val];
    }
};

class ConstantBool : public Value {
public:
    bool value;
    
    ConstantBool(bool val) : Value(Type::getInt1Ty(), val ? "true" : "false"), value(val) {}
    
    std::string to_string() const override {
        return value ? "1" : "0";
    }
};

// --- 4. 指令基类 ---
class Instruction : public Value {
public:
    std::string opcode;
    std::string args;
    std::vector<ValuePtr> operands;
    
    Instruction(Type* type, const std::string& name, const std::string& opcode, 
                const std::string& arguments = "")
        : Value(type, name), opcode(opcode), args(arguments) {}
    
    virtual ~Instruction() = default;
    
    virtual std::string print() const {
        if (name.empty()) {
            return "  " + opcode + " " + args;
        }
        return "  " + name + " = " + opcode + " " + args;
    }
    
    void addOperand(ValuePtr val) {
        operands.push_back(val);
    }
};

// --- 5. 二元运算指令 ---
class BinaryInst : public Instruction {
public:
    BinaryInst(std::string op, ValuePtr lhs, ValuePtr rhs, std::string name)
        : Instruction(lhs->getType(), name, op, 
                     lhs->getType()->toString() + " " + lhs->to_string() + 
                     ", " + rhs->to_string()) {
        addOperand(lhs);
        addOperand(rhs);
    }
};

// --- 6. 比较指令 ---
class ICmpInst : public Instruction {
public:
    std::string predicate;
    
    ICmpInst(std::string pred, ValuePtr lhs, ValuePtr rhs, std::string name)
        : Instruction(Type::getInt1Ty(), name, "icmp", 
                     pred + " " + lhs->getType()->toString() + " " + lhs->to_string() + 
                     ", " + rhs->to_string()), predicate(pred) {
        addOperand(lhs);
        addOperand(rhs);
    }
};

// --- 7. 类型转换指令 ---
class CastInst : public Instruction {
public:
    CastInst(std::string op, ValuePtr val, Type* destTy, std::string name)
        : Instruction(destTy, name, op, 
                     val->getType()->toString() + " " + val->to_string() + 
                     " to " + destTy->toString()) {
        addOperand(val);
    }
};

// --- 8. 内存访问指令 ---
class AllocaInst : public Instruction {
public:
    AllocaInst(Type* allocatedType, std::string name)
        : Instruction(Type::getPointerTy(allocatedType), name, "alloca", 
                     allocatedType->toString() + ", align 4") {}
};

class LoadInst : public Instruction {
public:
    LoadInst(ValuePtr ptr, std::string name)
        : Instruction(ptr->getType()->isPointerTy() ? 
                     static_cast<Type*>(ptr->getType())->elementType : Type::getInt32Ty(), 
                     name, "load", 
                     (ptr->getType()->isPointerTy() ? 
                      static_cast<Type*>(ptr->getType())->elementType->toString() : "i32") + 
                     ", " + ptr->getType()->toString() + " " + ptr->to_string() + ", align 4") {
        addOperand(ptr);
    }
};

class StoreInst : public Instruction {
public:
    StoreInst(ValuePtr val, ValuePtr ptr)
        : Instruction(Type::getVoidTy(), "", "store", 
                     val->getType()->toString() + " " + val->to_string() + 
                     ", " + ptr->getType()->toString() + " " + ptr->to_string() + ", align 4") {
        addOperand(val);
        addOperand(ptr);
    }
};

// --- 9. 返回指令 ---
class ReturnInst : public Instruction {
public:
    ReturnInst(ValuePtr retVal)
        : Instruction(Type::getVoidTy(), "", "ret", 
                     retVal->getType()->toString() + " " + retVal->to_string()) {
        addOperand(retVal);
    }
    
    ReturnInst()
        : Instruction(Type::getVoidTy(), "", "ret", "") {}
};

// --- 10. 函数调用指令 ---
class CallInst : public Instruction {
public:
    CallInst(Type* retType, const std::string& funcName, 
             const std::vector<ValuePtr>& argsList, std::string name)
        : Instruction(retType, name, "call", "") {
        
        // 构建参数字符串
        std::string argsStr;
        for (size_t i = 0; i < argsList.size(); ++i) {
            if (i > 0) argsStr += ", ";
            argsStr += argsList[i]->getType()->toString() + " " + argsList[i]->to_string();
            addOperand(argsList[i]);
        }
        
        args = retType->toString() + " @" + funcName + "(" + argsStr + ")";
    }
};

// --- 11. GEP指令 ---
class GetElementPtrInst : public Instruction {
public:
    GetElementPtrInst(ValuePtr ptr, std::vector<ValuePtr> indices, std::string name)
        : Instruction(Type::getPointerTy(Type::getInt32Ty()), name, "getelementptr", "") {
        
        // 构建参数字符串
        std::string argsStr = "inbounds ";
        
        // 获取数组类型信息
        Type* currentType = ptr->getType();
        if (currentType->isPointerTy()) {
            Type* baseType = static_cast<Type*>(currentType)->elementType;
            argsStr += baseType->toString();
        } else {
            argsStr += "i32";
        }
        
        argsStr += ", " + ptr->getType()->toString() + " " + ptr->to_string();
        
        // 添加索引
        for (size_t i = 0; i < indices.size(); ++i) {
            argsStr += ", i32 " + indices[i]->to_string();
            addOperand(indices[i]);
        }
        
        args = argsStr;
        addOperand(ptr);
    }
};

// --- 12. 基本块 ---
class BasicBlock : public Value {
public:
    std::vector<std::unique_ptr<Instruction>> instList;
    
    BasicBlock(const std::string& name) : Value(Type::getVoidTy(), name) {}
    
    virtual ~BasicBlock() = default;
    
    void addInstruction(std::unique_ptr<Instruction> inst) {
        instList.push_back(std::move(inst));
    }
    
    std::string getName() const {
        return name;
    }
    
    std::string print() const {
        std::stringstream ss;
        ss << name << ":\n";
        for (const auto& inst : instList) {
            ss << inst->print() << "\n";
        }
        return ss.str();
    }
    
    // 检查基本块是否以终止指令结束
    bool isTerminated() const {
        if (instList.empty()) return false;
        const auto& lastInst = instList.back();
        return lastInst->opcode == "br" || 
               lastInst->opcode == "ret" || 
               lastInst->opcode == "switch";
    }
};

// --- 13. 控制流指令（需要在BasicBlock之后定义） ---
class BranchInst : public Instruction {
public:
    BranchInst(ValuePtr cond, BasicBlock* trueBB, BasicBlock* falseBB)
        : Instruction(Type::getVoidTy(), "", "br", 
                     "i1 " + cond->to_string() + ", label %" + 
                     trueBB->getName() + ", label %" + falseBB->getName()) {
        addOperand(cond);
    }
    
    BranchInst(BasicBlock* targetBB)
        : Instruction(Type::getVoidTy(), "", "br", 
                     "label %" + targetBB->getName()) {}
};

// --- 14. Phi节点指令（需要在BasicBlock之后定义） ---
// 在IR.h中修复PhiNode
class PhiNode : public Instruction {
public:
    struct Incoming {
        ValuePtr value;
        BasicBlock* block;
        
        Incoming(ValuePtr v, BasicBlock* b) : value(v), block(b) {}
    };
    
    std::vector<Incoming> incomings;
    
    PhiNode(Type* type, const std::string& name)
        : Instruction(type, name, "phi", "") {}
    
    void addIncoming(ValuePtr val, BasicBlock* block) {
        incomings.push_back(Incoming(val, block));
        if (!args.empty()) args += ", ";
        args += "[" + val->to_string() + ", %" + block->getName() + "]";
    }
    
    std::string print() const override {
        std::string var_name = name;
        if (!var_name.empty() && var_name[0] != '%') {
            var_name = "%" + var_name;
        }
        std::string phi_type = type->toString();
        std::string phi_args = phi_type + " " + args;
        
        if (var_name.empty()) {
            return "  " + opcode + " " + phi_args;
        }
        return "  " + var_name + " = " + opcode + " " + phi_args;
    }
};

// --- 15. 函数 ---
class Function : public Value {
public:
    std::vector<std::unique_ptr<BasicBlock>> blockList;
    std::vector<std::string> args; // 存储参数名，如 %0, %1

    Type* returnType;

    std::vector<Type*> argTypes;    // 参数类型
    
    Function(Type* retType, const std::string& name)
        : Value(retType, "@" + name), returnType(retType) { // 在构造函数中初始化 returnType
        blockList.push_back(std::make_unique<BasicBlock>("entry"));
    }
    
    BasicBlock* getEntryBlock() { 
        return blockList[0].get(); 
    }
    
    BasicBlock* createBasicBlock(const std::string& name) {
        auto bb = std::make_unique<BasicBlock>(name);
        BasicBlock* ptr = bb.get();
        blockList.push_back(std::move(bb));
        return ptr;
    }
    
    void addBasicBlock(std::unique_ptr<BasicBlock> bb) {
        blockList.push_back(std::move(bb));
    }
    
    void addBasicBlock(BasicBlock* bb) {
        blockList.push_back(std::unique_ptr<BasicBlock>(bb));
    }
    
    bool hasBasicBlock(BasicBlock* bb) const {
        for (const auto& b : blockList) {
            if (b.get() == bb) return true;
        }
        return false;
    }
    
    std::string print() const {
        std::stringstream ss;
        ss << "define " << type->toString() << " " << name << "(";
        
        // 打印参数列表
        for (size_t i = 0; i < args.size(); ++i) {
            if (i < argTypes.size()) {
                ss << argTypes[i]->toString();
            } else {
                ss << "i32";  // 默认类型
            }
            ss << " " << args[i];
            if (i < args.size() - 1) ss << ", ";
        }
        ss << ") {\n";
        
        for (const auto& block : blockList) {
            ss << block->print();
        }
        ss << "}\n";
        return ss.str();
    }
};

// --- 16. 模块 ---
class Module {
public:
    std::vector<std::unique_ptr<Function>> funcList;
    std::vector<std::string> globalDecls;
    
    void addFunction(std::unique_ptr<Function> func) { 
        funcList.push_back(std::move(func)); 
    }
    
    void addGlobalDecl(const std::string& decl) {
        globalDecls.push_back(decl);
    }
    
    std::string print() const {
        std::stringstream ss;
        
        // 输出全局声明
        for (const auto& decl : globalDecls) {
            ss << decl << "\n";
        }
        
        if (!globalDecls.empty()) {
            ss << "\n";
        }
        
        // 输出函数定义
        for (const auto& f : funcList) {
            ss << f->print() << "\n";
        }
        return ss.str();
    }
};