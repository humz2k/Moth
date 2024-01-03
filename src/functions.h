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

NODE make_return(NODE expr);
NODE make_empty_return(void);

struct function_node{
    int is_template;
    char* id;
    NODE_VEC inputs;
    NODE block;
    NODE ret_type;
    NODE specialize;
};

NODE make_function(char* id, NODE_VEC inputs, NODE block, NODE ret_type);

NODE make_function_template(char* id, NODE_VEC inputs, NODE block, NODE ret_type, NODE specialize);

#endif
