#pragma once

#include <string>
#include <vector>
#include <map>
#include <memory>
#include <sstream>
#include <iostream>

// --- 1. Type System (Minimal) ---
class Type {
public:
    enum TypeID { IntTyID, VoidTyID, PointerTyID };
    std::string irName;

    Type(TypeID id, const std::string& name) : id(id), irName(name) {}
    virtual ~Type() = default;

    static Type* getInt32Ty() {
        static Type intType(IntTyID, "i32");
        return &intType;
    }
    static Type* getVoidTy() {
        static Type voidType(VoidTyID, "void");
        return &voidType;
    }
    const TypeID id;
};

// --- 2. Value (Base Class) ---
class Value {
public:
    Type* type;
    std::string name;

    Value(Type* type, const std::string& name) : type(type), name(name) {}
    virtual ~Value() = default;
    virtual std::string to_string() const { return name; }
};

// Pointers for convenience
using ValuePtr = Value*;
using TypePtr = Type*;

// --- 3. Instruction ---
class Instruction : public Value {
public:
    std::string ir;

    Instruction(Type* type, const std::string& name, const std::string& irCode)
        : Value(type, name), ir(irCode) {}

    // For instructions that produce a result (like alloca, load)
    std::string to_string() const override {
        return name + " = " + ir;
    }
    // For instructions that don't produce a result (like store, ret)
    std::string to_string_void() const {
        return ir;
    }
};

// --- 4. BasicBlock ---
class BasicBlock : public Value {
public:
    std::vector<std::unique_ptr<Instruction>> instList;

    BasicBlock(const std::string& name) : Value(Type::getVoidTy(), name) {}
    void addInstruction(std::unique_ptr<Instruction> inst) {
        instList.push_back(std::move(inst));
    }

    std::string to_string() const override {
        std::stringstream ss;
        ss << name << ":\n";
        for (const auto& inst : instList) {
            ss << "  ";
            if (inst->type->id != Type::VoidTyID && !inst->name.empty()) {
                ss << inst->to_string() << "\n";
            } else {
                ss << inst->to_string_void() << "\n";
            }
        }
        return ss.str();
    }
    const std::vector<std::unique_ptr<Instruction>>& getInstList() const { return instList; }
};

// --- 5. Function ---
class Function : public Value {
public:
    std::string linkage; 
    std::vector<std::unique_ptr<BasicBlock>> blockList;

    Function(Type* retType, const std::string& name)
        : Value(retType, "@" + name), linkage("define") {
        blockList.push_back(std::make_unique<BasicBlock>("mainEntry"));
    }

    std::string to_string() const override {
        std::stringstream ss;
        ss << linkage << " " << type->irName << " " << name << "() {\n";
        for (const auto& block : blockList) {
            ss << block->to_string();
        }
        ss << "}\n";
        return ss.str();
    }
    BasicBlock* getEntryBlock() const { return blockList[0].get(); }
};

// --- 6. Module (Top-Level Container) ---
class Module {
public:
    std::vector<std::unique_ptr<Function>> funcList;

    void addFunction(std::unique_ptr<Function> func) {
        funcList.push_back(std::move(func));
    }

    std::string to_string() const {
        std::stringstream ss;
        ss << "; ModuleID = 'moudle'\n";
        ss << "source_filename = \"moudle\"\n\n";

        for (const auto& func : funcList) {
            ss << func->to_string() << "\n";
        }
        return ss.str();
    }
};