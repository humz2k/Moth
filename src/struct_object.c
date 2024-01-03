#include "ast.h"
#include <stdlib.h>

NODE make_attrs(NODE_VEC attr_list, NODE_VEC func_list){
    NODE out = make_ast_node();
    out->t = ATTRS_NODE;
    out->data.attrs_data.attr_list = attr_list;
    out->data.attrs_data.func_list = func_list;
    return out;
}

static inline NODE make_struct_or_object(char* id, NODE attrs, int is_struct){
    NODE out = make_ast_node();
    if (is_struct){
        out->t = STRUCT_NODE;
    } else{
        out->t = OBJECT_NODE;
    }

    out->data.struct_or_object_data.is_template = 0;
    out->data.struct_or_object_data.id = id;
    out->data.struct_or_object_data.attrs = attrs;
    out->data.struct_or_object_data.specialize = NULL;
    return out;
}

static inline NODE make_struct_or_object_template(char* id, NODE attrs, NODE specialize, int is_struct){
    NODE out = make_ast_node();
    if (is_struct){
        out->t = STRUCT_NODE;
    } else{
        out->t = OBJECT_NODE;
    }

    out->data.struct_or_object_data.is_template = 1;
    out->data.struct_or_object_data.id = id;
    out->data.struct_or_object_data.attrs = attrs;
    out->data.struct_or_object_data.specialize = specialize;
    return out;
}

NODE make_struct(char* id, NODE attrs){
    return make_struct_or_object(id,attrs,1);
}

NODE make_struct_template(char* id, NODE attrs, NODE specialize){
    return make_struct_or_object_template(id,attrs,specialize,1);
}

NODE make_object(char* id, NODE attrs){
    return make_struct_or_object(id,attrs,0);
}

NODE make_object_template(char* id, NODE attrs, NODE specialize){
    return make_struct_or_object_template(id,attrs,specialize,0);
}
