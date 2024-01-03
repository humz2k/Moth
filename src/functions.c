#include "ast.h"
#include <stdlib.h>

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

NODE make_return(NODE expr){
    NODE out = make_ast_node();
    out->t = RETURN_NODE;
    out->data.return_data.expr = expr;
    return out;
}

NODE make_empty_return(void){
    NODE out = make_ast_node();
    out->t = RETURN_NODE;
    out->data.return_data.expr = NULL;
    return out;
}
