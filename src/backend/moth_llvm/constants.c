#include "moth_llvm.h"
#include "backend/interface.h"

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

MOTH_VALUE make_long(long int val){
    LLVMValueRef out = LLVMConstInt(LLVMInt64Type(),val,1);
    return wrap_local_constant(out,type_node_to_type(make_base_type(TY_I64)));
}

MOTH_VALUE make_double(double val){
    LLVMValueRef out = LLVMConstReal(LLVMDoubleType(),val);
    return wrap_local_constant(out,type_node_to_type(make_base_type(TY_F64)));
}

MOTH_VALUE make_bool(int val){
    LLVMValueRef out = LLVMConstInt(LLVMInt1Type(),val,1);
    return wrap_local_constant(out,type_node_to_type(make_base_type(TY_I1)));
}