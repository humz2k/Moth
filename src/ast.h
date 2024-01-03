#ifndef _AST_H_
#define _AST_H_

#include "ast_node.h"

#include "constants.h"

#include "binop.h"

#include "type.h"

#include "vars.h"

#include "refs.h"

union node_data{
    float r;
    int i;
    char* id;
    char* s;
    struct binop_node binop_data;
    struct type_node type_data;
    struct var_node var_data;
    struct declaration_node declaration_data;
    struct reference_node reference_data;
    struct assign_node assign_data;
};

struct ast_node{
    enum node_type t;
    union node_data data;
};

#endif
