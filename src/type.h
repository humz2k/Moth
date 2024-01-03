#ifndef _TYPE_H_
#define _TYPE_H_

#include "ast_node.h"

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
    TY_ID,
    TY_REF
};

struct type_node{
    enum type_type t;
    NODE ref;
    char* id;
    NODE base;
    NODE specialize;
};

NODE make_base_type(enum type_type t);

NODE make_template_type(NODE base, NODE specialize);

NODE make_user_type(char* id);

NODE make_ref_type(NODE ref);

#endif
