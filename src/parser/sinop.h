#ifndef _SINOP_H_
#define _SINOP_H_

#include "parser/ast_node.h"

enum sinop_type{
    OP_LOGICAL_NOT,OP_BIT_NOT,OP_NEG
};

struct sinop_node{
    NODE expr;
    enum sinop_type t;
};

NODE make_sinop(NODE expr, enum sinop_type t);

struct cast_node{
    NODE expr;
    NODE type;
};

NODE make_cast(NODE type, NODE expr);

#endif
