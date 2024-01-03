
#ifndef _REFS_H_
#define _REFS_H_

#include "ast_node.h"

struct reference_node{
    int ref_base;
    char* left;
    char* right;
    NODE ref;
};

NODE make_ref_base(char* left, char* right);
NODE make_ref_ref(NODE ref, char* right);

#endif
