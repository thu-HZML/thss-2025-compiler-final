#pragma once

#include <string>
#include <vector>
#include <memory>
#include <sstream>
#include <iostream>

// --- 1. Type System ---
class Type {
public:
    enum TypeID { IntTyID, VoidTyID };
    std::string irName;
    TypeID id;

    Type(TypeID id, const std::string& name) : irName(name), id(id) {}
    virtual ~Type() = default;

    static Type* getInt32Ty() { static Type t(IntTyID, "i32"); return &t; }
    static Type* getVoidTy() { static Type t(VoidTyID, "void"); return &t; }
};

// --- 2. Value ---
class Value {
public:
    Type* type;
    std::string name;

    Value(Type* type, const std::string& name) : type(type), name(name) {}
    virtual ~Value() = default;
    virtual std::string to_string() const { return name; }
};

using ValuePtr = Value*;
using TypePtr = Type*;

// --- 3. ConstantInt ---
class ConstantInt : public Value {
public:
    int value;
    ConstantInt(int val) : Value(Type::getInt32Ty(), std::to_string(val)), value(val) {}
};

// --- 4. Instruction ---
class Instruction : public Value {
public:
    std::string op;
    std::string args;

    Instruction(Type* type, const std::string& name, const std::string& opcode, const std::string& arguments)
        : Value(type, name), op(opcode), args(arguments) {}

    std::string print() const {
        if (name.empty()) return "  " + op + " " + args;
        return "  " + name + " = " + op + " " + args;
    }
};

// --- 5. BinaryInst ---
class BinaryInst : public Instruction {
public:
    BinaryInst(std::string op, ValuePtr lhs, ValuePtr rhs, std::string name)
        : Instruction(Type::getInt32Ty(), name, op, 
                      "i32 " + lhs->to_string() + ", " + rhs->to_string()) {}
};

// --- 6. BasicBlock ---
class BasicBlock : public Value {
public:
    std::vector<std::unique_ptr<Instruction>> instList;

    BasicBlock(const std::string& name) : Value(Type::getVoidTy(), name) {}
    
    void addInstruction(std::unique_ptr<Instruction> inst) {
        instList.push_back(std::move(inst));
    }

    std::string print() const {
        std::stringstream ss;
        ss << name << ":\n";
        for (const auto& inst : instList) {
            ss << inst->print() << "\n";
        }
        return ss.str();
    }
};

// --- 7. Function ---
class Function : public Value {
public:
    std::vector<std::unique_ptr<BasicBlock>> blockList;
    std::vector<std::string> args; // 存储参数名，如 %0, %1

    Function(Type* retType, const std::string& name)
        : Value(retType, "@" + name) {
        blockList.push_back(std::make_unique<BasicBlock>("entry"));
    }

    BasicBlock* getEntryBlock() { return blockList[0].get(); }

    std::string print() const {
        std::stringstream ss;
        ss << "define " << type->irName << " " << name << "(";
        // 打印参数列表
        for (size_t i = 0; i < args.size(); ++i) {
            ss << "i32 " << args[i];
            if (i < args.size() - 1) ss << ", ";
        }
        ss << ") {\n";
        for (const auto& block : blockList) ss << block->print();
        ss << "}\n";
        return ss.str();
    }
};

// --- 8. Module ---
class Module {
public:
    std::vector<std::unique_ptr<Function>> funcList;
    void addFunction(std::unique_ptr<Function> func) { funcList.push_back(std::move(func)); }
    
    std::string print() const {
        std::stringstream ss;
        ss << "declare i32 @getint()\ndeclare void @putint(i32)\n\n";
        for (const auto& f : funcList) ss << f->print() << "\n";
        return ss.str();
    }
};