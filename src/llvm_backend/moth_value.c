#include "moth_llvm.h"

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "error.h"
#include <assert.h>
#include "tables_llvm.h"
#include "simple_alloc.h"

struct moth_llvm_value{
    VALUE_TYPE t;
    MOTH_TYPE type;
    LLVMValueRef value;
    enum scope_t scope;
    int modifiable;
    char* moth_file;
    MOTH_VALUE_table table;
};

#define check_val(val) { assert(val != NULL); assert((val->modifiable == 0) || (val->modifiable == 1)); }

MOTH_VALUE make_moth_file(const char* name){
    MOTH_VALUE out;
    VERIFY_ALLOC(out = alloc_struct_ptr(struct moth_llvm_value));
    out->t = MOTH_FILE;
    out->type = NULL;
    out->modifiable = 0;
    out->value = NULL;
    out->scope = FILE_SCOPE;
    out->moth_file = name;
    out->table = make_MOTH_VALUE_table();
    return out;
}

MOTH_VALUE_table get_table(MOTH_VALUE moth_file){
    assert(moth_file->t == MOTH_FILE);
    assert(moth_file->table != NULL);
    return moth_file->table;
}

int update_moth_file(MOTH_VALUE moth_file, const char* name, MOTH_VALUE value){
    return update_MOTH_VALUE_table(get_table(moth_file),name,value);
}

int find_in_moth_file(MOTH_VALUE moth_file, const char* name, MOTH_VALUE* out){
    return get_MOTH_VALUE_table(get_table(moth_file),name,out);
}

VALUE_TYPE get_type_of_value(MOTH_VALUE val){
    check_val(val);
    return val->t;
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
