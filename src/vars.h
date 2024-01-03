
#ifndef _VARS_H_
#define _VARS_H_

#include "ast_node.h"

struct var_node{
    char* id;
};

NODE make_var(char* id);

struct declaration_node{
    NODE type;
    NODE var;
};

NODE make_decl(NODE type, NODE var);

struct assign_node{
    NODE left;
    NODE right;
};

NODE make_assign(NODE left, NODE right);

#endif
