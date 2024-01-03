#ifndef _BINOP_H_
#define _BINOP_H_

#include "ast_node.h"

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

#endif