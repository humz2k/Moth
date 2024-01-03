#include "ast.h"

NODE make_function_call(NODE func, NODE_VEC args){
    NODE out = make_ast_node();
    out->t = FUNCTION_CALL_NODE;
    out->data.function_call_data.func = func;
    out->data.function_call_data.args = args;
    return out;
}

NODE make_function_call_no_args(NODE func){
    NODE out = make_ast_node();
    out->t = FUNCTION_CALL_NODE;
    out->data.function_call_data.func = func;
    out->data.function_call_data.args = make_empty_node_vec();
    return out;
}
