#pragma once

#include "IR.h"
#include <map>
#include <vector>
#include <string>

struct SymbolInfo
{
    TypePtr type;
    ValuePtr value;
    bool isConst;
    int constIntVal;

    // 数组扩展
    bool isArray;
    std::vector<int> dims; // 存储每一维的大小，例如 int a[2][3] -> {2, 3}

    // 指针扩展 (用于函数参数 int a[])
    bool isPointer;
};

struct StructDef
{
    TypePtr type; // The IR Type object
    std::vector<std::string> memberNames;
    std::map<std::string, int> memberIndices;
};

class SymbolTable
{
private:
    std::vector<std::map<std::string, SymbolInfo>> scopes;
    std::vector<std::map<std::string, StructDef>> structScopes;

public:
    SymbolTable() { enterScope(); }

    void enterScope()
    {
        scopes.emplace_back();
        structScopes.emplace_back();
    }

    void exitScope()
    {
        if (scopes.size() > 1)
        {
            scopes.pop_back();
            structScopes.pop_back();
        }
    }

    // 更新接口以支持 dimensions 和 isPointer
    bool addSymbol(const std::string &name, TypePtr type, ValuePtr value, bool isConst = false, int constVal = 0, bool isArray = false, const std::vector<int> &dims = {}, bool isPointer = false)
    {
        if (scopes.empty() || scopes.back().count(name))
            return false;
        scopes.back()[name] = {type, value, isConst, constVal, isArray, dims, isPointer};
        return true;
    }

    bool addStruct(const std::string &name, TypePtr type, const std::vector<std::string> &memberNames)
    {
        if (structScopes.empty() || structScopes.back().count(name))
            return false;

        StructDef def;
        def.type = type;
        def.memberNames = memberNames;
        for (size_t i = 0; i < memberNames.size(); ++i)
        {
            def.memberIndices[memberNames[i]] = i;
        }
        structScopes.back()[name] = def;
        return true;
    }

    SymbolInfo *lookup(const std::string &name)
    {
        for (auto it = scopes.rbegin(); it != scopes.rend(); ++it)
        {
            if (it->count(name))
                return &it->at(name);
        }
        return nullptr;
    }

    StructDef *lookupStruct(const std::string &name)
    {
        for (auto it = structScopes.rbegin(); it != structScopes.rend(); ++it)
        {
            if (it->count(name))
                return &it->at(name);
        }
        return nullptr;
    }
};