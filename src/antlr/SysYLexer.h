
// Generated from SysYLexer.g4 by ANTLR 4.13.1

#pragma once


#include "antlr4-runtime.h"




class  SysYLexer : public antlr4::Lexer {
public:
  enum {
    CONST = 1, INT = 2, FLOAT = 3, VOID = 4, IF = 5, ELSE = 6, WHILE = 7, 
    FOR = 8, STRUCT = 9, BREAK = 10, CONTINUE = 11, RETURN = 12, SWITCH = 13, 
    CASE = 14, DEFAULT = 15, IDENT = 16, FloatConst = 17, IntConst = 18, 
    L_PAREN = 19, R_PAREN = 20, L_BRACK = 21, R_BRACK = 22, L_BRACE = 23, 
    R_BRACE = 24, DOT = 25, COMMA = 26, SEMICOLON = 27, COLON = 28, PLUS = 29, 
    MINUS = 30, MUL = 31, DIV = 32, MOD = 33, ASSIGN = 34, EQ = 35, NEQ = 36, 
    LT = 37, GT = 38, LE = 39, GE = 40, AND = 41, OR = 42, NOT = 43, BITAND = 44, 
    WS = 45, LINE_COMMENT = 46, BLOCK_COMMENT = 47
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

