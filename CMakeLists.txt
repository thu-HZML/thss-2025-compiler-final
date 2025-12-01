cmake_minimum_required(VERSION 3.10)
project(compiler LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)

# --- 1. 引入 ANTLR4 Runtime (包含构建修复) ---
# 明确关闭 ANTLR4 运行时的内部测试和 Demo，防止 FetchContent 错误
set(ANTLR4_BUILD_TESTS OFF CACHE BOOL "Disable building ANTLR4 runtime tests." FORCE)
set(WITH_DEMO OFF CACHE BOOL "Disable building ANTLR4 demo." FORCE)
add_subdirectory(third_party/antlr4-runtime)

# Headers for include
include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}/third_party/antlr4-runtime/runtime/src
    ${CMAKE_CURRENT_SOURCE_DIR}/src/antlr
)

# --- 2. 定义编译器核心可执行文件 ---
# 收集所有的 .cpp 源文件，包括 src/main.cpp 和 ANTLR 生成的 .cpp
file(GLOB SRC_FILES
    src/*.cpp
    src/antlr/*.cpp
)

add_executable(compiler ${SRC_FILES})

# 链接 ANTLR 运行时库
target_link_libraries(compiler antlr4_shared)

# --- 3. ASAN 配置 (保留原样) ---
option(ENABLE_ASAN "Enable AddressSanitizer" OFF)

if(ENABLE_ASAN)
    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
        add_compile_options(-fsanitize=address -fno-omit-frame-pointer)
        add_link_options(-fsanitize=address)
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        add_compile_options(/fsanitize=address)
    endif()
endif()