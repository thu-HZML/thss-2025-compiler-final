lexer grammar SysYLexer;

// Keywords
CONST: 'const';
INT: 'int';
VOID: 'void';
IF: 'if';
ELSE: 'else';
WHILE: 'while';
BREAK: 'break';
CONTINUE: 'continue';
RETURN: 'return';

// Identifiers
IDENT: [a-zA-Z_] [a-zA-Z_0-9]*;

// Constants
IntConst: ('0' | [1-9] [0-9]*);

// Operators and Punctuators
L_PAREN: '(';
R_PAREN: ')';
L_BRACK: '[';
R_BRACK: ']';
L_BRACE: '{';
R_BRACE: '}';
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

// Whitespace and Comments
WS: [ \t\r\n]+ -> skip;
LINE_COMMENT: '//' .*? '\n' -> skip;
BLOCK_COMMENT: '/*' .*? '*/' -> skip;