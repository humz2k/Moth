#ifndef _AST_H_
#define _AST_H_

#include "ast_node.h"

#include "constants.h"

enum binop_type{
    OP_ADD,OP_SUB,OP_MUL,OP_DIV,
    OP_FLOORDIV,OP_MOD,OP_LSHIFT,
    OP_RSHIFT,OP_LE,OP_GE,OP_EQ,
    OP_NEQ,OP_LAND,OP_LOR,OP_LT,OP_GT
};

struct binop_node{
    NODE left;
    NODE right;
    enum binop_type t;
};

NODE make_binop(NODE left, NODE right, enum binop_type t);

enum type_type{
    TY_I1,
    TY_I8,
    TY_I16,
    TY_I32,
    TY_I64,
    TY_F16,
    TY_F32,
    TY_F64,
    TY_STR,
    TY_VOID,
    TY_TEMPLATE,
    TY_ID,
    TY_REF
};

struct type_node{
    enum type_type t;
    NODE ref;
    char* id;
    NODE base;
    NODE specialize;
};

NODE make_base_type(enum type_type t);

NODE make_template_type(NODE base, NODE specialize);

NODE make_user_type(char* id);

NODE make_ref_type(NODE ref);

struct var_node{
    char* id;
};

NODE make_var(char* id);

struct declaration_node{
    NODE type;
    NODE var;
};

NODE make_decl(NODE type, NODE var);


struct reference_node{
    int ref_base;
    char* left;
    char* right;
    NODE ref;
};

NODE make_ref_base(char* left, char* right);
NODE make_ref_ref(NODE ref, char* right);


union node_data{
    float r;
    int i;
    char* id;
    char* s;
    struct binop_node binop_data;
    struct type_node type_data;
    struct var_node var_data;
    struct declaration_node declaration_data;
    struct reference_node reference_data;
};

struct ast_node{
    enum node_type t;
    union node_data data;
};

NODE make_ast_node(void);

#endif
