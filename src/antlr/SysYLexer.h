
// Generated from SysYLexer.g4 by ANTLR 4.13.1

#pragma once


#include "antlr4-runtime.h"




class  SysYLexer : public antlr4::Lexer {
public:
  enum {
    CONST = 1, INT = 2, VOID = 3, IF = 4, ELSE = 5, WHILE = 6, FOR = 7, 
    STRUCT = 8, BREAK = 9, CONTINUE = 10, RETURN = 11, IDENT = 12, IntConst = 13, 
    L_PAREN = 14, R_PAREN = 15, L_BRACK = 16, R_BRACK = 17, L_BRACE = 18, 
    R_BRACE = 19, DOT = 20, COMMA = 21, SEMICOLON = 22, PLUS = 23, MINUS = 24, 
    MUL = 25, DIV = 26, MOD = 27, ASSIGN = 28, EQ = 29, NEQ = 30, LT = 31, 
    GT = 32, LE = 33, GE = 34, AND = 35, OR = 36, NOT = 37, WS = 38, LINE_COMMENT = 39, 
    BLOCK_COMMENT = 40
  };

  explicit SysYLexer(antlr4::CharStream *input);

  ~SysYLexer() override;


  std::string getGrammarFileName() const override;

  const std::vector<std::string>& getRuleNames() const override;

  const std::vector<std::string>& getChannelNames() const override;

  const std::vector<std::string>& getModeNames() const override;

  const antlr4::dfa::Vocabulary& getVocabulary() const override;

  antlr4::atn::SerializedATNView getSerializedATN() const override;

  const antlr4::atn::ATN& getATN() const override;

  // By default the static state used to implement the lexer is lazily initialized during the first
  // call to the constructor. You can call this function if you wish to initialize the static state
  // ahead of time.
  static void initialize();

private:

  // Individual action functions triggered by action() above.

  // Individual semantic predicate functions triggered by sempred() above.

};

