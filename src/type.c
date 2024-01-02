#include "ast.h"

NODE make_base_type(enum type_type t){
    NODE out = make_ast_node();
    out->t = TYPE_NODE;
    out->data.type_data.t = t;
    return out;
}

NODE make_template_type(NODE base, NODE specialize){
    NODE out = make_ast_node();
    out->t = TYPE_NODE;
    out->data.type_data.t = TY_TEMPLATE;
    out->data.type_data.
    return out;
}

NODE make_user_type(char* id);

NODE make_ref_type(NODE ref);