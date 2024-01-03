#include "ast.h"

NODE make_block(NODE_VEC statements){
    NODE out = make_ast_node();
    out->t = BLOCK_NODE;
    out->data.block_data.statements = statements;
    return out;
}
