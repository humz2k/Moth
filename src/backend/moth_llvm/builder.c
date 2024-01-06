#include "moth_llvm.h"

static LLVMBuilderRef builder = NULL;

LLVMBuilderRef get_builder(void){
    assert(builder != NULL);
    return builder;
}

int init_builder(void){
    assert(builder == NULL);
    builder = LLVMCreateBuilder();
    return 1;
}

int delete_builder(void){
    assert(builder != NULL);
    LLVMDisposeBuilder(builder);
    builder = NULL;
    return 1;
}