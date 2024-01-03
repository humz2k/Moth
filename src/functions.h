#ifndef _FUNCTIONS_H_
#define _FUNCTIONS_H_

#include "ast_node.h"

struct function_call_node{
    NODE func;
    NODE_VEC args;
};

NODE make_function_call(NODE func, NODE_VEC args);

NODE make_function_call_no_args(NODE func);

struct return_node{
    NODE expr;
};

NODE make_return_node(NODE expr);
NODE make_empty_return(void);

#endif
