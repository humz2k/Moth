#include "ast.h"

NODE make_template(char* id, NODE_VEC type_list, NODE_VEC comp_unit_list){
    NODE out = make_ast_node();
    out->t = TEMPLATE_NODE;
    out->data.template_data.id = id;
    out->data.template_data.type_list = type_list;
    out->data.template_data.comp_unit_list = comp_unit_list;
    return out;
}
