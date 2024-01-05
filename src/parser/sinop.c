#include "parser/ast.h"

NODE make_sinop(NODE expr,  enum sinop_type t){
    NODE out = make_ast_node();
    out->t = SINOP_NODE;
    out->data.sinop_data.expr = expr;
    out->data.sinop_data.t = t;
    return out;
}
