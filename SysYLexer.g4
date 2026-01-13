lexer grammar SysYLexer;

// Keywords
CONST: 'const';
INT: 'int';
FLOAT: 'float';
VOID: 'void';
IF: 'if';
ELSE: 'else';
WHILE: 'while';
FOR: 'for';
STRUCT: 'struct';
BREAK: 'break';
CONTINUE: 'continue';
RETURN: 'return';

// Identifiers
IDENT: [a-zA-Z_] [a-zA-Z_0-9]*;

FloatConst:
    [0-9]* '.' [0-9]+ ([eE] [+-]? [0-9]+)?
    | [0-9]+ [eE] [+-]? [0-9]+;

// Constants (核心修复：添加十六进制和八进制支持)
IntConst:
	('0x' | '0X') [0-9a-fA-F]+
	| '0' [0-7]*
	| [1-9] [0-9]*;

// Operators
L_PAREN: '(';
R_PAREN: ')';
L_BRACK: '[';
R_BRACK: ']';
L_BRACE: '{';
R_BRACE: '}';
DOT: '.';
COMMA: ',';
SEMICOLON: ';';

PLUS: '+';
MINUS: '-';
MUL: '*';
DIV: '/';
MOD: '%';

ASSIGN: '=';
EQ: '==';
NEQ: '!=';
LT: '<';
GT: '>';
LE: '<=';
GE: '>=';

AND: '&&';
OR: '||';
NOT: '!';
BITAND: '&'; 
// Whitespace
WS: [ \t\r\n]+ -> skip;
LINE_COMMENT: '//' .*? '\n' -> skip;
BLOCK_COMMENT: '/*' .*? '*/' -> skip;