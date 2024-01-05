#include "parser/ast.h"
#include <stdlib.h>
#include <assert.h>

static NODE program_start = NULL;

NODE make_program(NODE_VEC comp_unit_list){
    assert(program_start == NULL);

    NODE out = make_ast_node();
    out->t = PROGRAM_NODE;
    out->data.program_data.comp_unit_list = comp_unit_list;

    program_start = out;

    return out;
}

NODE get_program(void){
    assert(program_start != NULL);
    return program_start;
}