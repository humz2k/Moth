%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "parser/ast.h"

int yylex(void);

void yyerror(char const *s);

%}

%token <r> REAL
%token <i> BOOL
%token <i> INTEGER
%token <id> ID
%token <s> STRING

%token I1 I8 I16 I32 I64 F16 F32 F64 STR VOID NEWLN PASS PRINT

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
%right '['

%right '{'

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
%type <n> ret
%type <n> brk
%type <n> cont
%type <n> attrs
%type <n> object_def
%type <n> struct_def
%type <n> statement
%type <n> pass
%type <n> line
%type <n> block
%type <n> if_statement
%type <n> elif_statement
%type <n> else_statement
%type <n> while_loop
%type <n> for_loop
%type <n> function
%type <n> template_def
%type <n> comp_unit
%type <n> program
%type <n> array_initializer
%type <n> print
%type <n> sinop
%type <v> expression_list
%type <v> attr_list
%type <v> function_list
%type <v> statement_list
%type <v> elif_list
%type <v> declaration_list
%type <v> type_list
%type <v> comp_unit_list
%type <i> array_dims

%union {
    char* id;
    char* s;
    double r;
    int i;
    NODE n;
    NODE_VEC v;
}

%start program

%%

program
    : comp_unit_list {$$ = make_program($1);}

pass
    : NEWLN {$$ = make_pass();}
    | PASS {$$ = make_pass();}

comp_unit_list
    : comp_unit {$$ = make_node_vec($1);}
    | comp_unit_list comp_unit {$$ = append_node_vec($1,$2);}

comp_unit
    : line {$$ = $1;}
    | pass {$$ = $1;}
    | function {$$ = $1;}
    | object_def {$$ = $1;}
    | struct_def {$$ = $1;}
    | template_def {$$ = $1;}

template_def
    : WITH GENERIC ID IN '(' type_list ')' ':' NEWLN INDENT comp_unit_list DEINDENT { $$ = make_template($3,$6,$11); }

type_list
    : type {$$ = make_node_vec($1);}
    | type_list ',' type {$$ = append_node_vec($1,$3);}

function
    : DEF type ID '(' ')' ':' NEWLN block {$$ = make_function($3,make_empty_node_vec(),$8,$2);}
    | DEF type ID '(' declaration_list ')' ':' NEWLN block {$$ = make_function($3,$5,$9,$2);}
    | DEF type ID '$' type '(' ')' ':' NEWLN block {$$ = make_function_template($3,make_empty_node_vec(),$10,$2,$5);}
    | DEF type ID '$' type '(' declaration_list ')' ':' NEWLN block {$$ = make_function_template($3,$7,$11,$2,$5);}

declaration_list
    : declaration {$$ = make_node_vec($1);}
    | declaration_list ',' declaration {$$ = append_node_vec($1,$3);}

block
    : INDENT statement_list DEINDENT {$$ = make_block($2);}

statement_list
    : statement {$$ = make_node_vec($1);}
    | statement_list statement {$$ = append_node_vec($1,$2);}

statement
    : line {$$ = $1;}
    | pass {$$ = $1;}

line
    : expression NEWLN {$$ = $1;}
    | ret NEWLN {$$ = $1;}
    | while_loop {$$ = $1;}
    | for_loop {$$ = $1;}
    | if_statement {$$ = $1;}
    | brk NEWLN {$$ = $1;}
    | cont NEWLN {$$ = $1;}
    | print NEWLN {$$ = $1;}

print
    : PRINT '(' expression_list ')' {$$ = make_print($3);}

if_statement
    : IF expression ':' NEWLN block {$$ = make_if_statement($2,$5,NULL);}
    | IF expression ':' NEWLN block else_statement {$$ = make_if_statement($2,$5,$6);}

elif_list
    : elif_statement {$$ = make_node_vec($1);}
    | elif_list elif_statement {$$ = append_node_vec($1,$2);}

elif_statement
    : ELIF expression ':' NEWLN block {$$ = make_elif_statement($2,$5);}

else_statement
    : ELSE ':' NEWLN block {$$ = make_else_statement(make_empty_node_vec(),$4);}
    | elif_list ELSE ':' NEWLN block {$$ = make_else_statement($1,$5);}
    | elif_list {$$ = make_else_statement($1,NULL);}

while_loop
    : WHILE expression ':' NEWLN block {$$ = make_while_loop($2,$5);}

for_loop
    : FOR expression IN expression ':' NEWLN block {$$ = make_for_loop($2,$4,$7);}

ret
    : RETURN expression {$$ = make_return($2);}
    | RETURN {$$ = make_empty_return();}

brk
    : BREAK {$$ = make_break();}

cont
    : CONTINUE {$$ = make_continue();}

object_def
    : OBJECT ID ':' NEWLN attrs {$$ = make_object($2,$5);}
    | OBJECT ID '$' type ':' NEWLN attrs {$$ = make_object_template($2,$7,$4);}

struct_def
    : STRUCT ID ':' NEWLN attrs {$$ = make_struct($2,$5);}
    | STRUCT ID '$' type ':' NEWLN attrs {$$ = make_struct_template($2,$7,$4);}

attrs
    : INDENT attr_list DEINDENT {$$ = make_attrs($2,make_empty_node_vec());}
    | INDENT attr_list function_list DEINDENT {$$ = make_attrs($2,$3);}
    | INDENT function_list DEINDENT {$$ = make_attrs(make_empty_node_vec(),$2);}

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
    | type '{' array_dims '}' {$$ = make_array_type($1,$3);}
    | type '{' '}' {$$ = make_array_type($1,0);}

array_dims
    : ':' {$$ = 1;}
    | array_dims ',' ':' {$$ = $1 + 1;}

array_initializer
    : type '{' expression_list '}' {$$ = make_array_initializer($1,$3);}

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
    | array_initializer {$$ = $1;}
    | sinop {$$ = $1;}

sinop
    : '-' expression {$$ = make_sinop($2,OP_NEG);}
    | '!' expression {$$ = make_sinop($2,OP_LOGICAL_NOT);}
    | '~' expression {$$ = make_sinop($2,OP_BIT_NOT);}

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