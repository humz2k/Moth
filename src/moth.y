%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "ast.h"

int yylex(void);

void yyerror(char const *s);

%}

%token <r> REAL
%token <i> BOOL
%token <i> INTEGER
%token <id> ID
%token <s> STRING

%token I1 I8 I16 I32 I64 F16 F32 F64 STR VOID NEWLN PASS

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

%left '$' '['

%right '!' '~'
%right ')'

%left '('

%type <n> constant
%type <n> expression
%type <n> binop
%type <n> type
%type <n> variable
%type <n> reference
%type <n> declaration
%type <n> assign
%type <n> func_call
%type <n> index
%type <v> expression_list
%type <v> attr_list
%type <v> function_list

%union {
    char* id;
    char* s;
    double r;
    int i;
    NODE n;
    NODE_VEC v;
}

%start comp_unit_list

%%

pass
    : NEWLN
    | PASS

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
    | DEF type ID '(' declaration_list ')' ':' NEWLN block

declaration_list
    : declaration
    | declaration_list ',' declaration

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
    | ret NEWLN
    | while_loop
    | for_loop
    | if_statement

if_statement
    : IF expression ':' NEWLN block
    | IF expression ':' NEWLN block else_statement

elif_list
    : elif_statement
    | elif_list elif_statement

elif_statement
    : ELIF expression ':' NEWLN block

else_statement
    : ELSE ':' NEWLN block
    | elif_list ELSE ':' NEWLN block

while_loop
    : WHILE expression ':' NEWLN block

for_loop
    : FOR expression IN expression ':' NEWLN block

ret
    : RETURN expression
    | RETURN

brk
    : BREAK

cont
    : CONTINUE

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
    : function {$$ = make_node_vec($1);}
    | function_list function {$$ = append_node_vec($1,$2);}

attr_list
    : declaration NEWLN {$$ = make_node_vec($1);}
    | attr_list declaration NEWLN {$$ = append_node_vec($1,$2);}
    | NEWLN {$$ = make_empty_node_vec();}
    | attr_list NEWLN {$$ = $1;}

constant
    : REAL {$$ = make_real_const($1);}
    | BOOL {$$ = make_bool_const($1);}
    | INTEGER {$$ = make_int_const($1);}
    | STRING {$$ = make_string_const($1);}

binop
    : expression '+' expression {$$ = make_binop($1,$3,OP_ADD);}
    | expression '-' expression {$$ = make_binop($1,$3,OP_SUB);}
    | expression '*' expression {$$ = make_binop($1,$3,OP_MUL);}
    | expression '/' expression {$$ = make_binop($1,$3,OP_DIV);}
    | expression FLOORDIV expression {$$ = make_binop($1,$3,OP_FLOORDIV);}
    | expression MOD expression {$$ = make_binop($1,$3,OP_MOD);}
    | expression LSHIFT expression {$$ = make_binop($1,$3,OP_LSHIFT);}
    | expression RSHIFT expression {$$ = make_binop($1,$3,OP_RSHIFT);}
    | expression LE expression {$$ = make_binop($1,$3,OP_LE);}
    | expression GE expression {$$ = make_binop($1,$3,OP_GE);}
    | expression EQ expression {$$ = make_binop($1,$3,OP_EQ);}
    | expression NEQ expression {$$ = make_binop($1,$3,OP_NEQ);}
    | expression LAND expression {$$ = make_binop($1,$3,OP_LAND);}
    | expression LOR expression {$$ = make_binop($1,$3,OP_LOR);}
    | expression '<' expression {$$ = make_binop($1,$3,OP_LT);}
    | expression '>' expression {$$ = make_binop($1,$3,OP_GT);}

reference
    : ID '.' ID {$$ = make_ref_base($1,$3);}
    | reference '.' ID {$$ = make_ref_ref($1,$3);}

variable
    : ID {$$ = make_var($1);}

type
    : I1 {$$ = make_base_type(TY_I1);}
    | I8 {$$ = make_base_type(TY_I8);}
    | I16 {$$ = make_base_type(TY_I16);}
    | I32 {$$ = make_base_type(TY_I32);}
    | I64 {$$ = make_base_type(TY_I64);}
    | F16 {$$ = make_base_type(TY_F16);}
    | F32 {$$ = make_base_type(TY_F32);}
    | F64 {$$ = make_base_type(TY_F64);}
    | STR {$$ = make_base_type(TY_STR);}
    | ID {$$ = make_user_type($1);}
    | VOID {$$ = make_base_type(TY_VOID);}
    | reference {$$ = make_ref_type($1);}
    | type '$' type {$$ = make_template_type($1,$3);}

declaration
    : type variable {$$ = make_decl($1,$2);}

expression
    : constant {$$ = $1;}
    | declaration {$$ = $1;}
    | variable {$$ = $1;}
    | reference {$$ = $1;}
    | binop {$$ = $1;}
    | '(' expression ')' {$$ = $2;}
    | assign {$$ = $1;}
    | func_call {$$ = $1;}
    | index {$$ = $1;}

assign
    : expression '=' expression {$$ = make_assign($1,$3);}

func_call
    : expression '(' expression_list ')' {$$ = make_function_call($1,$3);}
    | expression '(' ')' {$$ = make_function_call_no_args($1);}

index
    : expression '[' expression_list ']' {$$ = make_index($1,$3);}

expression_list
    : expression {$$ = make_node_vec($1);}
    | expression_list ',' expression {$$ = append_node_vec($1,$3);}

%%

void yyerror(char const *s)
{
    printf("ERROR: %s\n",s);
    exit(1);
}