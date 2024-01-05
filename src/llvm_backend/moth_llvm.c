#include "moth_llvm.h"

#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

#include <assert.h>

LLVMModuleRef mod;

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

    mod = LLVMModuleCreateWithName("my_module");

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

    char *error = NULL;
    LLVMVerifyModule(mod, LLVMAbortProcessAction, &error);
    LLVMDisposeMessage(error);


    //JIT STUFF

    LLVMExecutionEngineRef engine;
    error = NULL;
    LLVMLinkInMCJIT();
    LLVMInitializeNativeTarget();
    LLVMInitializeNativeAsmPrinter();
    if (LLVMCreateExecutionEngineForModule(&engine, mod, &error) != 0) {
        fprintf(stderr, "failed to create execution engine\n");
        abort();
    }
    if (error) {
        fprintf(stderr, "error: %s\n", error);
        LLVMDisposeMessage(error);
        exit(EXIT_FAILURE);
    }

    double (*sum_func)(int, int) = (double (*)(int, int))LLVMGetFunctionAddress(engine, "test_i32_i32_");
    printf("%g\n", sum_func(0,0));

    LLVMDisposeExecutionEngine(engine);
    //LLVMDisposeModule(mod);

    return 0;
}
