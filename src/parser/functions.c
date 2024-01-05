#include "parser/ast.h"
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

NODE make_function(char* id, NODE_VEC inputs, NODE block, NODE ret_type, NODE_VEC modifiers){
    NODE out = make_ast_node();
    out->t = FUNCTION_NODE;
    out->data.function_data.is_template = 0;
    out->data.function_data.id = id;
    out->data.function_data.ret_type = ret_type;
    out->data.function_data.inputs = inputs;
    out->data.function_data.block = block;
    out->data.function_data.modifiers = modifiers;
    return out;
}

NODE make_function_template(char* id, NODE_VEC inputs, NODE block, NODE ret_type, NODE_VEC modifiers, NODE specialize){
    NODE out = make_ast_node();
    out->t = FUNCTION_NODE;
    out->data.function_data.is_template = 1;
    out->data.function_data.id = id;
    out->data.function_data.ret_type = ret_type;
    out->data.function_data.inputs = inputs;
    out->data.function_data.block = block;
    out->data.function_data.specialize = specialize;
    out->data.function_data.modifiers = modifiers;
    return out;
}

NODE make_modifier(char* id){
    NODE out = make_ast_node();
    out->t = MODIFIER_NODE;
    out->data.id = id;
    return out;
}
