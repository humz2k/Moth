#include "moth_llvm.h"
#include "backend/file_table.h"

static int n_vars = 0;

const char* get_unused_var_name(void){
    int len = (n_vars/10) + 3;
    char* out = GC_MALLOC(sizeof(char) * len);
    sprintf(out,"%d",n_vars);
    n_vars++;
    return out;
}

int is_variable(MOTH_VALUE val){
    assert(val != NULL);
    int out = val->t == VARIABLE;
    if (out){
        assert(val->value != NULL);
    }
    return out;
}

MOTH_VALUE declare_local_variable(const char* name, MOTH_VALUE type){
    LLVMBuilderRef builder = get_builder();

    LLVMTypeRef local_var_type = moth_value_to_llvm_type(type);
    
    LLVMValueRef var_ptr = LLVMBuildAlloca(builder,local_var_type,get_unused_var_name());

    MOTH_VALUE out = make_moth_value();

    out->t = VARIABLE;
    out->type = val_to_type(type);
    out->declared = 1;
    out->modifiable = 1;
    out->scope = LOCAL_SCOPE;
    out->value = var_ptr;
    out->moth_file = NULL;

    update_local_variables(name,out);

    return out;
}

int set_local_variable(MOTH_VALUE var, MOTH_VALUE value){
    assert(is_variable(var));
    assert(is_constant(value));
    if (types_equal(var->type,value->type)){
        LLVMValueRef var_ptr = var->value;
        LLVMValueRef llvm_value = value->value;
        LLVMBuilderRef builder = get_builder();
        LLVMBuildStore(builder,llvm_value,var_ptr);
        return 1;
    }
    NOT_IMPLEMENTED;
}

