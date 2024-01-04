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

int eval_top_level(NODE unit){
    
    switch (unit->t){
        case FUNCTION_NODE:
            generate_function(unit);
            return 0;
        default:
            return 1;
    }

    return 0;
}

int compile(void){
    assert(program_start->t == PROGRAM_NODE);

    LLVMModuleRef mod = LLVMModuleCreateWithName("my_module");

    NODE_VEC comp_unit_list = program_start->data.program_data.comp_unit_list;

    int n_units = len_node_vec(comp_unit_list);
    printf("n_units = %d\n",n_units);

    for (int i = 0; i < n_units; i++){
        NODE unit = get_node_vec_elem(comp_unit_list,i);
        eval_top_level(unit);
    }

    char *moduleStr = LLVMPrintModuleToString(mod);
    printf("%s\n", moduleStr);

    LLVMDisposeMessage(moduleStr);
    LLVMDisposeModule(mod);

    return 0;
}
