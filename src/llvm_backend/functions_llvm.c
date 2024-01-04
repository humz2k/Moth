#include "moth_llvm.h"
#include <stdlib.h>
#include <stdio.h>

int generate_function(NODE func){

    assert(func->t == FUNCTION_NODE);

    struct function_node data = func->data.function_data;

    

    printf("GENERATING FUNCTION!\n");

    return 0;
}