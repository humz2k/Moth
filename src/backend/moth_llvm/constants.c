#include "moth_llvm.h"

int is_constant(MOTH_VALUE val){
    assert(val != NULL);
    return val->t == CONSTANT;
}

MOTH_VALUE wrap_local_constant(LLVMValueRef llvm_value, MOTH_VALUE type){

    MOTH_VALUE out = make_moth_value();

    out->t = CONSTANT;
    out->type = val_to_type(type);
    out->declared = 1;
    out->modifiable = 0;
    out->scope = LOCAL_SCOPE;
    out->value = llvm_value;
    out->moth_file = NULL;

    return out;
}