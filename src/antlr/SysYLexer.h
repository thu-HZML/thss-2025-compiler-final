
// Generated from SysYLexer.g4 by ANTLR 4.13.1

#pragma once


#include "antlr4-runtime.h"




class  SysYLexer : public antlr4::Lexer {
public:
  enum {
    CONST = 1, INT = 2, VOID = 3, IF = 4, ELSE = 5, WHILE = 6, FOR = 7, 
    BREAK = 8, CONTINUE = 9, RETURN = 10, IDENT = 11, IntConst = 12, L_PAREN = 13, 
    R_PAREN = 14, L_BRACK = 15, R_BRACK = 16, L_BRACE = 17, R_BRACE = 18, 
    COMMA = 19, SEMICOLON = 20, PLUS = 21, MINUS = 22, MUL = 23, DIV = 24, 
    MOD = 25, ASSIGN = 26, EQ = 27, NEQ = 28, LT = 29, GT = 30, LE = 31, 
    GE = 32, AND = 33, OR = 34, NOT = 35, WS = 36, LINE_COMMENT = 37, BLOCK_COMMENT = 38
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

