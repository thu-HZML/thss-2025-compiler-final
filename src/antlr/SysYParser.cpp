
// Generated from SysYParser.g4 by ANTLR 4.13.1


#include "SysYParserVisitor.h"

#include "SysYParser.h"


using namespace antlrcpp;

using namespace antlr4;

namespace {

struct SysYParserStaticData final {
  SysYParserStaticData(std::vector<std::string> ruleNames,
                        std::vector<std::string> literalNames,
                        std::vector<std::string> symbolicNames)
      : ruleNames(std::move(ruleNames)), literalNames(std::move(literalNames)),
        symbolicNames(std::move(symbolicNames)),
        vocabulary(this->literalNames, this->symbolicNames) {}

  SysYParserStaticData(const SysYParserStaticData&) = delete;
  SysYParserStaticData(SysYParserStaticData&&) = delete;
  SysYParserStaticData& operator=(const SysYParserStaticData&) = delete;
  SysYParserStaticData& operator=(SysYParserStaticData&&) = delete;

  std::vector<antlr4::dfa::DFA> decisionToDFA;
  antlr4::atn::PredictionContextCache sharedContextCache;
  const std::vector<std::string> ruleNames;
  const std::vector<std::string> literalNames;
  const std::vector<std::string> symbolicNames;
  const antlr4::dfa::Vocabulary vocabulary;
  antlr4::atn::SerializedATNView serializedATN;
  std::unique_ptr<antlr4::atn::ATN> atn;
};

::antlr4::internal::OnceFlag sysyparserParserOnceFlag;
#if ANTLR4_USE_THREAD_LOCAL_CACHE
static thread_local
#endif
SysYParserStaticData *sysyparserParserStaticData = nullptr;

void sysyparserParserInitialize() {
#if ANTLR4_USE_THREAD_LOCAL_CACHE
  if (sysyparserParserStaticData != nullptr) {
    return;
  }
#else
  assert(sysyparserParserStaticData == nullptr);
#endif
  auto staticData = std::make_unique<SysYParserStaticData>(
    std::vector<std::string>{
      "compUnit", "decl", "structDecl", "structDef", "memberDef", "constDecl", 
      "bType", "constDef", "constInitVal", "varDecl", "varDef", "initVal", 
      "funcDef", "funcType", "funcFParams", "funcFParam", "block", "blockItem", 
      "stmt", "exp", "cond", "lVal", "number", "funcRParams", "constExp"
    },
    std::vector<std::string>{
      "", "'const'", "'int'", "'void'", "'if'", "'else'", "'while'", "'for'", 
      "'struct'", "'break'", "'continue'", "'return'", "", "", "'('", "')'", 
      "'['", "']'", "'{'", "'}'", "'.'", "','", "';'", "'+'", "'-'", "'*'", 
      "'/'", "'%'", "'='", "'=='", "'!='", "'<'", "'>'", "'<='", "'>='", 
      "'&&'", "'||'", "'!'"
    },
    std::vector<std::string>{
      "", "CONST", "INT", "VOID", "IF", "ELSE", "WHILE", "FOR", "STRUCT", 
      "BREAK", "CONTINUE", "RETURN", "IDENT", "IntConst", "L_PAREN", "R_PAREN", 
      "L_BRACK", "R_BRACK", "L_BRACE", "R_BRACE", "DOT", "COMMA", "SEMICOLON", 
      "PLUS", "MINUS", "MUL", "DIV", "MOD", "ASSIGN", "EQ", "NEQ", "LT", 
      "GT", "LE", "GE", "AND", "OR", "NOT", "WS", "LINE_COMMENT", "BLOCK_COMMENT"
    }
  );
  static const int32_t serializedATNSegment[] = {
  	4,1,40,357,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,
  	7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,14,7,
  	14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,7,20,2,21,7,
  	21,2,22,7,22,2,23,7,23,2,24,7,24,1,0,1,0,1,0,5,0,54,8,0,10,0,12,0,57,
  	9,0,1,0,1,0,1,1,1,1,1,1,3,1,64,8,1,1,2,1,2,1,3,1,3,1,3,1,3,5,3,72,8,3,
  	10,3,12,3,75,9,3,1,3,1,3,1,3,1,4,1,4,1,4,1,4,1,4,1,4,5,4,86,8,4,10,4,
  	12,4,89,9,4,1,4,1,4,1,5,1,5,1,5,1,5,1,5,5,5,98,8,5,10,5,12,5,101,9,5,
  	1,5,1,5,1,6,1,6,1,6,3,6,108,8,6,1,7,1,7,1,7,1,7,1,7,5,7,115,8,7,10,7,
  	12,7,118,9,7,1,7,1,7,1,7,1,8,1,8,1,8,1,8,1,8,5,8,128,8,8,10,8,12,8,131,
  	9,8,3,8,133,8,8,1,8,3,8,136,8,8,1,9,1,9,1,9,1,9,5,9,142,8,9,10,9,12,9,
  	145,9,9,1,9,1,9,1,10,1,10,1,10,1,10,1,10,5,10,154,8,10,10,10,12,10,157,
  	9,10,1,10,1,10,1,10,1,10,1,10,5,10,164,8,10,10,10,12,10,167,9,10,1,10,
  	1,10,3,10,171,8,10,1,11,1,11,1,11,1,11,1,11,5,11,178,8,11,10,11,12,11,
  	181,9,11,3,11,183,8,11,1,11,3,11,186,8,11,1,12,1,12,1,12,1,12,3,12,192,
  	8,12,1,12,1,12,1,12,1,13,1,13,1,14,1,14,1,14,5,14,202,8,14,10,14,12,14,
  	205,9,14,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,5,15,215,8,15,10,15,
  	12,15,218,9,15,3,15,220,8,15,1,16,1,16,5,16,224,8,16,10,16,12,16,227,
  	9,16,1,16,1,16,1,17,1,17,3,17,233,8,17,1,18,1,18,1,18,1,18,1,18,1,18,
  	3,18,241,8,18,1,18,1,18,1,18,1,18,1,18,1,18,1,18,1,18,1,18,3,18,252,8,
  	18,1,18,1,18,1,18,1,18,1,18,1,18,1,18,1,18,1,18,1,18,3,18,264,8,18,1,
  	18,3,18,267,8,18,1,18,1,18,1,18,1,18,1,18,1,18,3,18,275,8,18,1,18,1,18,
  	1,18,1,18,1,18,1,18,1,18,1,18,1,18,3,18,286,8,18,1,18,3,18,289,8,18,1,
  	19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,3,19,301,8,19,1,19,1,
  	19,1,19,3,19,306,8,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,
  	19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,1,19,5,19,326,8,19,10,19,12,19,
  	329,9,19,1,20,1,20,1,21,1,21,1,21,1,21,1,21,1,21,1,21,5,21,340,8,21,10,
  	21,12,21,343,9,21,1,22,1,22,1,23,1,23,1,23,5,23,350,8,23,10,23,12,23,
  	353,9,23,1,24,1,24,1,24,0,1,38,25,0,2,4,6,8,10,12,14,16,18,20,22,24,26,
  	28,30,32,34,36,38,40,42,44,46,48,0,6,1,0,2,3,2,0,23,24,37,37,1,0,25,27,
  	1,0,23,24,1,0,31,34,1,0,29,30,386,0,55,1,0,0,0,2,63,1,0,0,0,4,65,1,0,
  	0,0,6,67,1,0,0,0,8,79,1,0,0,0,10,92,1,0,0,0,12,107,1,0,0,0,14,109,1,0,
  	0,0,16,135,1,0,0,0,18,137,1,0,0,0,20,170,1,0,0,0,22,185,1,0,0,0,24,187,
  	1,0,0,0,26,196,1,0,0,0,28,198,1,0,0,0,30,206,1,0,0,0,32,221,1,0,0,0,34,
  	232,1,0,0,0,36,288,1,0,0,0,38,305,1,0,0,0,40,330,1,0,0,0,42,332,1,0,0,
  	0,44,344,1,0,0,0,46,346,1,0,0,0,48,354,1,0,0,0,50,54,3,2,1,0,51,54,3,
  	24,12,0,52,54,3,6,3,0,53,50,1,0,0,0,53,51,1,0,0,0,53,52,1,0,0,0,54,57,
  	1,0,0,0,55,53,1,0,0,0,55,56,1,0,0,0,56,58,1,0,0,0,57,55,1,0,0,0,58,59,
  	5,0,0,1,59,1,1,0,0,0,60,64,3,10,5,0,61,64,3,18,9,0,62,64,3,4,2,0,63,60,
  	1,0,0,0,63,61,1,0,0,0,63,62,1,0,0,0,64,3,1,0,0,0,65,66,3,6,3,0,66,5,1,
  	0,0,0,67,68,5,8,0,0,68,69,5,12,0,0,69,73,5,18,0,0,70,72,3,8,4,0,71,70,
  	1,0,0,0,72,75,1,0,0,0,73,71,1,0,0,0,73,74,1,0,0,0,74,76,1,0,0,0,75,73,
  	1,0,0,0,76,77,5,19,0,0,77,78,5,22,0,0,78,7,1,0,0,0,79,80,3,12,6,0,80,
  	87,5,12,0,0,81,82,5,16,0,0,82,83,3,48,24,0,83,84,5,17,0,0,84,86,1,0,0,
  	0,85,81,1,0,0,0,86,89,1,0,0,0,87,85,1,0,0,0,87,88,1,0,0,0,88,90,1,0,0,
  	0,89,87,1,0,0,0,90,91,5,22,0,0,91,9,1,0,0,0,92,93,5,1,0,0,93,94,3,12,
  	6,0,94,99,3,14,7,0,95,96,5,21,0,0,96,98,3,14,7,0,97,95,1,0,0,0,98,101,
  	1,0,0,0,99,97,1,0,0,0,99,100,1,0,0,0,100,102,1,0,0,0,101,99,1,0,0,0,102,
  	103,5,22,0,0,103,11,1,0,0,0,104,108,5,2,0,0,105,106,5,8,0,0,106,108,5,
  	12,0,0,107,104,1,0,0,0,107,105,1,0,0,0,108,13,1,0,0,0,109,116,5,12,0,
  	0,110,111,5,16,0,0,111,112,3,48,24,0,112,113,5,17,0,0,113,115,1,0,0,0,
  	114,110,1,0,0,0,115,118,1,0,0,0,116,114,1,0,0,0,116,117,1,0,0,0,117,119,
  	1,0,0,0,118,116,1,0,0,0,119,120,5,28,0,0,120,121,3,16,8,0,121,15,1,0,
  	0,0,122,136,3,48,24,0,123,132,5,18,0,0,124,129,3,16,8,0,125,126,5,21,
  	0,0,126,128,3,16,8,0,127,125,1,0,0,0,128,131,1,0,0,0,129,127,1,0,0,0,
  	129,130,1,0,0,0,130,133,1,0,0,0,131,129,1,0,0,0,132,124,1,0,0,0,132,133,
  	1,0,0,0,133,134,1,0,0,0,134,136,5,19,0,0,135,122,1,0,0,0,135,123,1,0,
  	0,0,136,17,1,0,0,0,137,138,3,12,6,0,138,143,3,20,10,0,139,140,5,21,0,
  	0,140,142,3,20,10,0,141,139,1,0,0,0,142,145,1,0,0,0,143,141,1,0,0,0,143,
  	144,1,0,0,0,144,146,1,0,0,0,145,143,1,0,0,0,146,147,5,22,0,0,147,19,1,
  	0,0,0,148,155,5,12,0,0,149,150,5,16,0,0,150,151,3,48,24,0,151,152,5,17,
  	0,0,152,154,1,0,0,0,153,149,1,0,0,0,154,157,1,0,0,0,155,153,1,0,0,0,155,
  	156,1,0,0,0,156,171,1,0,0,0,157,155,1,0,0,0,158,165,5,12,0,0,159,160,
  	5,16,0,0,160,161,3,48,24,0,161,162,5,17,0,0,162,164,1,0,0,0,163,159,1,
  	0,0,0,164,167,1,0,0,0,165,163,1,0,0,0,165,166,1,0,0,0,166,168,1,0,0,0,
  	167,165,1,0,0,0,168,169,5,28,0,0,169,171,3,22,11,0,170,148,1,0,0,0,170,
  	158,1,0,0,0,171,21,1,0,0,0,172,186,3,38,19,0,173,182,5,18,0,0,174,179,
  	3,22,11,0,175,176,5,21,0,0,176,178,3,22,11,0,177,175,1,0,0,0,178,181,
  	1,0,0,0,179,177,1,0,0,0,179,180,1,0,0,0,180,183,1,0,0,0,181,179,1,0,0,
  	0,182,174,1,0,0,0,182,183,1,0,0,0,183,184,1,0,0,0,184,186,5,19,0,0,185,
  	172,1,0,0,0,185,173,1,0,0,0,186,23,1,0,0,0,187,188,3,26,13,0,188,189,
  	5,12,0,0,189,191,5,14,0,0,190,192,3,28,14,0,191,190,1,0,0,0,191,192,1,
  	0,0,0,192,193,1,0,0,0,193,194,5,15,0,0,194,195,3,32,16,0,195,25,1,0,0,
  	0,196,197,7,0,0,0,197,27,1,0,0,0,198,203,3,30,15,0,199,200,5,21,0,0,200,
  	202,3,30,15,0,201,199,1,0,0,0,202,205,1,0,0,0,203,201,1,0,0,0,203,204,
  	1,0,0,0,204,29,1,0,0,0,205,203,1,0,0,0,206,207,3,12,6,0,207,219,5,12,
  	0,0,208,209,5,16,0,0,209,216,5,17,0,0,210,211,5,16,0,0,211,212,3,38,19,
  	0,212,213,5,17,0,0,213,215,1,0,0,0,214,210,1,0,0,0,215,218,1,0,0,0,216,
  	214,1,0,0,0,216,217,1,0,0,0,217,220,1,0,0,0,218,216,1,0,0,0,219,208,1,
  	0,0,0,219,220,1,0,0,0,220,31,1,0,0,0,221,225,5,18,0,0,222,224,3,34,17,
  	0,223,222,1,0,0,0,224,227,1,0,0,0,225,223,1,0,0,0,225,226,1,0,0,0,226,
  	228,1,0,0,0,227,225,1,0,0,0,228,229,5,19,0,0,229,33,1,0,0,0,230,233,3,
  	2,1,0,231,233,3,36,18,0,232,230,1,0,0,0,232,231,1,0,0,0,233,35,1,0,0,
  	0,234,235,3,42,21,0,235,236,5,28,0,0,236,237,3,38,19,0,237,238,5,22,0,
  	0,238,289,1,0,0,0,239,241,3,38,19,0,240,239,1,0,0,0,240,241,1,0,0,0,241,
  	242,1,0,0,0,242,289,5,22,0,0,243,289,3,32,16,0,244,245,5,4,0,0,245,246,
  	5,14,0,0,246,247,3,40,20,0,247,248,5,15,0,0,248,251,3,36,18,0,249,250,
  	5,5,0,0,250,252,3,36,18,0,251,249,1,0,0,0,251,252,1,0,0,0,252,289,1,0,
  	0,0,253,254,5,6,0,0,254,255,5,14,0,0,255,256,3,40,20,0,256,257,5,15,0,
  	0,257,258,3,36,18,0,258,289,1,0,0,0,259,260,5,7,0,0,260,263,5,14,0,0,
  	261,264,3,2,1,0,262,264,3,36,18,0,263,261,1,0,0,0,263,262,1,0,0,0,264,
  	266,1,0,0,0,265,267,3,38,19,0,266,265,1,0,0,0,266,267,1,0,0,0,267,268,
  	1,0,0,0,268,274,5,22,0,0,269,270,3,42,21,0,270,271,5,28,0,0,271,272,3,
  	38,19,0,272,275,1,0,0,0,273,275,3,38,19,0,274,269,1,0,0,0,274,273,1,0,
  	0,0,274,275,1,0,0,0,275,276,1,0,0,0,276,277,5,15,0,0,277,278,3,36,18,
  	0,278,289,1,0,0,0,279,280,5,9,0,0,280,289,5,22,0,0,281,282,5,10,0,0,282,
  	289,5,22,0,0,283,285,5,11,0,0,284,286,3,38,19,0,285,284,1,0,0,0,285,286,
  	1,0,0,0,286,287,1,0,0,0,287,289,5,22,0,0,288,234,1,0,0,0,288,240,1,0,
  	0,0,288,243,1,0,0,0,288,244,1,0,0,0,288,253,1,0,0,0,288,259,1,0,0,0,288,
  	279,1,0,0,0,288,281,1,0,0,0,288,283,1,0,0,0,289,37,1,0,0,0,290,291,6,
  	19,-1,0,291,306,3,42,21,0,292,293,5,14,0,0,293,294,3,38,19,0,294,295,
  	5,15,0,0,295,306,1,0,0,0,296,306,3,44,22,0,297,298,5,12,0,0,298,300,5,
  	14,0,0,299,301,3,46,23,0,300,299,1,0,0,0,300,301,1,0,0,0,301,302,1,0,
  	0,0,302,306,5,15,0,0,303,304,7,1,0,0,304,306,3,38,19,7,305,290,1,0,0,
  	0,305,292,1,0,0,0,305,296,1,0,0,0,305,297,1,0,0,0,305,303,1,0,0,0,306,
  	327,1,0,0,0,307,308,10,6,0,0,308,309,7,2,0,0,309,326,3,38,19,7,310,311,
  	10,5,0,0,311,312,7,3,0,0,312,326,3,38,19,6,313,314,10,4,0,0,314,315,7,
  	4,0,0,315,326,3,38,19,5,316,317,10,3,0,0,317,318,7,5,0,0,318,326,3,38,
  	19,4,319,320,10,2,0,0,320,321,5,35,0,0,321,326,3,38,19,3,322,323,10,1,
  	0,0,323,324,5,36,0,0,324,326,3,38,19,2,325,307,1,0,0,0,325,310,1,0,0,
  	0,325,313,1,0,0,0,325,316,1,0,0,0,325,319,1,0,0,0,325,322,1,0,0,0,326,
  	329,1,0,0,0,327,325,1,0,0,0,327,328,1,0,0,0,328,39,1,0,0,0,329,327,1,
  	0,0,0,330,331,3,38,19,0,331,41,1,0,0,0,332,341,5,12,0,0,333,334,5,16,
  	0,0,334,335,3,38,19,0,335,336,5,17,0,0,336,340,1,0,0,0,337,338,5,20,0,
  	0,338,340,5,12,0,0,339,333,1,0,0,0,339,337,1,0,0,0,340,343,1,0,0,0,341,
  	339,1,0,0,0,341,342,1,0,0,0,342,43,1,0,0,0,343,341,1,0,0,0,344,345,5,
  	13,0,0,345,45,1,0,0,0,346,351,3,38,19,0,347,348,5,21,0,0,348,350,3,38,
  	19,0,349,347,1,0,0,0,350,353,1,0,0,0,351,349,1,0,0,0,351,352,1,0,0,0,
  	352,47,1,0,0,0,353,351,1,0,0,0,354,355,3,38,19,0,355,49,1,0,0,0,38,53,
  	55,63,73,87,99,107,116,129,132,135,143,155,165,170,179,182,185,191,203,
  	216,219,225,232,240,251,263,266,274,285,288,300,305,325,327,339,341,351
  };
  staticData->serializedATN = antlr4::atn::SerializedATNView(serializedATNSegment, sizeof(serializedATNSegment) / sizeof(serializedATNSegment[0]));

  antlr4::atn::ATNDeserializer deserializer;
  staticData->atn = deserializer.deserialize(staticData->serializedATN);

  const size_t count = staticData->atn->getNumberOfDecisions();
  staticData->decisionToDFA.reserve(count);
  for (size_t i = 0; i < count; i++) { 
    staticData->decisionToDFA.emplace_back(staticData->atn->getDecisionState(i), i);
  }
  sysyparserParserStaticData = staticData.release();
}

}

SysYParser::SysYParser(TokenStream *input) : SysYParser(input, antlr4::atn::ParserATNSimulatorOptions()) {}

SysYParser::SysYParser(TokenStream *input, const antlr4::atn::ParserATNSimulatorOptions &options) : Parser(input) {
  SysYParser::initialize();
  _interpreter = new atn::ParserATNSimulator(this, *sysyparserParserStaticData->atn, sysyparserParserStaticData->decisionToDFA, sysyparserParserStaticData->sharedContextCache, options);
}

SysYParser::~SysYParser() {
  delete _interpreter;
}

const atn::ATN& SysYParser::getATN() const {
  return *sysyparserParserStaticData->atn;
}

std::string SysYParser::getGrammarFileName() const {
  return "SysYParser.g4";
}

const std::vector<std::string>& SysYParser::getRuleNames() const {
  return sysyparserParserStaticData->ruleNames;
}

const dfa::Vocabulary& SysYParser::getVocabulary() const {
  return sysyparserParserStaticData->vocabulary;
}

antlr4::atn::SerializedATNView SysYParser::getSerializedATN() const {
  return sysyparserParserStaticData->serializedATN;
}


//----------------- CompUnitContext ------------------------------------------------------------------

SysYParser::CompUnitContext::CompUnitContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* SysYParser::CompUnitContext::EOF() {
  return getToken(SysYParser::EOF, 0);
}

std::vector<SysYParser::DeclContext *> SysYParser::CompUnitContext::decl() {
  return getRuleContexts<SysYParser::DeclContext>();
}

SysYParser::DeclContext* SysYParser::CompUnitContext::decl(size_t i) {
  return getRuleContext<SysYParser::DeclContext>(i);
}

std::vector<SysYParser::FuncDefContext *> SysYParser::CompUnitContext::funcDef() {
  return getRuleContexts<SysYParser::FuncDefContext>();
}

SysYParser::FuncDefContext* SysYParser::CompUnitContext::funcDef(size_t i) {
  return getRuleContext<SysYParser::FuncDefContext>(i);
}

std::vector<SysYParser::StructDefContext *> SysYParser::CompUnitContext::structDef() {
  return getRuleContexts<SysYParser::StructDefContext>();
}

SysYParser::StructDefContext* SysYParser::CompUnitContext::structDef(size_t i) {
  return getRuleContext<SysYParser::StructDefContext>(i);
}


size_t SysYParser::CompUnitContext::getRuleIndex() const {
  return SysYParser::RuleCompUnit;
}


std::any SysYParser::CompUnitContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitCompUnit(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::CompUnitContext* SysYParser::compUnit() {
  CompUnitContext *_localctx = _tracker.createInstance<CompUnitContext>(_ctx, getState());
  enterRule(_localctx, 0, SysYParser::RuleCompUnit);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(55);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while ((((_la & ~ 0x3fULL) == 0) &&
      ((1ULL << _la) & 270) != 0)) {
      setState(53);
      _errHandler->sync(this);
      switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 0, _ctx)) {
      case 1: {
        setState(50);
        decl();
        break;
      }

      case 2: {
        setState(51);
        funcDef();
        break;
      }

      case 3: {
        setState(52);
        structDef();
        break;
      }

      default:
        break;
      }
      setState(57);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(58);
    match(SysYParser::EOF);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- DeclContext ------------------------------------------------------------------

SysYParser::DeclContext::DeclContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

SysYParser::ConstDeclContext* SysYParser::DeclContext::constDecl() {
  return getRuleContext<SysYParser::ConstDeclContext>(0);
}

SysYParser::VarDeclContext* SysYParser::DeclContext::varDecl() {
  return getRuleContext<SysYParser::VarDeclContext>(0);
}

SysYParser::StructDeclContext* SysYParser::DeclContext::structDecl() {
  return getRuleContext<SysYParser::StructDeclContext>(0);
}


size_t SysYParser::DeclContext::getRuleIndex() const {
  return SysYParser::RuleDecl;
}


std::any SysYParser::DeclContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitDecl(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::DeclContext* SysYParser::decl() {
  DeclContext *_localctx = _tracker.createInstance<DeclContext>(_ctx, getState());
  enterRule(_localctx, 2, SysYParser::RuleDecl);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(63);
    _errHandler->sync(this);
    switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 2, _ctx)) {
    case 1: {
      enterOuterAlt(_localctx, 1);
      setState(60);
      constDecl();
      break;
    }

    case 2: {
      enterOuterAlt(_localctx, 2);
      setState(61);
      varDecl();
      break;
    }

    case 3: {
      enterOuterAlt(_localctx, 3);
      setState(62);
      structDecl();
      break;
    }

    default:
      break;
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- StructDeclContext ------------------------------------------------------------------

SysYParser::StructDeclContext::StructDeclContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

SysYParser::StructDefContext* SysYParser::StructDeclContext::structDef() {
  return getRuleContext<SysYParser::StructDefContext>(0);
}


size_t SysYParser::StructDeclContext::getRuleIndex() const {
  return SysYParser::RuleStructDecl;
}


std::any SysYParser::StructDeclContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitStructDecl(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::StructDeclContext* SysYParser::structDecl() {
  StructDeclContext *_localctx = _tracker.createInstance<StructDeclContext>(_ctx, getState());
  enterRule(_localctx, 4, SysYParser::RuleStructDecl);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(65);
    structDef();
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- StructDefContext ------------------------------------------------------------------

SysYParser::StructDefContext::StructDefContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* SysYParser::StructDefContext::STRUCT() {
  return getToken(SysYParser::STRUCT, 0);
}

tree::TerminalNode* SysYParser::StructDefContext::IDENT() {
  return getToken(SysYParser::IDENT, 0);
}

tree::TerminalNode* SysYParser::StructDefContext::L_BRACE() {
  return getToken(SysYParser::L_BRACE, 0);
}

tree::TerminalNode* SysYParser::StructDefContext::R_BRACE() {
  return getToken(SysYParser::R_BRACE, 0);
}

tree::TerminalNode* SysYParser::StructDefContext::SEMICOLON() {
  return getToken(SysYParser::SEMICOLON, 0);
}

std::vector<SysYParser::MemberDefContext *> SysYParser::StructDefContext::memberDef() {
  return getRuleContexts<SysYParser::MemberDefContext>();
}

SysYParser::MemberDefContext* SysYParser::StructDefContext::memberDef(size_t i) {
  return getRuleContext<SysYParser::MemberDefContext>(i);
}


size_t SysYParser::StructDefContext::getRuleIndex() const {
  return SysYParser::RuleStructDef;
}


std::any SysYParser::StructDefContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitStructDef(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::StructDefContext* SysYParser::structDef() {
  StructDefContext *_localctx = _tracker.createInstance<StructDefContext>(_ctx, getState());
  enterRule(_localctx, 6, SysYParser::RuleStructDef);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(67);
    match(SysYParser::STRUCT);
    setState(68);
    match(SysYParser::IDENT);
    setState(69);
    match(SysYParser::L_BRACE);
    setState(73);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == SysYParser::INT

    || _la == SysYParser::STRUCT) {
      setState(70);
      memberDef();
      setState(75);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(76);
    match(SysYParser::R_BRACE);
    setState(77);
    match(SysYParser::SEMICOLON);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- MemberDefContext ------------------------------------------------------------------

SysYParser::MemberDefContext::MemberDefContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

SysYParser::BTypeContext* SysYParser::MemberDefContext::bType() {
  return getRuleContext<SysYParser::BTypeContext>(0);
}

tree::TerminalNode* SysYParser::MemberDefContext::IDENT() {
  return getToken(SysYParser::IDENT, 0);
}

tree::TerminalNode* SysYParser::MemberDefContext::SEMICOLON() {
  return getToken(SysYParser::SEMICOLON, 0);
}

std::vector<tree::TerminalNode *> SysYParser::MemberDefContext::L_BRACK() {
  return getTokens(SysYParser::L_BRACK);
}

tree::TerminalNode* SysYParser::MemberDefContext::L_BRACK(size_t i) {
  return getToken(SysYParser::L_BRACK, i);
}

std::vector<SysYParser::ConstExpContext *> SysYParser::MemberDefContext::constExp() {
  return getRuleContexts<SysYParser::ConstExpContext>();
}

SysYParser::ConstExpContext* SysYParser::MemberDefContext::constExp(size_t i) {
  return getRuleContext<SysYParser::ConstExpContext>(i);
}

std::vector<tree::TerminalNode *> SysYParser::MemberDefContext::R_BRACK() {
  return getTokens(SysYParser::R_BRACK);
}

tree::TerminalNode* SysYParser::MemberDefContext::R_BRACK(size_t i) {
  return getToken(SysYParser::R_BRACK, i);
}


size_t SysYParser::MemberDefContext::getRuleIndex() const {
  return SysYParser::RuleMemberDef;
}


std::any SysYParser::MemberDefContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitMemberDef(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::MemberDefContext* SysYParser::memberDef() {
  MemberDefContext *_localctx = _tracker.createInstance<MemberDefContext>(_ctx, getState());
  enterRule(_localctx, 8, SysYParser::RuleMemberDef);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(79);
    bType();
    setState(80);
    match(SysYParser::IDENT);
    setState(87);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == SysYParser::L_BRACK) {
      setState(81);
      match(SysYParser::L_BRACK);
      setState(82);
      constExp();
      setState(83);
      match(SysYParser::R_BRACK);
      setState(89);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(90);
    match(SysYParser::SEMICOLON);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- ConstDeclContext ------------------------------------------------------------------

SysYParser::ConstDeclContext::ConstDeclContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* SysYParser::ConstDeclContext::CONST() {
  return getToken(SysYParser::CONST, 0);
}

SysYParser::BTypeContext* SysYParser::ConstDeclContext::bType() {
  return getRuleContext<SysYParser::BTypeContext>(0);
}

std::vector<SysYParser::ConstDefContext *> SysYParser::ConstDeclContext::constDef() {
  return getRuleContexts<SysYParser::ConstDefContext>();
}

SysYParser::ConstDefContext* SysYParser::ConstDeclContext::constDef(size_t i) {
  return getRuleContext<SysYParser::ConstDefContext>(i);
}

tree::TerminalNode* SysYParser::ConstDeclContext::SEMICOLON() {
  return getToken(SysYParser::SEMICOLON, 0);
}

std::vector<tree::TerminalNode *> SysYParser::ConstDeclContext::COMMA() {
  return getTokens(SysYParser::COMMA);
}

tree::TerminalNode* SysYParser::ConstDeclContext::COMMA(size_t i) {
  return getToken(SysYParser::COMMA, i);
}


size_t SysYParser::ConstDeclContext::getRuleIndex() const {
  return SysYParser::RuleConstDecl;
}


std::any SysYParser::ConstDeclContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitConstDecl(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::ConstDeclContext* SysYParser::constDecl() {
  ConstDeclContext *_localctx = _tracker.createInstance<ConstDeclContext>(_ctx, getState());
  enterRule(_localctx, 10, SysYParser::RuleConstDecl);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(92);
    match(SysYParser::CONST);
    setState(93);
    bType();
    setState(94);
    constDef();
    setState(99);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == SysYParser::COMMA) {
      setState(95);
      match(SysYParser::COMMA);
      setState(96);
      constDef();
      setState(101);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(102);
    match(SysYParser::SEMICOLON);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- BTypeContext ------------------------------------------------------------------

SysYParser::BTypeContext::BTypeContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* SysYParser::BTypeContext::INT() {
  return getToken(SysYParser::INT, 0);
}

tree::TerminalNode* SysYParser::BTypeContext::STRUCT() {
  return getToken(SysYParser::STRUCT, 0);
}

tree::TerminalNode* SysYParser::BTypeContext::IDENT() {
  return getToken(SysYParser::IDENT, 0);
}


size_t SysYParser::BTypeContext::getRuleIndex() const {
  return SysYParser::RuleBType;
}


std::any SysYParser::BTypeContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitBType(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::BTypeContext* SysYParser::bType() {
  BTypeContext *_localctx = _tracker.createInstance<BTypeContext>(_ctx, getState());
  enterRule(_localctx, 12, SysYParser::RuleBType);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(107);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case SysYParser::INT: {
        enterOuterAlt(_localctx, 1);
        setState(104);
        match(SysYParser::INT);
        break;
      }

      case SysYParser::STRUCT: {
        enterOuterAlt(_localctx, 2);
        setState(105);
        match(SysYParser::STRUCT);
        setState(106);
        match(SysYParser::IDENT);
        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- ConstDefContext ------------------------------------------------------------------

SysYParser::ConstDefContext::ConstDefContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* SysYParser::ConstDefContext::IDENT() {
  return getToken(SysYParser::IDENT, 0);
}

tree::TerminalNode* SysYParser::ConstDefContext::ASSIGN() {
  return getToken(SysYParser::ASSIGN, 0);
}

SysYParser::ConstInitValContext* SysYParser::ConstDefContext::constInitVal() {
  return getRuleContext<SysYParser::ConstInitValContext>(0);
}

std::vector<tree::TerminalNode *> SysYParser::ConstDefContext::L_BRACK() {
  return getTokens(SysYParser::L_BRACK);
}

tree::TerminalNode* SysYParser::ConstDefContext::L_BRACK(size_t i) {
  return getToken(SysYParser::L_BRACK, i);
}

std::vector<SysYParser::ConstExpContext *> SysYParser::ConstDefContext::constExp() {
  return getRuleContexts<SysYParser::ConstExpContext>();
}

SysYParser::ConstExpContext* SysYParser::ConstDefContext::constExp(size_t i) {
  return getRuleContext<SysYParser::ConstExpContext>(i);
}

std::vector<tree::TerminalNode *> SysYParser::ConstDefContext::R_BRACK() {
  return getTokens(SysYParser::R_BRACK);
}

tree::TerminalNode* SysYParser::ConstDefContext::R_BRACK(size_t i) {
  return getToken(SysYParser::R_BRACK, i);
}


size_t SysYParser::ConstDefContext::getRuleIndex() const {
  return SysYParser::RuleConstDef;
}


std::any SysYParser::ConstDefContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitConstDef(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::ConstDefContext* SysYParser::constDef() {
  ConstDefContext *_localctx = _tracker.createInstance<ConstDefContext>(_ctx, getState());
  enterRule(_localctx, 14, SysYParser::RuleConstDef);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(109);
    match(SysYParser::IDENT);
    setState(116);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == SysYParser::L_BRACK) {
      setState(110);
      match(SysYParser::L_BRACK);
      setState(111);
      constExp();
      setState(112);
      match(SysYParser::R_BRACK);
      setState(118);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(119);
    match(SysYParser::ASSIGN);
    setState(120);
    constInitVal();
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- ConstInitValContext ------------------------------------------------------------------

SysYParser::ConstInitValContext::ConstInitValContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

SysYParser::ConstExpContext* SysYParser::ConstInitValContext::constExp() {
  return getRuleContext<SysYParser::ConstExpContext>(0);
}

tree::TerminalNode* SysYParser::ConstInitValContext::L_BRACE() {
  return getToken(SysYParser::L_BRACE, 0);
}

tree::TerminalNode* SysYParser::ConstInitValContext::R_BRACE() {
  return getToken(SysYParser::R_BRACE, 0);
}

std::vector<SysYParser::ConstInitValContext *> SysYParser::ConstInitValContext::constInitVal() {
  return getRuleContexts<SysYParser::ConstInitValContext>();
}

SysYParser::ConstInitValContext* SysYParser::ConstInitValContext::constInitVal(size_t i) {
  return getRuleContext<SysYParser::ConstInitValContext>(i);
}

std::vector<tree::TerminalNode *> SysYParser::ConstInitValContext::COMMA() {
  return getTokens(SysYParser::COMMA);
}

tree::TerminalNode* SysYParser::ConstInitValContext::COMMA(size_t i) {
  return getToken(SysYParser::COMMA, i);
}


size_t SysYParser::ConstInitValContext::getRuleIndex() const {
  return SysYParser::RuleConstInitVal;
}


std::any SysYParser::ConstInitValContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitConstInitVal(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::ConstInitValContext* SysYParser::constInitVal() {
  ConstInitValContext *_localctx = _tracker.createInstance<ConstInitValContext>(_ctx, getState());
  enterRule(_localctx, 16, SysYParser::RuleConstInitVal);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(135);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case SysYParser::IDENT:
      case SysYParser::IntConst:
      case SysYParser::L_PAREN:
      case SysYParser::PLUS:
      case SysYParser::MINUS:
      case SysYParser::NOT: {
        enterOuterAlt(_localctx, 1);
        setState(122);
        constExp();
        break;
      }

      case SysYParser::L_BRACE: {
        enterOuterAlt(_localctx, 2);
        setState(123);
        match(SysYParser::L_BRACE);
        setState(132);
        _errHandler->sync(this);

        _la = _input->LA(1);
        if ((((_la & ~ 0x3fULL) == 0) &&
          ((1ULL << _la) & 137464410112) != 0)) {
          setState(124);
          constInitVal();
          setState(129);
          _errHandler->sync(this);
          _la = _input->LA(1);
          while (_la == SysYParser::COMMA) {
            setState(125);
            match(SysYParser::COMMA);
            setState(126);
            constInitVal();
            setState(131);
            _errHandler->sync(this);
            _la = _input->LA(1);
          }
        }
        setState(134);
        match(SysYParser::R_BRACE);
        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- VarDeclContext ------------------------------------------------------------------

SysYParser::VarDeclContext::VarDeclContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

SysYParser::BTypeContext* SysYParser::VarDeclContext::bType() {
  return getRuleContext<SysYParser::BTypeContext>(0);
}

std::vector<SysYParser::VarDefContext *> SysYParser::VarDeclContext::varDef() {
  return getRuleContexts<SysYParser::VarDefContext>();
}

SysYParser::VarDefContext* SysYParser::VarDeclContext::varDef(size_t i) {
  return getRuleContext<SysYParser::VarDefContext>(i);
}

tree::TerminalNode* SysYParser::VarDeclContext::SEMICOLON() {
  return getToken(SysYParser::SEMICOLON, 0);
}

std::vector<tree::TerminalNode *> SysYParser::VarDeclContext::COMMA() {
  return getTokens(SysYParser::COMMA);
}

tree::TerminalNode* SysYParser::VarDeclContext::COMMA(size_t i) {
  return getToken(SysYParser::COMMA, i);
}


size_t SysYParser::VarDeclContext::getRuleIndex() const {
  return SysYParser::RuleVarDecl;
}


std::any SysYParser::VarDeclContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitVarDecl(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::VarDeclContext* SysYParser::varDecl() {
  VarDeclContext *_localctx = _tracker.createInstance<VarDeclContext>(_ctx, getState());
  enterRule(_localctx, 18, SysYParser::RuleVarDecl);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(137);
    bType();
    setState(138);
    varDef();
    setState(143);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == SysYParser::COMMA) {
      setState(139);
      match(SysYParser::COMMA);
      setState(140);
      varDef();
      setState(145);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(146);
    match(SysYParser::SEMICOLON);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- VarDefContext ------------------------------------------------------------------

SysYParser::VarDefContext::VarDefContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* SysYParser::VarDefContext::IDENT() {
  return getToken(SysYParser::IDENT, 0);
}

std::vector<tree::TerminalNode *> SysYParser::VarDefContext::L_BRACK() {
  return getTokens(SysYParser::L_BRACK);
}

tree::TerminalNode* SysYParser::VarDefContext::L_BRACK(size_t i) {
  return getToken(SysYParser::L_BRACK, i);
}

std::vector<SysYParser::ConstExpContext *> SysYParser::VarDefContext::constExp() {
  return getRuleContexts<SysYParser::ConstExpContext>();
}

SysYParser::ConstExpContext* SysYParser::VarDefContext::constExp(size_t i) {
  return getRuleContext<SysYParser::ConstExpContext>(i);
}

std::vector<tree::TerminalNode *> SysYParser::VarDefContext::R_BRACK() {
  return getTokens(SysYParser::R_BRACK);
}

tree::TerminalNode* SysYParser::VarDefContext::R_BRACK(size_t i) {
  return getToken(SysYParser::R_BRACK, i);
}

tree::TerminalNode* SysYParser::VarDefContext::ASSIGN() {
  return getToken(SysYParser::ASSIGN, 0);
}

SysYParser::InitValContext* SysYParser::VarDefContext::initVal() {
  return getRuleContext<SysYParser::InitValContext>(0);
}


size_t SysYParser::VarDefContext::getRuleIndex() const {
  return SysYParser::RuleVarDef;
}


std::any SysYParser::VarDefContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitVarDef(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::VarDefContext* SysYParser::varDef() {
  VarDefContext *_localctx = _tracker.createInstance<VarDefContext>(_ctx, getState());
  enterRule(_localctx, 20, SysYParser::RuleVarDef);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(170);
    _errHandler->sync(this);
    switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 14, _ctx)) {
    case 1: {
      enterOuterAlt(_localctx, 1);
      setState(148);
      match(SysYParser::IDENT);
      setState(155);
      _errHandler->sync(this);
      _la = _input->LA(1);
      while (_la == SysYParser::L_BRACK) {
        setState(149);
        match(SysYParser::L_BRACK);
        setState(150);
        constExp();
        setState(151);
        match(SysYParser::R_BRACK);
        setState(157);
        _errHandler->sync(this);
        _la = _input->LA(1);
      }
      break;
    }

    case 2: {
      enterOuterAlt(_localctx, 2);
      setState(158);
      match(SysYParser::IDENT);
      setState(165);
      _errHandler->sync(this);
      _la = _input->LA(1);
      while (_la == SysYParser::L_BRACK) {
        setState(159);
        match(SysYParser::L_BRACK);
        setState(160);
        constExp();
        setState(161);
        match(SysYParser::R_BRACK);
        setState(167);
        _errHandler->sync(this);
        _la = _input->LA(1);
      }
      setState(168);
      match(SysYParser::ASSIGN);
      setState(169);
      initVal();
      break;
    }

    default:
      break;
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- InitValContext ------------------------------------------------------------------

SysYParser::InitValContext::InitValContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

SysYParser::ExpContext* SysYParser::InitValContext::exp() {
  return getRuleContext<SysYParser::ExpContext>(0);
}

tree::TerminalNode* SysYParser::InitValContext::L_BRACE() {
  return getToken(SysYParser::L_BRACE, 0);
}

tree::TerminalNode* SysYParser::InitValContext::R_BRACE() {
  return getToken(SysYParser::R_BRACE, 0);
}

std::vector<SysYParser::InitValContext *> SysYParser::InitValContext::initVal() {
  return getRuleContexts<SysYParser::InitValContext>();
}

SysYParser::InitValContext* SysYParser::InitValContext::initVal(size_t i) {
  return getRuleContext<SysYParser::InitValContext>(i);
}

std::vector<tree::TerminalNode *> SysYParser::InitValContext::COMMA() {
  return getTokens(SysYParser::COMMA);
}

tree::TerminalNode* SysYParser::InitValContext::COMMA(size_t i) {
  return getToken(SysYParser::COMMA, i);
}


size_t SysYParser::InitValContext::getRuleIndex() const {
  return SysYParser::RuleInitVal;
}


std::any SysYParser::InitValContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitInitVal(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::InitValContext* SysYParser::initVal() {
  InitValContext *_localctx = _tracker.createInstance<InitValContext>(_ctx, getState());
  enterRule(_localctx, 22, SysYParser::RuleInitVal);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(185);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case SysYParser::IDENT:
      case SysYParser::IntConst:
      case SysYParser::L_PAREN:
      case SysYParser::PLUS:
      case SysYParser::MINUS:
      case SysYParser::NOT: {
        enterOuterAlt(_localctx, 1);
        setState(172);
        exp(0);
        break;
      }

      case SysYParser::L_BRACE: {
        enterOuterAlt(_localctx, 2);
        setState(173);
        match(SysYParser::L_BRACE);
        setState(182);
        _errHandler->sync(this);

        _la = _input->LA(1);
        if ((((_la & ~ 0x3fULL) == 0) &&
          ((1ULL << _la) & 137464410112) != 0)) {
          setState(174);
          initVal();
          setState(179);
          _errHandler->sync(this);
          _la = _input->LA(1);
          while (_la == SysYParser::COMMA) {
            setState(175);
            match(SysYParser::COMMA);
            setState(176);
            initVal();
            setState(181);
            _errHandler->sync(this);
            _la = _input->LA(1);
          }
        }
        setState(184);
        match(SysYParser::R_BRACE);
        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- FuncDefContext ------------------------------------------------------------------

SysYParser::FuncDefContext::FuncDefContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

SysYParser::FuncTypeContext* SysYParser::FuncDefContext::funcType() {
  return getRuleContext<SysYParser::FuncTypeContext>(0);
}

tree::TerminalNode* SysYParser::FuncDefContext::IDENT() {
  return getToken(SysYParser::IDENT, 0);
}

tree::TerminalNode* SysYParser::FuncDefContext::L_PAREN() {
  return getToken(SysYParser::L_PAREN, 0);
}

tree::TerminalNode* SysYParser::FuncDefContext::R_PAREN() {
  return getToken(SysYParser::R_PAREN, 0);
}

SysYParser::BlockContext* SysYParser::FuncDefContext::block() {
  return getRuleContext<SysYParser::BlockContext>(0);
}

SysYParser::FuncFParamsContext* SysYParser::FuncDefContext::funcFParams() {
  return getRuleContext<SysYParser::FuncFParamsContext>(0);
}


size_t SysYParser::FuncDefContext::getRuleIndex() const {
  return SysYParser::RuleFuncDef;
}


std::any SysYParser::FuncDefContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitFuncDef(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::FuncDefContext* SysYParser::funcDef() {
  FuncDefContext *_localctx = _tracker.createInstance<FuncDefContext>(_ctx, getState());
  enterRule(_localctx, 24, SysYParser::RuleFuncDef);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(187);
    funcType();
    setState(188);
    match(SysYParser::IDENT);
    setState(189);
    match(SysYParser::L_PAREN);
    setState(191);
    _errHandler->sync(this);

    _la = _input->LA(1);
    if (_la == SysYParser::INT

    || _la == SysYParser::STRUCT) {
      setState(190);
      funcFParams();
    }
    setState(193);
    match(SysYParser::R_PAREN);
    setState(194);
    block();
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- FuncTypeContext ------------------------------------------------------------------

SysYParser::FuncTypeContext::FuncTypeContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* SysYParser::FuncTypeContext::VOID() {
  return getToken(SysYParser::VOID, 0);
}

tree::TerminalNode* SysYParser::FuncTypeContext::INT() {
  return getToken(SysYParser::INT, 0);
}


size_t SysYParser::FuncTypeContext::getRuleIndex() const {
  return SysYParser::RuleFuncType;
}


std::any SysYParser::FuncTypeContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitFuncType(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::FuncTypeContext* SysYParser::funcType() {
  FuncTypeContext *_localctx = _tracker.createInstance<FuncTypeContext>(_ctx, getState());
  enterRule(_localctx, 26, SysYParser::RuleFuncType);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(196);
    _la = _input->LA(1);
    if (!(_la == SysYParser::INT

    || _la == SysYParser::VOID)) {
    _errHandler->recoverInline(this);
    }
    else {
      _errHandler->reportMatch(this);
      consume();
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- FuncFParamsContext ------------------------------------------------------------------

SysYParser::FuncFParamsContext::FuncFParamsContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

std::vector<SysYParser::FuncFParamContext *> SysYParser::FuncFParamsContext::funcFParam() {
  return getRuleContexts<SysYParser::FuncFParamContext>();
}

SysYParser::FuncFParamContext* SysYParser::FuncFParamsContext::funcFParam(size_t i) {
  return getRuleContext<SysYParser::FuncFParamContext>(i);
}

std::vector<tree::TerminalNode *> SysYParser::FuncFParamsContext::COMMA() {
  return getTokens(SysYParser::COMMA);
}

tree::TerminalNode* SysYParser::FuncFParamsContext::COMMA(size_t i) {
  return getToken(SysYParser::COMMA, i);
}


size_t SysYParser::FuncFParamsContext::getRuleIndex() const {
  return SysYParser::RuleFuncFParams;
}


std::any SysYParser::FuncFParamsContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitFuncFParams(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::FuncFParamsContext* SysYParser::funcFParams() {
  FuncFParamsContext *_localctx = _tracker.createInstance<FuncFParamsContext>(_ctx, getState());
  enterRule(_localctx, 28, SysYParser::RuleFuncFParams);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(198);
    funcFParam();
    setState(203);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == SysYParser::COMMA) {
      setState(199);
      match(SysYParser::COMMA);
      setState(200);
      funcFParam();
      setState(205);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- FuncFParamContext ------------------------------------------------------------------

SysYParser::FuncFParamContext::FuncFParamContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

SysYParser::BTypeContext* SysYParser::FuncFParamContext::bType() {
  return getRuleContext<SysYParser::BTypeContext>(0);
}

tree::TerminalNode* SysYParser::FuncFParamContext::IDENT() {
  return getToken(SysYParser::IDENT, 0);
}

std::vector<tree::TerminalNode *> SysYParser::FuncFParamContext::L_BRACK() {
  return getTokens(SysYParser::L_BRACK);
}

tree::TerminalNode* SysYParser::FuncFParamContext::L_BRACK(size_t i) {
  return getToken(SysYParser::L_BRACK, i);
}

std::vector<tree::TerminalNode *> SysYParser::FuncFParamContext::R_BRACK() {
  return getTokens(SysYParser::R_BRACK);
}

tree::TerminalNode* SysYParser::FuncFParamContext::R_BRACK(size_t i) {
  return getToken(SysYParser::R_BRACK, i);
}

std::vector<SysYParser::ExpContext *> SysYParser::FuncFParamContext::exp() {
  return getRuleContexts<SysYParser::ExpContext>();
}

SysYParser::ExpContext* SysYParser::FuncFParamContext::exp(size_t i) {
  return getRuleContext<SysYParser::ExpContext>(i);
}


size_t SysYParser::FuncFParamContext::getRuleIndex() const {
  return SysYParser::RuleFuncFParam;
}


std::any SysYParser::FuncFParamContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitFuncFParam(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::FuncFParamContext* SysYParser::funcFParam() {
  FuncFParamContext *_localctx = _tracker.createInstance<FuncFParamContext>(_ctx, getState());
  enterRule(_localctx, 30, SysYParser::RuleFuncFParam);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(206);
    bType();
    setState(207);
    match(SysYParser::IDENT);
    setState(219);
    _errHandler->sync(this);

    _la = _input->LA(1);
    if (_la == SysYParser::L_BRACK) {
      setState(208);
      match(SysYParser::L_BRACK);
      setState(209);
      match(SysYParser::R_BRACK);
      setState(216);
      _errHandler->sync(this);
      _la = _input->LA(1);
      while (_la == SysYParser::L_BRACK) {
        setState(210);
        match(SysYParser::L_BRACK);
        setState(211);
        exp(0);
        setState(212);
        match(SysYParser::R_BRACK);
        setState(218);
        _errHandler->sync(this);
        _la = _input->LA(1);
      }
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- BlockContext ------------------------------------------------------------------

SysYParser::BlockContext::BlockContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* SysYParser::BlockContext::L_BRACE() {
  return getToken(SysYParser::L_BRACE, 0);
}

tree::TerminalNode* SysYParser::BlockContext::R_BRACE() {
  return getToken(SysYParser::R_BRACE, 0);
}

std::vector<SysYParser::BlockItemContext *> SysYParser::BlockContext::blockItem() {
  return getRuleContexts<SysYParser::BlockItemContext>();
}

SysYParser::BlockItemContext* SysYParser::BlockContext::blockItem(size_t i) {
  return getRuleContext<SysYParser::BlockItemContext>(i);
}


size_t SysYParser::BlockContext::getRuleIndex() const {
  return SysYParser::RuleBlock;
}


std::any SysYParser::BlockContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitBlock(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::BlockContext* SysYParser::block() {
  BlockContext *_localctx = _tracker.createInstance<BlockContext>(_ctx, getState());
  enterRule(_localctx, 32, SysYParser::RuleBlock);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(221);
    match(SysYParser::L_BRACE);
    setState(225);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while ((((_la & ~ 0x3fULL) == 0) &&
      ((1ULL << _la) & 137468608470) != 0)) {
      setState(222);
      blockItem();
      setState(227);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(228);
    match(SysYParser::R_BRACE);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- BlockItemContext ------------------------------------------------------------------

SysYParser::BlockItemContext::BlockItemContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

SysYParser::DeclContext* SysYParser::BlockItemContext::decl() {
  return getRuleContext<SysYParser::DeclContext>(0);
}

SysYParser::StmtContext* SysYParser::BlockItemContext::stmt() {
  return getRuleContext<SysYParser::StmtContext>(0);
}


size_t SysYParser::BlockItemContext::getRuleIndex() const {
  return SysYParser::RuleBlockItem;
}


std::any SysYParser::BlockItemContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitBlockItem(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::BlockItemContext* SysYParser::blockItem() {
  BlockItemContext *_localctx = _tracker.createInstance<BlockItemContext>(_ctx, getState());
  enterRule(_localctx, 34, SysYParser::RuleBlockItem);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(232);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case SysYParser::CONST:
      case SysYParser::INT:
      case SysYParser::STRUCT: {
        enterOuterAlt(_localctx, 1);
        setState(230);
        decl();
        break;
      }

      case SysYParser::IF:
      case SysYParser::WHILE:
      case SysYParser::FOR:
      case SysYParser::BREAK:
      case SysYParser::CONTINUE:
      case SysYParser::RETURN:
      case SysYParser::IDENT:
      case SysYParser::IntConst:
      case SysYParser::L_PAREN:
      case SysYParser::L_BRACE:
      case SysYParser::SEMICOLON:
      case SysYParser::PLUS:
      case SysYParser::MINUS:
      case SysYParser::NOT: {
        enterOuterAlt(_localctx, 2);
        setState(231);
        stmt();
        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- StmtContext ------------------------------------------------------------------

SysYParser::StmtContext::StmtContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t SysYParser::StmtContext::getRuleIndex() const {
  return SysYParser::RuleStmt;
}

void SysYParser::StmtContext::copyFrom(StmtContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- ForStmtContext ------------------------------------------------------------------

tree::TerminalNode* SysYParser::ForStmtContext::FOR() {
  return getToken(SysYParser::FOR, 0);
}

tree::TerminalNode* SysYParser::ForStmtContext::L_PAREN() {
  return getToken(SysYParser::L_PAREN, 0);
}

tree::TerminalNode* SysYParser::ForStmtContext::SEMICOLON() {
  return getToken(SysYParser::SEMICOLON, 0);
}

tree::TerminalNode* SysYParser::ForStmtContext::R_PAREN() {
  return getToken(SysYParser::R_PAREN, 0);
}

std::vector<SysYParser::StmtContext *> SysYParser::ForStmtContext::stmt() {
  return getRuleContexts<SysYParser::StmtContext>();
}

SysYParser::StmtContext* SysYParser::ForStmtContext::stmt(size_t i) {
  return getRuleContext<SysYParser::StmtContext>(i);
}

SysYParser::DeclContext* SysYParser::ForStmtContext::decl() {
  return getRuleContext<SysYParser::DeclContext>(0);
}

tree::TerminalNode* SysYParser::ForStmtContext::ASSIGN() {
  return getToken(SysYParser::ASSIGN, 0);
}

std::vector<SysYParser::ExpContext *> SysYParser::ForStmtContext::exp() {
  return getRuleContexts<SysYParser::ExpContext>();
}

SysYParser::ExpContext* SysYParser::ForStmtContext::exp(size_t i) {
  return getRuleContext<SysYParser::ExpContext>(i);
}

SysYParser::LValContext* SysYParser::ForStmtContext::lVal() {
  return getRuleContext<SysYParser::LValContext>(0);
}

SysYParser::ForStmtContext::ForStmtContext(StmtContext *ctx) { copyFrom(ctx); }


std::any SysYParser::ForStmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitForStmt(this);
  else
    return visitor->visitChildren(this);
}
//----------------- WhileStmtContext ------------------------------------------------------------------

tree::TerminalNode* SysYParser::WhileStmtContext::WHILE() {
  return getToken(SysYParser::WHILE, 0);
}

tree::TerminalNode* SysYParser::WhileStmtContext::L_PAREN() {
  return getToken(SysYParser::L_PAREN, 0);
}

SysYParser::CondContext* SysYParser::WhileStmtContext::cond() {
  return getRuleContext<SysYParser::CondContext>(0);
}

tree::TerminalNode* SysYParser::WhileStmtContext::R_PAREN() {
  return getToken(SysYParser::R_PAREN, 0);
}

SysYParser::StmtContext* SysYParser::WhileStmtContext::stmt() {
  return getRuleContext<SysYParser::StmtContext>(0);
}

SysYParser::WhileStmtContext::WhileStmtContext(StmtContext *ctx) { copyFrom(ctx); }


std::any SysYParser::WhileStmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitWhileStmt(this);
  else
    return visitor->visitChildren(this);
}
//----------------- IfStmtContext ------------------------------------------------------------------

tree::TerminalNode* SysYParser::IfStmtContext::IF() {
  return getToken(SysYParser::IF, 0);
}

tree::TerminalNode* SysYParser::IfStmtContext::L_PAREN() {
  return getToken(SysYParser::L_PAREN, 0);
}

SysYParser::CondContext* SysYParser::IfStmtContext::cond() {
  return getRuleContext<SysYParser::CondContext>(0);
}

tree::TerminalNode* SysYParser::IfStmtContext::R_PAREN() {
  return getToken(SysYParser::R_PAREN, 0);
}

std::vector<SysYParser::StmtContext *> SysYParser::IfStmtContext::stmt() {
  return getRuleContexts<SysYParser::StmtContext>();
}

SysYParser::StmtContext* SysYParser::IfStmtContext::stmt(size_t i) {
  return getRuleContext<SysYParser::StmtContext>(i);
}

tree::TerminalNode* SysYParser::IfStmtContext::ELSE() {
  return getToken(SysYParser::ELSE, 0);
}

SysYParser::IfStmtContext::IfStmtContext(StmtContext *ctx) { copyFrom(ctx); }


std::any SysYParser::IfStmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitIfStmt(this);
  else
    return visitor->visitChildren(this);
}
//----------------- BlockStmtContext ------------------------------------------------------------------

SysYParser::BlockContext* SysYParser::BlockStmtContext::block() {
  return getRuleContext<SysYParser::BlockContext>(0);
}

SysYParser::BlockStmtContext::BlockStmtContext(StmtContext *ctx) { copyFrom(ctx); }


std::any SysYParser::BlockStmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitBlockStmt(this);
  else
    return visitor->visitChildren(this);
}
//----------------- AssignStmtContext ------------------------------------------------------------------

SysYParser::LValContext* SysYParser::AssignStmtContext::lVal() {
  return getRuleContext<SysYParser::LValContext>(0);
}

tree::TerminalNode* SysYParser::AssignStmtContext::ASSIGN() {
  return getToken(SysYParser::ASSIGN, 0);
}

SysYParser::ExpContext* SysYParser::AssignStmtContext::exp() {
  return getRuleContext<SysYParser::ExpContext>(0);
}

tree::TerminalNode* SysYParser::AssignStmtContext::SEMICOLON() {
  return getToken(SysYParser::SEMICOLON, 0);
}

SysYParser::AssignStmtContext::AssignStmtContext(StmtContext *ctx) { copyFrom(ctx); }


std::any SysYParser::AssignStmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitAssignStmt(this);
  else
    return visitor->visitChildren(this);
}
//----------------- BreakStmtContext ------------------------------------------------------------------

tree::TerminalNode* SysYParser::BreakStmtContext::BREAK() {
  return getToken(SysYParser::BREAK, 0);
}

tree::TerminalNode* SysYParser::BreakStmtContext::SEMICOLON() {
  return getToken(SysYParser::SEMICOLON, 0);
}

SysYParser::BreakStmtContext::BreakStmtContext(StmtContext *ctx) { copyFrom(ctx); }


std::any SysYParser::BreakStmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitBreakStmt(this);
  else
    return visitor->visitChildren(this);
}
//----------------- ExpStmtContext ------------------------------------------------------------------

tree::TerminalNode* SysYParser::ExpStmtContext::SEMICOLON() {
  return getToken(SysYParser::SEMICOLON, 0);
}

SysYParser::ExpContext* SysYParser::ExpStmtContext::exp() {
  return getRuleContext<SysYParser::ExpContext>(0);
}

SysYParser::ExpStmtContext::ExpStmtContext(StmtContext *ctx) { copyFrom(ctx); }


std::any SysYParser::ExpStmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitExpStmt(this);
  else
    return visitor->visitChildren(this);
}
//----------------- ReturnStmtContext ------------------------------------------------------------------

tree::TerminalNode* SysYParser::ReturnStmtContext::RETURN() {
  return getToken(SysYParser::RETURN, 0);
}

tree::TerminalNode* SysYParser::ReturnStmtContext::SEMICOLON() {
  return getToken(SysYParser::SEMICOLON, 0);
}

SysYParser::ExpContext* SysYParser::ReturnStmtContext::exp() {
  return getRuleContext<SysYParser::ExpContext>(0);
}

SysYParser::ReturnStmtContext::ReturnStmtContext(StmtContext *ctx) { copyFrom(ctx); }


std::any SysYParser::ReturnStmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitReturnStmt(this);
  else
    return visitor->visitChildren(this);
}
//----------------- ContinueStmtContext ------------------------------------------------------------------

tree::TerminalNode* SysYParser::ContinueStmtContext::CONTINUE() {
  return getToken(SysYParser::CONTINUE, 0);
}

tree::TerminalNode* SysYParser::ContinueStmtContext::SEMICOLON() {
  return getToken(SysYParser::SEMICOLON, 0);
}

SysYParser::ContinueStmtContext::ContinueStmtContext(StmtContext *ctx) { copyFrom(ctx); }


std::any SysYParser::ContinueStmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitContinueStmt(this);
  else
    return visitor->visitChildren(this);
}
SysYParser::StmtContext* SysYParser::stmt() {
  StmtContext *_localctx = _tracker.createInstance<StmtContext>(_ctx, getState());
  enterRule(_localctx, 36, SysYParser::RuleStmt);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(288);
    _errHandler->sync(this);
    switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 30, _ctx)) {
    case 1: {
      _localctx = _tracker.createInstance<SysYParser::AssignStmtContext>(_localctx);
      enterOuterAlt(_localctx, 1);
      setState(234);
      lVal();
      setState(235);
      match(SysYParser::ASSIGN);
      setState(236);
      exp(0);
      setState(237);
      match(SysYParser::SEMICOLON);
      break;
    }

    case 2: {
      _localctx = _tracker.createInstance<SysYParser::ExpStmtContext>(_localctx);
      enterOuterAlt(_localctx, 2);
      setState(240);
      _errHandler->sync(this);

      _la = _input->LA(1);
      if ((((_la & ~ 0x3fULL) == 0) &&
        ((1ULL << _la) & 137464147968) != 0)) {
        setState(239);
        exp(0);
      }
      setState(242);
      match(SysYParser::SEMICOLON);
      break;
    }

    case 3: {
      _localctx = _tracker.createInstance<SysYParser::BlockStmtContext>(_localctx);
      enterOuterAlt(_localctx, 3);
      setState(243);
      block();
      break;
    }

    case 4: {
      _localctx = _tracker.createInstance<SysYParser::IfStmtContext>(_localctx);
      enterOuterAlt(_localctx, 4);
      setState(244);
      match(SysYParser::IF);
      setState(245);
      match(SysYParser::L_PAREN);
      setState(246);
      cond();
      setState(247);
      match(SysYParser::R_PAREN);
      setState(248);
      stmt();
      setState(251);
      _errHandler->sync(this);

      switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 25, _ctx)) {
      case 1: {
        setState(249);
        match(SysYParser::ELSE);
        setState(250);
        stmt();
        break;
      }

      default:
        break;
      }
      break;
    }

    case 5: {
      _localctx = _tracker.createInstance<SysYParser::WhileStmtContext>(_localctx);
      enterOuterAlt(_localctx, 5);
      setState(253);
      match(SysYParser::WHILE);
      setState(254);
      match(SysYParser::L_PAREN);
      setState(255);
      cond();
      setState(256);
      match(SysYParser::R_PAREN);
      setState(257);
      stmt();
      break;
    }

    case 6: {
      _localctx = _tracker.createInstance<SysYParser::ForStmtContext>(_localctx);
      enterOuterAlt(_localctx, 6);
      setState(259);
      match(SysYParser::FOR);
      setState(260);
      match(SysYParser::L_PAREN);
      setState(263);
      _errHandler->sync(this);
      switch (_input->LA(1)) {
        case SysYParser::CONST:
        case SysYParser::INT:
        case SysYParser::STRUCT: {
          setState(261);
          antlrcpp::downCast<ForStmtContext *>(_localctx)->initDecl = decl();
          break;
        }

        case SysYParser::IF:
        case SysYParser::WHILE:
        case SysYParser::FOR:
        case SysYParser::BREAK:
        case SysYParser::CONTINUE:
        case SysYParser::RETURN:
        case SysYParser::IDENT:
        case SysYParser::IntConst:
        case SysYParser::L_PAREN:
        case SysYParser::L_BRACE:
        case SysYParser::SEMICOLON:
        case SysYParser::PLUS:
        case SysYParser::MINUS:
        case SysYParser::NOT: {
          setState(262);
          antlrcpp::downCast<ForStmtContext *>(_localctx)->initStmt = stmt();
          break;
        }

      default:
        throw NoViableAltException(this);
      }
      setState(266);
      _errHandler->sync(this);

      _la = _input->LA(1);
      if ((((_la & ~ 0x3fULL) == 0) &&
        ((1ULL << _la) & 137464147968) != 0)) {
        setState(265);
        antlrcpp::downCast<ForStmtContext *>(_localctx)->condition = exp(0);
      }
      setState(268);
      match(SysYParser::SEMICOLON);
      setState(274);
      _errHandler->sync(this);

      switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 28, _ctx)) {
      case 1: {
        setState(269);
        antlrcpp::downCast<ForStmtContext *>(_localctx)->stepLVal = lVal();
        setState(270);
        match(SysYParser::ASSIGN);
        setState(271);
        antlrcpp::downCast<ForStmtContext *>(_localctx)->stepRVal = exp(0);
        break;
      }

      case 2: {
        setState(273);
        antlrcpp::downCast<ForStmtContext *>(_localctx)->stepExp = exp(0);
        break;
      }

      default:
        break;
      }
      setState(276);
      match(SysYParser::R_PAREN);
      setState(277);
      antlrcpp::downCast<ForStmtContext *>(_localctx)->body = stmt();
      break;
    }

    case 7: {
      _localctx = _tracker.createInstance<SysYParser::BreakStmtContext>(_localctx);
      enterOuterAlt(_localctx, 7);
      setState(279);
      match(SysYParser::BREAK);
      setState(280);
      match(SysYParser::SEMICOLON);
      break;
    }

    case 8: {
      _localctx = _tracker.createInstance<SysYParser::ContinueStmtContext>(_localctx);
      enterOuterAlt(_localctx, 8);
      setState(281);
      match(SysYParser::CONTINUE);
      setState(282);
      match(SysYParser::SEMICOLON);
      break;
    }

    case 9: {
      _localctx = _tracker.createInstance<SysYParser::ReturnStmtContext>(_localctx);
      enterOuterAlt(_localctx, 9);
      setState(283);
      match(SysYParser::RETURN);
      setState(285);
      _errHandler->sync(this);

      _la = _input->LA(1);
      if ((((_la & ~ 0x3fULL) == 0) &&
        ((1ULL << _la) & 137464147968) != 0)) {
        setState(284);
        exp(0);
      }
      setState(287);
      match(SysYParser::SEMICOLON);
      break;
    }

    default:
      break;
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- ExpContext ------------------------------------------------------------------

SysYParser::ExpContext::ExpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t SysYParser::ExpContext::getRuleIndex() const {
  return SysYParser::RuleExp;
}

void SysYParser::ExpContext::copyFrom(ExpContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- LandExpContext ------------------------------------------------------------------

std::vector<SysYParser::ExpContext *> SysYParser::LandExpContext::exp() {
  return getRuleContexts<SysYParser::ExpContext>();
}

SysYParser::ExpContext* SysYParser::LandExpContext::exp(size_t i) {
  return getRuleContext<SysYParser::ExpContext>(i);
}

tree::TerminalNode* SysYParser::LandExpContext::AND() {
  return getToken(SysYParser::AND, 0);
}

SysYParser::LandExpContext::LandExpContext(ExpContext *ctx) { copyFrom(ctx); }


std::any SysYParser::LandExpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitLandExp(this);
  else
    return visitor->visitChildren(this);
}
//----------------- LValExpContext ------------------------------------------------------------------

SysYParser::LValContext* SysYParser::LValExpContext::lVal() {
  return getRuleContext<SysYParser::LValContext>(0);
}

SysYParser::LValExpContext::LValExpContext(ExpContext *ctx) { copyFrom(ctx); }


std::any SysYParser::LValExpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitLValExp(this);
  else
    return visitor->visitChildren(this);
}
//----------------- LorExpContext ------------------------------------------------------------------

std::vector<SysYParser::ExpContext *> SysYParser::LorExpContext::exp() {
  return getRuleContexts<SysYParser::ExpContext>();
}

SysYParser::ExpContext* SysYParser::LorExpContext::exp(size_t i) {
  return getRuleContext<SysYParser::ExpContext>(i);
}

tree::TerminalNode* SysYParser::LorExpContext::OR() {
  return getToken(SysYParser::OR, 0);
}

SysYParser::LorExpContext::LorExpContext(ExpContext *ctx) { copyFrom(ctx); }


std::any SysYParser::LorExpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitLorExp(this);
  else
    return visitor->visitChildren(this);
}
//----------------- NumberExpContext ------------------------------------------------------------------

SysYParser::NumberContext* SysYParser::NumberExpContext::number() {
  return getRuleContext<SysYParser::NumberContext>(0);
}

SysYParser::NumberExpContext::NumberExpContext(ExpContext *ctx) { copyFrom(ctx); }


std::any SysYParser::NumberExpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitNumberExp(this);
  else
    return visitor->visitChildren(this);
}
//----------------- MulDivModExpContext ------------------------------------------------------------------

std::vector<SysYParser::ExpContext *> SysYParser::MulDivModExpContext::exp() {
  return getRuleContexts<SysYParser::ExpContext>();
}

SysYParser::ExpContext* SysYParser::MulDivModExpContext::exp(size_t i) {
  return getRuleContext<SysYParser::ExpContext>(i);
}

tree::TerminalNode* SysYParser::MulDivModExpContext::MUL() {
  return getToken(SysYParser::MUL, 0);
}

tree::TerminalNode* SysYParser::MulDivModExpContext::DIV() {
  return getToken(SysYParser::DIV, 0);
}

tree::TerminalNode* SysYParser::MulDivModExpContext::MOD() {
  return getToken(SysYParser::MOD, 0);
}

SysYParser::MulDivModExpContext::MulDivModExpContext(ExpContext *ctx) { copyFrom(ctx); }


std::any SysYParser::MulDivModExpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitMulDivModExp(this);
  else
    return visitor->visitChildren(this);
}
//----------------- UnaryExpContext ------------------------------------------------------------------

SysYParser::ExpContext* SysYParser::UnaryExpContext::exp() {
  return getRuleContext<SysYParser::ExpContext>(0);
}

tree::TerminalNode* SysYParser::UnaryExpContext::PLUS() {
  return getToken(SysYParser::PLUS, 0);
}

tree::TerminalNode* SysYParser::UnaryExpContext::MINUS() {
  return getToken(SysYParser::MINUS, 0);
}

tree::TerminalNode* SysYParser::UnaryExpContext::NOT() {
  return getToken(SysYParser::NOT, 0);
}

SysYParser::UnaryExpContext::UnaryExpContext(ExpContext *ctx) { copyFrom(ctx); }


std::any SysYParser::UnaryExpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitUnaryExp(this);
  else
    return visitor->visitChildren(this);
}
//----------------- ParenExpContext ------------------------------------------------------------------

tree::TerminalNode* SysYParser::ParenExpContext::L_PAREN() {
  return getToken(SysYParser::L_PAREN, 0);
}

SysYParser::ExpContext* SysYParser::ParenExpContext::exp() {
  return getRuleContext<SysYParser::ExpContext>(0);
}

tree::TerminalNode* SysYParser::ParenExpContext::R_PAREN() {
  return getToken(SysYParser::R_PAREN, 0);
}

SysYParser::ParenExpContext::ParenExpContext(ExpContext *ctx) { copyFrom(ctx); }


std::any SysYParser::ParenExpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitParenExp(this);
  else
    return visitor->visitChildren(this);
}
//----------------- EqNeqExpContext ------------------------------------------------------------------

std::vector<SysYParser::ExpContext *> SysYParser::EqNeqExpContext::exp() {
  return getRuleContexts<SysYParser::ExpContext>();
}

SysYParser::ExpContext* SysYParser::EqNeqExpContext::exp(size_t i) {
  return getRuleContext<SysYParser::ExpContext>(i);
}

tree::TerminalNode* SysYParser::EqNeqExpContext::EQ() {
  return getToken(SysYParser::EQ, 0);
}

tree::TerminalNode* SysYParser::EqNeqExpContext::NEQ() {
  return getToken(SysYParser::NEQ, 0);
}

SysYParser::EqNeqExpContext::EqNeqExpContext(ExpContext *ctx) { copyFrom(ctx); }


std::any SysYParser::EqNeqExpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitEqNeqExp(this);
  else
    return visitor->visitChildren(this);
}
//----------------- FuncCallExpContext ------------------------------------------------------------------

tree::TerminalNode* SysYParser::FuncCallExpContext::IDENT() {
  return getToken(SysYParser::IDENT, 0);
}

tree::TerminalNode* SysYParser::FuncCallExpContext::L_PAREN() {
  return getToken(SysYParser::L_PAREN, 0);
}

tree::TerminalNode* SysYParser::FuncCallExpContext::R_PAREN() {
  return getToken(SysYParser::R_PAREN, 0);
}

SysYParser::FuncRParamsContext* SysYParser::FuncCallExpContext::funcRParams() {
  return getRuleContext<SysYParser::FuncRParamsContext>(0);
}

SysYParser::FuncCallExpContext::FuncCallExpContext(ExpContext *ctx) { copyFrom(ctx); }


std::any SysYParser::FuncCallExpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitFuncCallExp(this);
  else
    return visitor->visitChildren(this);
}
//----------------- AddSubExpContext ------------------------------------------------------------------

std::vector<SysYParser::ExpContext *> SysYParser::AddSubExpContext::exp() {
  return getRuleContexts<SysYParser::ExpContext>();
}

SysYParser::ExpContext* SysYParser::AddSubExpContext::exp(size_t i) {
  return getRuleContext<SysYParser::ExpContext>(i);
}

tree::TerminalNode* SysYParser::AddSubExpContext::PLUS() {
  return getToken(SysYParser::PLUS, 0);
}

tree::TerminalNode* SysYParser::AddSubExpContext::MINUS() {
  return getToken(SysYParser::MINUS, 0);
}

SysYParser::AddSubExpContext::AddSubExpContext(ExpContext *ctx) { copyFrom(ctx); }


std::any SysYParser::AddSubExpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitAddSubExp(this);
  else
    return visitor->visitChildren(this);
}
//----------------- RelExpContext ------------------------------------------------------------------

std::vector<SysYParser::ExpContext *> SysYParser::RelExpContext::exp() {
  return getRuleContexts<SysYParser::ExpContext>();
}

SysYParser::ExpContext* SysYParser::RelExpContext::exp(size_t i) {
  return getRuleContext<SysYParser::ExpContext>(i);
}

tree::TerminalNode* SysYParser::RelExpContext::LT() {
  return getToken(SysYParser::LT, 0);
}

tree::TerminalNode* SysYParser::RelExpContext::GT() {
  return getToken(SysYParser::GT, 0);
}

tree::TerminalNode* SysYParser::RelExpContext::LE() {
  return getToken(SysYParser::LE, 0);
}

tree::TerminalNode* SysYParser::RelExpContext::GE() {
  return getToken(SysYParser::GE, 0);
}

SysYParser::RelExpContext::RelExpContext(ExpContext *ctx) { copyFrom(ctx); }


std::any SysYParser::RelExpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitRelExp(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::ExpContext* SysYParser::exp() {
   return exp(0);
}

SysYParser::ExpContext* SysYParser::exp(int precedence) {
  ParserRuleContext *parentContext = _ctx;
  size_t parentState = getState();
  SysYParser::ExpContext *_localctx = _tracker.createInstance<ExpContext>(_ctx, parentState);
  SysYParser::ExpContext *previousContext = _localctx;
  (void)previousContext; // Silence compiler, in case the context is not used by generated code.
  size_t startState = 38;
  enterRecursionRule(_localctx, 38, SysYParser::RuleExp, precedence);

    size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    unrollRecursionContexts(parentContext);
  });
  try {
    size_t alt;
    enterOuterAlt(_localctx, 1);
    setState(305);
    _errHandler->sync(this);
    switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 32, _ctx)) {
    case 1: {
      _localctx = _tracker.createInstance<LValExpContext>(_localctx);
      _ctx = _localctx;
      previousContext = _localctx;

      setState(291);
      lVal();
      break;
    }

    case 2: {
      _localctx = _tracker.createInstance<ParenExpContext>(_localctx);
      _ctx = _localctx;
      previousContext = _localctx;
      setState(292);
      match(SysYParser::L_PAREN);
      setState(293);
      exp(0);
      setState(294);
      match(SysYParser::R_PAREN);
      break;
    }

    case 3: {
      _localctx = _tracker.createInstance<NumberExpContext>(_localctx);
      _ctx = _localctx;
      previousContext = _localctx;
      setState(296);
      number();
      break;
    }

    case 4: {
      _localctx = _tracker.createInstance<FuncCallExpContext>(_localctx);
      _ctx = _localctx;
      previousContext = _localctx;
      setState(297);
      match(SysYParser::IDENT);
      setState(298);
      match(SysYParser::L_PAREN);
      setState(300);
      _errHandler->sync(this);

      _la = _input->LA(1);
      if ((((_la & ~ 0x3fULL) == 0) &&
        ((1ULL << _la) & 137464147968) != 0)) {
        setState(299);
        funcRParams();
      }
      setState(302);
      match(SysYParser::R_PAREN);
      break;
    }

    case 5: {
      _localctx = _tracker.createInstance<UnaryExpContext>(_localctx);
      _ctx = _localctx;
      previousContext = _localctx;
      setState(303);
      _la = _input->LA(1);
      if (!((((_la & ~ 0x3fULL) == 0) &&
        ((1ULL << _la) & 137464119296) != 0))) {
      _errHandler->recoverInline(this);
      }
      else {
        _errHandler->reportMatch(this);
        consume();
      }
      setState(304);
      exp(7);
      break;
    }

    default:
      break;
    }
    _ctx->stop = _input->LT(-1);
    setState(327);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 34, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        setState(325);
        _errHandler->sync(this);
        switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 33, _ctx)) {
        case 1: {
          auto newContext = _tracker.createInstance<MulDivModExpContext>(_tracker.createInstance<ExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleExp);
          setState(307);

          if (!(precpred(_ctx, 6))) throw FailedPredicateException(this, "precpred(_ctx, 6)");
          setState(308);
          _la = _input->LA(1);
          if (!((((_la & ~ 0x3fULL) == 0) &&
            ((1ULL << _la) & 234881024) != 0))) {
          _errHandler->recoverInline(this);
          }
          else {
            _errHandler->reportMatch(this);
            consume();
          }
          setState(309);
          exp(7);
          break;
        }

        case 2: {
          auto newContext = _tracker.createInstance<AddSubExpContext>(_tracker.createInstance<ExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleExp);
          setState(310);

          if (!(precpred(_ctx, 5))) throw FailedPredicateException(this, "precpred(_ctx, 5)");
          setState(311);
          _la = _input->LA(1);
          if (!(_la == SysYParser::PLUS

          || _la == SysYParser::MINUS)) {
          _errHandler->recoverInline(this);
          }
          else {
            _errHandler->reportMatch(this);
            consume();
          }
          setState(312);
          exp(6);
          break;
        }

        case 3: {
          auto newContext = _tracker.createInstance<RelExpContext>(_tracker.createInstance<ExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleExp);
          setState(313);

          if (!(precpred(_ctx, 4))) throw FailedPredicateException(this, "precpred(_ctx, 4)");
          setState(314);
          _la = _input->LA(1);
          if (!((((_la & ~ 0x3fULL) == 0) &&
            ((1ULL << _la) & 32212254720) != 0))) {
          _errHandler->recoverInline(this);
          }
          else {
            _errHandler->reportMatch(this);
            consume();
          }
          setState(315);
          exp(5);
          break;
        }

        case 4: {
          auto newContext = _tracker.createInstance<EqNeqExpContext>(_tracker.createInstance<ExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleExp);
          setState(316);

          if (!(precpred(_ctx, 3))) throw FailedPredicateException(this, "precpred(_ctx, 3)");
          setState(317);
          _la = _input->LA(1);
          if (!(_la == SysYParser::EQ

          || _la == SysYParser::NEQ)) {
          _errHandler->recoverInline(this);
          }
          else {
            _errHandler->reportMatch(this);
            consume();
          }
          setState(318);
          exp(4);
          break;
        }

        case 5: {
          auto newContext = _tracker.createInstance<LandExpContext>(_tracker.createInstance<ExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleExp);
          setState(319);

          if (!(precpred(_ctx, 2))) throw FailedPredicateException(this, "precpred(_ctx, 2)");
          setState(320);
          match(SysYParser::AND);
          setState(321);
          exp(3);
          break;
        }

        case 6: {
          auto newContext = _tracker.createInstance<LorExpContext>(_tracker.createInstance<ExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleExp);
          setState(322);

          if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
          setState(323);
          match(SysYParser::OR);
          setState(324);
          exp(2);
          break;
        }

        default:
          break;
        } 
      }
      setState(329);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 34, _ctx);
    }
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }
  return _localctx;
}

//----------------- CondContext ------------------------------------------------------------------

SysYParser::CondContext::CondContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

SysYParser::ExpContext* SysYParser::CondContext::exp() {
  return getRuleContext<SysYParser::ExpContext>(0);
}


size_t SysYParser::CondContext::getRuleIndex() const {
  return SysYParser::RuleCond;
}


std::any SysYParser::CondContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitCond(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::CondContext* SysYParser::cond() {
  CondContext *_localctx = _tracker.createInstance<CondContext>(_ctx, getState());
  enterRule(_localctx, 40, SysYParser::RuleCond);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(330);
    exp(0);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- LValContext ------------------------------------------------------------------

SysYParser::LValContext::LValContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

std::vector<tree::TerminalNode *> SysYParser::LValContext::IDENT() {
  return getTokens(SysYParser::IDENT);
}

tree::TerminalNode* SysYParser::LValContext::IDENT(size_t i) {
  return getToken(SysYParser::IDENT, i);
}

std::vector<tree::TerminalNode *> SysYParser::LValContext::L_BRACK() {
  return getTokens(SysYParser::L_BRACK);
}

tree::TerminalNode* SysYParser::LValContext::L_BRACK(size_t i) {
  return getToken(SysYParser::L_BRACK, i);
}

std::vector<SysYParser::ExpContext *> SysYParser::LValContext::exp() {
  return getRuleContexts<SysYParser::ExpContext>();
}

SysYParser::ExpContext* SysYParser::LValContext::exp(size_t i) {
  return getRuleContext<SysYParser::ExpContext>(i);
}

std::vector<tree::TerminalNode *> SysYParser::LValContext::R_BRACK() {
  return getTokens(SysYParser::R_BRACK);
}

tree::TerminalNode* SysYParser::LValContext::R_BRACK(size_t i) {
  return getToken(SysYParser::R_BRACK, i);
}

std::vector<tree::TerminalNode *> SysYParser::LValContext::DOT() {
  return getTokens(SysYParser::DOT);
}

tree::TerminalNode* SysYParser::LValContext::DOT(size_t i) {
  return getToken(SysYParser::DOT, i);
}


size_t SysYParser::LValContext::getRuleIndex() const {
  return SysYParser::RuleLVal;
}


std::any SysYParser::LValContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitLVal(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::LValContext* SysYParser::lVal() {
  LValContext *_localctx = _tracker.createInstance<LValContext>(_ctx, getState());
  enterRule(_localctx, 42, SysYParser::RuleLVal);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    size_t alt;
    enterOuterAlt(_localctx, 1);
    setState(332);
    match(SysYParser::IDENT);
    setState(341);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 36, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        setState(339);
        _errHandler->sync(this);
        switch (_input->LA(1)) {
          case SysYParser::L_BRACK: {
            setState(333);
            match(SysYParser::L_BRACK);
            setState(334);
            exp(0);
            setState(335);
            match(SysYParser::R_BRACK);
            break;
          }

          case SysYParser::DOT: {
            setState(337);
            match(SysYParser::DOT);
            setState(338);
            match(SysYParser::IDENT);
            break;
          }

        default:
          throw NoViableAltException(this);
        } 
      }
      setState(343);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 36, _ctx);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- NumberContext ------------------------------------------------------------------

SysYParser::NumberContext::NumberContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* SysYParser::NumberContext::IntConst() {
  return getToken(SysYParser::IntConst, 0);
}


size_t SysYParser::NumberContext::getRuleIndex() const {
  return SysYParser::RuleNumber;
}


std::any SysYParser::NumberContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitNumber(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::NumberContext* SysYParser::number() {
  NumberContext *_localctx = _tracker.createInstance<NumberContext>(_ctx, getState());
  enterRule(_localctx, 44, SysYParser::RuleNumber);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(344);
    match(SysYParser::IntConst);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- FuncRParamsContext ------------------------------------------------------------------

SysYParser::FuncRParamsContext::FuncRParamsContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

std::vector<SysYParser::ExpContext *> SysYParser::FuncRParamsContext::exp() {
  return getRuleContexts<SysYParser::ExpContext>();
}

SysYParser::ExpContext* SysYParser::FuncRParamsContext::exp(size_t i) {
  return getRuleContext<SysYParser::ExpContext>(i);
}

std::vector<tree::TerminalNode *> SysYParser::FuncRParamsContext::COMMA() {
  return getTokens(SysYParser::COMMA);
}

tree::TerminalNode* SysYParser::FuncRParamsContext::COMMA(size_t i) {
  return getToken(SysYParser::COMMA, i);
}


size_t SysYParser::FuncRParamsContext::getRuleIndex() const {
  return SysYParser::RuleFuncRParams;
}


std::any SysYParser::FuncRParamsContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitFuncRParams(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::FuncRParamsContext* SysYParser::funcRParams() {
  FuncRParamsContext *_localctx = _tracker.createInstance<FuncRParamsContext>(_ctx, getState());
  enterRule(_localctx, 46, SysYParser::RuleFuncRParams);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(346);
    exp(0);
    setState(351);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == SysYParser::COMMA) {
      setState(347);
      match(SysYParser::COMMA);
      setState(348);
      exp(0);
      setState(353);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- ConstExpContext ------------------------------------------------------------------

SysYParser::ConstExpContext::ConstExpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

SysYParser::ExpContext* SysYParser::ConstExpContext::exp() {
  return getRuleContext<SysYParser::ExpContext>(0);
}


size_t SysYParser::ConstExpContext::getRuleIndex() const {
  return SysYParser::RuleConstExp;
}


std::any SysYParser::ConstExpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<SysYParserVisitor*>(visitor))
    return parserVisitor->visitConstExp(this);
  else
    return visitor->visitChildren(this);
}

SysYParser::ConstExpContext* SysYParser::constExp() {
  ConstExpContext *_localctx = _tracker.createInstance<ConstExpContext>(_ctx, getState());
  enterRule(_localctx, 48, SysYParser::RuleConstExp);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(354);
    exp(0);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

bool SysYParser::sempred(RuleContext *context, size_t ruleIndex, size_t predicateIndex) {
  switch (ruleIndex) {
    case 19: return expSempred(antlrcpp::downCast<ExpContext *>(context), predicateIndex);

  default:
    break;
  }
  return true;
}

bool SysYParser::expSempred(ExpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 0: return precpred(_ctx, 6);
    case 1: return precpred(_ctx, 5);
    case 2: return precpred(_ctx, 4);
    case 3: return precpred(_ctx, 3);
    case 4: return precpred(_ctx, 2);
    case 5: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

void SysYParser::initialize() {
#if ANTLR4_USE_THREAD_LOCAL_CACHE
  sysyparserParserInitialize();
#else
  ::antlr4::internal::call_once(sysyparserParserOnceFlag, sysyparserParserInitialize);
#endif
}
