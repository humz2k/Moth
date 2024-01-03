#include "moth_llvm.h"

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>

#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

#include <assert.h>

int compile(void){
    assert(program_start->t == PROGRAM_NODE);

    LLVMModuleRef mod = LLVMModuleCreateWithName("my_module");

    NODE_VEC comp_unit_list = program_start->data.program_data.comp_unit_list;

    int n_units = len_node_vec(comp_unit_list);
    printf("n_units = %d\n",n_units);

    return 0;
}
