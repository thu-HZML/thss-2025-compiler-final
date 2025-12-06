#include <iostream>
#include <fstream>
#include <string>

// ANTLR headers
#include "antlr4-runtime.h"
#include "SysYLexer.h"
#include "SysYParser.h"
// 引入您新增的 IRGenerator
#include "IRGenerator.h" 

using namespace antlr4;

int main(int argc, const char *argv[]) {
  if (argc < 3) {
    std::cerr << "Usage: ./compiler <input-file> <output-file>"
              << std::endl;
    return 1;
  }
  
  // 1. 文件输入设置
  std::string inputFile = argv[1];
  std::string outputFile = argv[2];

  std::ifstream is;
  is.open(inputFile);
  if (!is.is_open()) {
      std::cerr << "Could not open input file " << inputFile << std::endl;
      return 1;
  }

  // 2. ANTLR 前端: Lexer & Parser
  ANTLRInputStream input(is);
  SysYLexer lexer(&input);
  CommonTokenStream tokens(&lexer);
  SysYParser parser(&tokens);
  
  // 3. 开始解析
  SysYParser::CompUnitContext* tree = parser.compUnit();

  // 4. IR 生成（核心翻译部分）
  IRGenerator generator;
  generator.visit(tree); // 遍历解析树并生成 IR

  // 5. 输出 IR 到文件
  std::string irCode = generator.getIR();

  std::ofstream os;
  os.open(outputFile);
  if (!os.is_open()) {
      std::cerr << "Could not open output file " << outputFile << std::endl;
      return 1;
  }
  
  os << irCode;
  os.close();

  // 成功
  return 0;
}