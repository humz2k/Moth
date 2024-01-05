#include "moth_llvm.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "error.h"
#include <assert.h>

struct moth_llvm_value{
    MOTH_TYPE type;
    LLVMValueRef value;
    enum scope_t scope;
    int modifiable;
    char* moth_file;
};

#define check_val(val) { assert(val != NULL); assert(val->type != NULL); assert(val->moth_file != NULL); assert((val->modifiable == 0) || (val->modifiable == 1)); }

MOTH_TYPE get_type_of_value(MOTH_VALUE val){
    check_val(val);
    return val->type;
}

LLVMValueRef get_llvm_value_of_value(MOTH_VALUE val){
    check_val(val);
    return val->value;
}

enum scope_t get_scope_of_value(MOTH_VALUE val){
    check_val(val);
    return val->scope;
}

int value_is_local_scope(MOTH_VALUE val){
    return get_scope_of_value(val) == LOCAL_SCOPE;
}

int value_is_file_scope(MOTH_VALUE val){
    return get_scope_of_value(val) == FILE_SCOPE;
}

int value_is_modifiable(MOTH_VALUE val){
    check_val(val);
    return val->modifiable;
}
