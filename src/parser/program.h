#ifndef _PROGRAM_H_
#define _PROGRAM_H_

#include "parser/ast_node.h"

struct program_node{
    NODE_VEC comp_unit_list;
};

NODE make_program(NODE_VEC comp_unit_list);

#endif
