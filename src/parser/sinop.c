#include "parser/ast.h"

NODE make_sinop(NODE expr,  enum sinop_type t){
    NODE out = make_ast_node();
    out->t = SINOP_NODE;
    out->data.sinop_data.expr = expr;
    out->data.sinop_data.t = t;
    return out;
}

NODE make_cast(NODE type, NODE expr){
    NODE out = make_ast_node();
    out->t = CAST_NODE;
    out->data.cast_data.expr = expr;
    out->data.cast_data.type = type;
    return out;
}
