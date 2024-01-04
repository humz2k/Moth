#ifndef _ARRAY_H_
#define _ARRAY_H_

#include "parser/ast_node.h"

struct array_initializer_node{
    NODE type;
    NODE_VEC dims;
};

NODE make_array_initializer(NODE type, NODE_VEC dims);

#endif
