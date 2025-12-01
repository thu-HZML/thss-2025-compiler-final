#pragma once

#include "IR.h"
#include <map>
#include <vector>
#include <string>
#include <algorithm>

// Holds information about a defined symbol (variable, function, etc.)
struct SymbolInfo {
    TypePtr type;
    ValuePtr value; // Pointer to the Value (usually the address/alloca instruction result for variables)
};

class SymbolTable {
private:
    // Vector of symbol maps, simulating nested scopes (from global to current inner)
    std::vector<std::map<std::string, SymbolInfo>> scopes;

public:
    SymbolTable() {
        enterScope(); // Global scope always exists
    }

    void enterScope() {
        scopes.emplace_back(); // Add a new empty map for the new scope
    }

    void exitScope() {
        if (scopes.size() > 1) { 
            scopes.pop_back();
        }
    }

    // Adds a symbol to the current scope.
    bool addSymbol(const std::string& name, TypePtr type, ValuePtr value) {
        if (scopes.empty() || scopes.back().count(name)) return false; 
        
        scopes.back()[name] = {type, value};
        return true;
    }

    // Looks up a symbol, starting from the current inner scope and moving outwards.
    SymbolInfo* lookup(const std::string& name) {
        // Iterate backwards from the innermost scope
        for (auto it = scopes.rbegin(); it != scopes.rend(); ++it) {
            if (it->count(name)) {
                return &it->at(name); // Found
            }
        }
        return nullptr; // Not found
    }
};