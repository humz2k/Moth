#include "ast.h"

NODE make_binop(NODE left, NODE right, enum binop_type t){
    NODE out = make_ast_node();
    out->t = BINOP_NODE;
    out->data.binop_data.left = left;
    out->data.binop_data.right = right;
    out->data.binop_data.t = t;
    return out;
}
