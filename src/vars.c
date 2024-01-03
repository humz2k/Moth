#include "ast.h"

NODE make_var(char* id){
    NODE out = make_ast_node();
    out->t = VAR_NODE;
    out->data.var_data.id = id;
}

NODE make_decl(NODE type, NODE var){
    NODE out = make_ast_node();
    out->t = DECLARATION_NODE;
    out->data.declaration_data.type = type;
    out->data.declaration_data.var = var;
    return out;
}