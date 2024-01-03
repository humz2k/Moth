#include "ast.h"

NODE make_var(char* id){
    NODE out = make_ast_node();
    out->t = VAR_NODE;
    out->data.var_data.id = id;
    return out;
}

NODE make_decl(NODE type, NODE var){
    NODE out = make_ast_node();
    out->t = DECLARATION_NODE;
    out->data.declaration_data.type = type;
    out->data.declaration_data.var = var;
    return out;
}

NODE make_assign(NODE left, NODE right){
    NODE out = make_ast_node();
    out->t = ASSIGN_NODE;
    out->data.assign_data.left = left;
    out->data.assign_data.right = right;
    return out;
}
