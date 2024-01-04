#include "parser/ast.h"

NODE make_array_initializer(NODE type, NODE_VEC dims){
    NODE out = make_ast_node();
    out->t = ARRAY_INITIALIZER_NODE;
    out->data.array_initializer_data.type = type;
    out->data.array_initializer_data.dims = dims;
    return out;
}
