#ifndef _STRUCT_OBJECT_H_
#define _STRUCT_OBJECT_H_

#include "parser/ast_node.h"

struct attrs_node{
    NODE_VEC attr_list;
    NODE_VEC func_list;
};

NODE make_attrs(NODE_VEC attr_list, NODE_VEC func_list);

struct struct_or_object_node{
    int is_template;
    char* id;
    NODE specialize;
    NODE attrs;
};

NODE make_struct(char* id, NODE attrs);

NODE make_struct_template(char* id, NODE attrs, NODE specialize);

NODE make_object(char* id, NODE attrs);

NODE make_object_template(char* id, NODE attrs, NODE specialize);
#endif
