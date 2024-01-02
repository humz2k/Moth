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

%token I1 I8 I16 I32 I64 F16 F32 F64 STR NEWLN

%token LE GE EQ NEQ LAND LOR
%token IF ELSE ELIF FOR IN WHILE RETURN BREAK CONTINUE
%token PLUS_EQ MINUS_EQ POW_EQ MUL_EQ FLOOR_EQ DIV_EQ MOD_EQ LSHIFT_EQ RSHIFT_EQ BITNOT_EQ LSHIFT RSHIFT

%token INDENT DEINDENT

%token DEF STRUCT OBJECT INTERFACE

%left '=' PLUS_EQ MINUS_EQ POW_EQ MUL_EQ FLOOR_EQ DIV_EQ MOD_EQ LSHIFT_EQ RSHIFT_EQ BITNOT_EQ

%nonassoc ELSE

%left EQ NEQ GE LE '<' '>'

%left LAND LOR
%right "neg"
%left LSHIFT RSHIFT
%left '+' '-'
%left '*' '/' FLOORDIV '%'

%right '!' '~'
%right ')'

%left '('

%union {
    char id[31];
    double r;
    int i;
}

%start statement_list

%%

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
    | expression '%' expression
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
    | reference

declaration
    : type variable

expression
    : constant
    | declaration
    | variable
    | reference
    | binop
    | '(' expression ')' //{printf("match expr\n");}

block
    : INDENT statement_list DEINDENT //{printf("match block\n");}

function
    : DEF type ID '(' ')' ':' NEWLN block

statement
    : expression NEWLN //{printf("match statement\n");}
    | NEWLN //{printf("match empty statement\n");}
    | function
    | block

statement_list
    : statement
    | statement_list statement

%%

void yyerror(char const *s)
{
    printf("ERROR: %s\n",s);
    exit(1);
}