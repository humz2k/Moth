#include "ast.h"

NODE make_real_const(float r){
    NODE out = make_ast_node();
    out->t = REAL_CONSTANT;
    out->data.r = r;
    return out;
}

NODE make_bool_const(int i){
    NODE out = make_ast_node();
    out->t = BOOL_CONSTANT;
    out->data.i = i;
    return out;
}

NODE make_int_const(int i){
    NODE out = make_ast_node();
    out->t = INTEGER_CONSTANT;
    out->data.i = i;
    return out;
}

NODE make_string_const(char* s){
    NODE out = make_ast_node();
    out->t = STRING_CONSTANT;
    out->data.s = s;
    return out;
}

