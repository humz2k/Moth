%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

int yylex(void);

void yyerror(char const *s);

%}

%token <r> REAL
%token <i> BOOL
%token <i> INTEGER
%token <id> ID

%token I1 I8 I16 I32 I64 F16 F32 F64 STR VOID NEWLN

%token WITH GENERIC

%token LE GE EQ NEQ LAND LOR
%token IF ELSE ELIF FOR IN WHILE RETURN BREAK CONTINUE
%token PLUS_EQ MINUS_EQ POW_EQ MUL_EQ FLOOR_EQ DIV_EQ MOD_EQ LSHIFT_EQ RSHIFT_EQ BITNOT_EQ LSHIFT RSHIFT

%token INDENT DEINDENT

%token DEF STRUCT OBJECT INTERFACE

%left '=' PLUS_EQ MINUS_EQ POW_EQ MUL_EQ FLOOR_EQ DIV_EQ MOD_EQ LSHIFT_EQ RSHIFT_EQ BITNOT_EQ MOD

%nonassoc ELSE

%left EQ NEQ GE LE '<' '>'

%left LAND LOR
%right "neg"
%left LSHIFT RSHIFT
%left '+' '-'
%left '*' '/' FLOORDIV '%'

%left '$'

%right '!' '~'
%right ')'

%left '('

%union {
    char id[31];
    double r;
    int i;
}

%start comp_unit_list

%%

pass
    : NEWLN

comp_unit_list
    : comp_unit
    | comp_unit_list comp_unit

comp_unit
    : line
    | pass
    | function
    | object_def
    | struct_def
    | template_def

template_def
    : WITH GENERIC ID IN '(' type_list ')' ':' NEWLN INDENT comp_unit_list DEINDENT

type_list
    : type
    | type_list ',' type

function
    : DEF type ID '(' ')' ':' NEWLN block

block
    : INDENT statement_list DEINDENT

statement_list
    : statement
    | statement_list statement

statement
    : line
    | pass

line
    : expression NEWLN

object_def
    : OBJECT ID ':' NEWLN attrs
    | OBJECT ID '$' type ':' NEWLN attrs

struct_def
    : STRUCT ID ':' NEWLN attrs
    | STRUCT ID '$' type ':' NEWLN attrs

attrs
    : INDENT attr_list DEINDENT
    | INDENT attr_list function_list DEINDENT
    | INDENT function_list DEINDENT

function_list
    : function
    | function_list function

attr_list
    : declaration NEWLN
    | attr_list declaration NEWLN
    | NEWLN
    | attr_list NEWLN

constant
    : REAL
    | BOOL
    | INTEGER

binop
    : expression '+' expression
    | expression '-' expression
    | expression '*' expression
    | expression '/' expression
    | expression FLOORDIV expression
    | expression MOD expression
    | expression LSHIFT expression
    | expression RSHIFT expression
    | expression LE expression
    | expression GE expression
    | expression EQ expression
    | expression NEQ expression
    | expression LAND expression
    | expression LOR expression
    | expression '<' expression
    | expression '>' expression

reference
    : ID '.' ID
    | reference '.' ID

variable
    : ID

type
    : I1
    | I8
    | I16
    | I32
    | I64
    | F16
    | F32
    | F64
    | STR
    | ID
    | VOID
    | reference
    | type '$' type

declaration
    : type variable

expression
    : constant
    | declaration
    | variable
    | reference
    | binop
    | '(' expression ')'
    | expression '=' expression

%%

void yyerror(char const *s)
{
    printf("ERROR: %s\n",s);
    exit(1);
}