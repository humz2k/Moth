#ifndef _AST_H_
#define _AST_H_

struct ast_node;

typedef struct ast_node* NODE;

enum node_type{
    REAL_CONSTANT,
    BOOL_CONSTANT,
    INTEGER_CONSTANT,
    STRING_CONSTANT,
    BINOP_NODE,
    TYPE_NODE,
    DECLARATION_NODE
};


NODE make_real_const(float r);
NODE make_bool_const(int i);
NODE make_int_const(int i);
NODE make_string_const(char* s);


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
};

NODE make_base_type(enum type_type t);

NODE make_template_type(NODE base, NODE specialize);

NODE make_user_type(char* id);

NODE make_ref_type(NODE ref);

struct declaration_node{
    NODE type;
    char* id;
};


union node_data{
    float r;
    int i;
    char* id;
    char* s;
    struct binop_node binop_data;
    struct type_node type_data;
    struct declaration_node declaration_data;
};

struct ast_node{
    enum node_type t;
    union node_data data;
};

NODE make_ast_node(void);

#endif
