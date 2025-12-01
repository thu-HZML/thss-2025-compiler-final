
// Generated from SysYLexer.g4 by ANTLR 4.13.1

#pragma once


#include "antlr4-runtime.h"




class  SysYLexer : public antlr4::Lexer {
public:
  enum {
    CONST = 1, INT = 2, VOID = 3, IF = 4, ELSE = 5, WHILE = 6, BREAK = 7, 
    CONTINUE = 8, RETURN = 9, IDENT = 10, IntConst = 11, L_PAREN = 12, R_PAREN = 13, 
    L_BRACK = 14, R_BRACK = 15, L_BRACE = 16, R_BRACE = 17, COMMA = 18, 
    SEMICOLON = 19, PLUS = 20, MINUS = 21, MUL = 22, DIV = 23, MOD = 24, 
    ASSIGN = 25, EQ = 26, NEQ = 27, LT = 28, GT = 29, LE = 30, GE = 31, 
    AND = 32, OR = 33, NOT = 34, WS = 35, LINE_COMMENT = 36, BLOCK_COMMENT = 37
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

