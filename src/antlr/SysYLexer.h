
// Generated from SysYLexer.g4 by ANTLR 4.13.1

#pragma once


#include "antlr4-runtime.h"




class  SysYLexer : public antlr4::Lexer {
public:
  enum {
    CONST = 1, INT = 2, FLOAT = 3, VOID = 4, IF = 5, ELSE = 6, WHILE = 7, 
    FOR = 8, STRUCT = 9, BREAK = 10, CONTINUE = 11, RETURN = 12, IDENT = 13, 
    FloatConst = 14, IntConst = 15, L_PAREN = 16, R_PAREN = 17, L_BRACK = 18, 
    R_BRACK = 19, L_BRACE = 20, R_BRACE = 21, DOT = 22, COMMA = 23, SEMICOLON = 24, 
    PLUS = 25, MINUS = 26, MUL = 27, DIV = 28, MOD = 29, ASSIGN = 30, EQ = 31, 
    NEQ = 32, LT = 33, GT = 34, LE = 35, GE = 36, AND = 37, OR = 38, NOT = 39, 
    BITAND = 40, WS = 41, LINE_COMMENT = 42, BLOCK_COMMENT = 43
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

