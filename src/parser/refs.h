
#ifndef _REFS_H_
#define _REFS_H_

#include "parser/ast_node.h"

struct reference_node{
    int ref_base;
    char* left;
    char* right;
    NODE ref;
};

NODE make_ref_base(char* left, char* right);
NODE make_ref_ref(NODE ref, char* right);

struct index_node{
    NODE expr;
    NODE_VEC idxs;
};

NODE make_index(NODE expr, NODE_VEC idxs);

#endif
