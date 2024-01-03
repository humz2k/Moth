#ifndef _BLOCK_H_
#define _BLOCK_H_

#include "ast_node.h"

struct block_node{
    NODE_VEC statements;
};

NODE make_block(NODE_VEC statements);

#endif
