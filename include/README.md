

# SysY Compiler IR生成模块接口文档

## 1. 模块概览

本模块负责将 SysY 语言的 AST（抽象语法树）转换为中间代码（LLVM IR 风格）。架构主要包含以下部分：

*   **IR Core (`IR.h`)**: 定义了 Module, Function, BasicBlock, Instruction, Value 等核心数据结构。
*   **Symbol Table (`SymbolTable.h`)**: 管理变量作用域、类型信息及常量值。
*   **IR Builder (`IRBuilder.h`)**: 提供简便的 API 来生成各种指令，自动处理寄存器命名。
*   **IR Generator (`IRGenerator.h`)**: 遍历 AST 并调用 Builder 生成代码的访问者类。

---

## 2. 核心数据结构 (IR.h)

`IR.h` 定义了中间代码的内存模型。所有可以被使用的对象（指令、常量、参数）都继承自 `Value`。

### `class Type`
描述变量或值的类型。
*   **静态方法**:
    *   `static Type* getInt32Ty()`: 获取 `i32` 类型单例。
    *   `static Type* getVoidTy()`: 获取 `void` 类型单例。

### `class Value`
所有 IR 对象的基类。
*   **成员**:
    *   `Type* type`: 值的类型。
    *   `std::string name`: 值的名称（如 `%1`, `@global_var`）。
*   **方法**:
    *   `virtual std::string to_string()`: 返回名称，用于打印指令操作数。

### `class Function`
代表一个函数定义。
*   **成员**:
    *   `std::vector<std::unique_ptr<BasicBlock>> blockList`: 包含的基本块列表。
    *   `std::vector<std::string> args`: 参数的寄存器名列表。
*   **方法**:
    *   `BasicBlock* getEntryBlock()`: 获取入口基本块（通常用于插入指令）。

### `class BasicBlock`
代表一个基本块（Basic Block），包含线性执行的指令序列。
*   **方法**:
    *   `void addInstruction(std::unique_ptr<Instruction> inst)`: 向块末尾添加指令。

### `class Module`
顶层容器，代表整个编译单元。
*   **成员**:
    *   `std::vector<std::unique_ptr<Function>> funcList`: 包含的所有函数。
*   **方法**:
    *   `std::string print()`: 输出完整的 IR 代码字符串。

---

## 3. 符号表 (SymbolTable.h)

`SymbolTable.h` 用于在语义分析和代码生成阶段跟踪变量定义。

### `struct SymbolInfo`
存储单个符号的元数据。
```cpp
struct SymbolInfo {
    TypePtr type;           // 变量类型 (主要为 i32)
    ValuePtr value;         // 对应的 IR Value (通常是 AllocaInst 的地址指针)
    bool isConst;           // 是否为常量
    int constIntVal;        // 如果是常量标量，存储其值
    bool isArray;           // 是否为数组
    std::vector<int> dims;  // 数组维度信息 (如 int a[2][3] -> {2, 3})
};
```

### `class SymbolTable`
管理嵌套作用域。
*   **方法**:
    *   `void enterScope()`: 进入新的作用域（如进入函数体或 `{}` 块）。
    *   `void exitScope()`: 退出当前作用域，销毁局部符号。
    *   `bool addSymbol(...)`: 在当前作用域添加符号。
        *   **参数**: 名字, 类型, IR值, 是否常量, 常量值, 是否数组, 维度列表。
        *   **返回**: 成功返回 `true`，重定义返回 `false`。
    *   `SymbolInfo* lookup(const std::string& name)`: 从内层向外层查找符号。

---

## 4. IR 构建器 (IRBuilder.h)

`IRBuilder.h` 是最常调用的工具类，用于生成具体的指令序列，屏蔽了手动创建 `Instruction` 对象的复杂性。

*   **核心状态**:
    *   `BasicBlock* currentBlock`: 当前指令插入的目标块。
    *   `int regCounter`: 虚拟寄存器计数器，自动生成 `%1`, `%2` 等名称。

*   **基础控制**:
    *   `void setInsertPoint(BasicBlock* block)`: 设置当前写入的块。
    *   `std::string nextName()`: 获取下一个未使用的寄存器名。

*   **指令生成 API**:
    *   **内存操作**:
        *   `ValuePtr CreateAlloca(std::string typeStr)`: 在栈上分配内存（如 `alloca i32`）。
        *   `void CreateStore(ValuePtr val, ValuePtr ptr)`: 将值存入地址。
        *   `ValuePtr CreateLoad(ValuePtr ptr)`: 从地址读取值。
    *   **算术运算**:
        *   `ValuePtr CreateBinary(string op, ValuePtr lhs, ValuePtr rhs)`: 生成二元运算（`add`, `sub`, `mul`, `sdiv`, `srem`）。
    *   **比较与转换**:
        *   `ValuePtr CreateICmp(string cond, ...)`: 生成整数比较（`eq`, `ne`, `slt`, `sgt` 等）。
        *   `ValuePtr CreateZExt(ValuePtr val)`: 将 `i1` (bool) 扩展为 `i32`。
    *   **数组访问 (重要)**:
        *   `ValuePtr CreateGEP(ValuePtr ptr, ValuePtr idx, int totalSize)`: 生成 `getelementptr` 指令。
        *   **注意**: 本实现采用了**扁平化数组**策略。无论源码是几维数组，IR 中均视为一维数组 `[Size x i32]`。`idx` 是经过计算后的扁平化偏移量。
    *   **控制流**:
        *   `void CreateRet(ValuePtr val)`: 生成返回指令。

---

## 5. IR 生成器 (IRGenerator.h)

`IRGenerator.h` 是系统的驱动引擎，继承自 `SysYParserBaseVisitor`。

### `class IRGenerator`
*   **用途**: 解析 AST 并自动调用 Builder 和 SymbolTable 生成完整 Module。
*   **核心方法**:
    *   `std::string getIR() const`: 遍历结束后调用此方法，返回完整的 `.ll` 格式 IR 代码字符串。
    *   `visitX(Context* ctx)`: 重载了各类 AST 节点的访问方法（如 `visitFuncDef`, `visitVarDecl`, `visitAssignStmt` 等）。

### 扩展特性说明 (针对数组)
*   **数组定义**: 支持全局和局部数组的初始化。
    *   局部数组：使用 `alloca` 分配，并通过 `GEP` + `Store` 序列进行逐个元素初始化（包括 Padding 的 0）。
    *   全局数组：直接生成 `global [N x i32] [...]` 形式的定义。
*   **数组访问**: 自动处理多维数组的下标计算，将其转换为扁平化的一维偏移量。

---



## 6. 注意事项
1.  **寄存器命名**: 每次调用 `builder.nextName()` 都会自增计数器。如果是手动扩展指令，请务必使用 Builder 提供的 API，不要手动硬编码 `%` 名称。
2.  **基本块管理**: 目前 `Function` 默认创建一个 `entry` 块。如果需要实现 `if/else` 或 `while`，需要手动创建新的 `BasicBlock` 并使用 `builder.setInsertPoint` 切换插入点（这部分逻辑若未实现，需在后续完善控制流图）。
3.  **类型限制**: 当前 Type 系统主要支持 `i32` 和 `void`，以及指向它们的指针。布尔值在 IR 中以 `i1` 存在，但存储时通常扩展为 `i32`。