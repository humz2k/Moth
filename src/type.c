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
    out->data.type_data.base = base;
    out->data.type_data.specialize = specialize;
    return out;
}

NODE make_user_type(char* id){
    NODE out = make_ast_node();
    out->t = TYPE_NODE;
    out->data.type_data.t = TY_USER;
    out->data.type_data.id = id;
    return out;
}

NODE make_ref_type(NODE ref){
    NODE out = make_ast_node();
    out->t = TYPE_NODE;
    out->data.type_data.t = TY_REF;
    out->data.type_data.ref = ref;
    return out;
}

NODE make_array_type(NODE base, int ndims){
    NODE out = make_ast_node();
    out->t = TYPE_NODE;
    out->data.type_data.t = TY_ARRAY;
    out->data.type_data.base = base;
    out->data.type_data.ndims = ndims;
    return out;
}