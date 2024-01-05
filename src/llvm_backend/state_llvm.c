#include "moth_llvm.h"
#include "gc.h"
#include <stdlib.h>
#include <assert.h>
#include <stdio.h>

static int n_vars;

LLVMBuilderRef builder;

moth_value_table global_variables = NULL;

moth_value_table local_variables = NULL;

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

moth_value find_variable(NODE var){
    assert(var->t == VAR_NODE);
    return find_variable_from_str(var->data.var_data.id);
}

moth_value find_variable_from_str(const char* var){
    assert(global_variables != NULL);

    if(local_variables != NULL){
        moth_value out;
        if(get_moth_value_table(local_variables,var,&out)){
            return out;
        }
    }
    moth_value out;
    if (get_moth_value_table(global_variables,var,&out)){
        return out;
    }
    
    throw_error("Variable %s not found\n",var);
}