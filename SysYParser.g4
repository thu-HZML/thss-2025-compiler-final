parser grammar SysYParser;

options {
    tokenVocab = SysYLexer;
}

compUnit: (decl | funcDef)* EOF;

decl: constDecl | varDecl;

constDecl: CONST bType constDef (COMMA constDef)* SEMICOLON;

bType: INT;

constDef: IDENT (L_BRACK constExp R_BRACK)* ASSIGN constInitVal;

constInitVal
    : constExp
    | L_BRACE (constInitVal (COMMA constInitVal)*)? R_BRACE
    ;

varDecl: bType varDef (COMMA varDef)* SEMICOLON;

varDef
    : IDENT (L_BRACK constExp R_BRACK)*
    | IDENT (L_BRACK constExp R_BRACK)* ASSIGN initVal
    ;

initVal
    : exp
    | L_BRACE (initVal (COMMA initVal)*)? R_BRACE
    ;

funcDef: funcType IDENT L_PAREN funcFParams? R_PAREN block;

funcType: VOID | INT;

funcFParams: funcFParam (COMMA funcFParam)*;

funcFParam: bType IDENT (L_BRACK R_BRACK (L_BRACK exp R_BRACK)*)?;

block: L_BRACE blockItem* R_BRACE;

blockItem: decl | stmt;

stmt
    : lVal ASSIGN exp SEMICOLON                                     # assignStmt
    | exp? SEMICOLON                                                # expStmt
    | block                                                         # blockStmt
    | IF L_PAREN cond R_PAREN stmt (ELSE stmt)?                     # ifStmt
    | WHILE L_PAREN cond R_PAREN stmt                               # whileStmt
    | BREAK SEMICOLON                                               # breakStmt
    | CONTINUE SEMICOLON                                            # continueStmt
    | RETURN exp? SEMICOLON                                         # returnStmt
    ;

exp
    : lVal                                                          # lValExp
    | L_PAREN exp R_PAREN                                           # parenExp
    | number                                                        # numberExp
    | IDENT L_PAREN funcRParams? R_PAREN                            # funcCallExp
    | (PLUS | MINUS | NOT) exp                                      # unaryExp
    | exp (MUL | DIV | MOD) exp                                     # mulDivModExp
    | exp (PLUS | MINUS) exp                                        # addSubExp
    | exp (LT | GT | LE | GE) exp                                   # relExp
    | exp (EQ | NEQ) exp                                            # eqNeqExp
    | exp AND exp                                                   # landExp
    | exp OR exp                                                    # lorExp
    ;

cond: exp;

lVal: IDENT (L_BRACK exp R_BRACK)*;

number: IntConst;

funcRParams: exp (COMMA exp)*;

constExp: exp;