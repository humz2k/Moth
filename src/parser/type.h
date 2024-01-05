#ifndef _TYPE_H_
#define _TYPE_H_

#include "parser/ast_node.h"

enum type_type{
    TY_I1,
    TY_I8,
    TY_I16,
    TY_I32,
    TY_I64,
    TY_F16,
    TY_F32,
    TY_F64,
    TY_STR,
    TY_VOID,
    TY_TEMPLATE,
    TY_USER,
    TY_REF,
    TY_ARRAY,
    TY_FUNC,
    TY_MOTH_FILE
};

struct type_node{
    enum type_type t;
    NODE ref;
    char* id;
    NODE base;
    NODE specialize;
    int ndims;
};

NODE make_base_type(enum type_type t);

NODE make_template_type(NODE base, NODE specialize);

NODE make_user_type(char* id);

NODE make_ref_type(NODE ref);

NODE make_array_type(NODE base, int ndims);

#endif
