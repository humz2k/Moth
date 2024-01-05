#include "moth_llvm.h"
#include "gc.h"
#include <stdlib.h>
#include <assert.h>
#include <stdio.h>

static int n_vars;

LLVMBuilderRef builder;

LLVMValueRef_table local_variables;

NODE_table template_context = NULL;

NODE current_function_return_type = NULL;

void reset_var_count(void){
    n_vars = 0;
}

const char* get_unused_var_name(void){
    int len = (n_vars/10) + 3;
    char* out = GC_MALLOC(sizeof(char) * len);
    sprintf(out,"%d",n_vars);
    n_vars++;
    return out;
}