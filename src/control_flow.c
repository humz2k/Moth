#include "ast.h"

NODE make_break(void){
    NODE out = make_ast_node();
    out->t = BREAK_NODE;
    return out;
}

NODE make_continue(void){
    NODE out = make_ast_node();
    out->t = CONTINUE_NODE;
    return out;
}
