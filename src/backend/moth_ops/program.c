#include "backend/interface.h"
#include "backend/file_table.h"
#include "error.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "simple_alloc.h"

MOTH_VALUE eval_program(NODE program){
    assert(program != NULL);
    assert(program->t == PROGRAM_NODE);
    MOTH_VALUE prev_moth_file = get_active_moth_file();
    
    assert(create_new_moth_file(program->moth_file));

    NODE_VEC nodes = program->data.program_data.comp_unit_list;

    int n_nodes = len_node_vec(nodes);

    for (int i = 0; i < n_nodes; i++){
        eval(get_node_vec_elem(nodes,i));
    }

    MOTH_VALUE this_moth_file = get_active_moth_file();

    assert(set_active_moth_file(prev_moth_file));

    return this_moth_file;
}