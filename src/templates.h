#ifndef _TEMPLATES_H_
#define _TEMPLATES_H_

#include "ast_node.h"

struct template_node{
    char* id;
    NODE_VEC type_list;
    NODE_VEC comp_unit_list;
};

NODE make_template(char* id, NODE_VEC type_list, NODE_VEC comp_unit_list);

#endif
