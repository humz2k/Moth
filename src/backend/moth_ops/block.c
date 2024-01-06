#include "backend/interface.h"
#include "backend/file_table.h"
#include "error.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "simple_alloc.h"

MOTH_VALUE eval_block(NODE block){
    assert(block != NULL);
    assert(block->t == BLOCK_NODE);
    struct block_node data = block->data.block_data;
    NODE_VEC statements = data.statements;
    int n_statements = len_node_vec(statements);
    MOTH_VALUE last;
    for (int i = 0; i < n_statements; i++){
        NODE statement = get_node_vec_elem(statements,i);
        last = eval(statement);
    }
    return last;
}