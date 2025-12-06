#pragma once

#include "IR.h"
#include <map>
#include <vector>
#include <string>

struct SymbolInfo {
    TypePtr type;
    ValuePtr value;   
    bool isConst;     
    int constIntVal;  
    
    // 数组扩展
    bool isArray;
    std::vector<int> dims; // 存储每一维的大小，例如 int a[2][3] -> {2, 3}
};

class SymbolTable {
private:
    std::vector<std::map<std::string, SymbolInfo>> scopes;

public:
    SymbolTable() { enterScope(); }

    void enterScope() { scopes.emplace_back(); }
    
    void exitScope() { 
        if (scopes.size() > 1) scopes.pop_back(); 
    }

    // 更新接口以支持 dimensions
    bool addSymbol(const std::string& name, TypePtr type, ValuePtr value, bool isConst = false, int constVal = 0, bool isArray = false, const std::vector<int>& dims = {}) {
        if (scopes.empty() || scopes.back().count(name)) return false;
        scopes.back()[name] = {type, value, isConst, constVal, isArray, dims};
        return true;
    }

    SymbolInfo* lookup(const std::string& name) {
        for (auto it = scopes.rbegin(); it != scopes.rend(); ++it) {
            if (it->count(name)) return &it->at(name);
        }
        return nullptr;
    }
};