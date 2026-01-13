
// Generated from SysYLexer.g4 by ANTLR 4.13.1

#pragma once


#include "antlr4-runtime.h"




class  SysYLexer : public antlr4::Lexer {
public:
  enum {
    CONST = 1, INT = 2, FLOAT = 3, VOID = 4, IF = 5, ELSE = 6, WHILE = 7, 
    FOR = 8, BREAK = 9, CONTINUE = 10, RETURN = 11, IDENT = 12, FloatConst = 13, 
    IntConst = 14, L_PAREN = 15, R_PAREN = 16, L_BRACK = 17, R_BRACK = 18, 
    L_BRACE = 19, R_BRACE = 20, COMMA = 21, SEMICOLON = 22, PLUS = 23, MINUS = 24, 
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

