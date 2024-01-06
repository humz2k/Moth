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
#include "simple_alloc.h"

#include "gc.h"
#include "file_table.h"
#include "backend/interface.h"

/*

int in_function(void){
    assert((_in_function == 0) || (_in_function == 1));
    return _in_function;
}

VALUE_TYPE get_type_of_value(MOTH_VALUE val){
    check_val(val);
    return val->t;
}

static LLVMTypeRef _initialize_function(MOTH_TYPE func_ty){
    assert(func_ty != NULL);
    assert(func_ty->t == TY_FUNC);

    LLVMTypeRef out = moth_type_to_llvm_type(func_ty);

    return out;
}

int initialize_function_declaration(MOTH_VALUE func_ty){
    assert(func_ty != NULL);
    assert(func_ty->t == TYPE);
    assert(func_ty->type != NULL);
    return (_initialize_function(func_ty->type) != NULL);
}

int initialize_function_definition(MOTH_VALUE func_ty){
    assert(func_ty != NULL);
    assert(func_ty->t == TYPE);
    assert(func_ty->type != NULL);
    assert(in_function() == 0);
    assert(builder == NULL);
    LLVMTypeRef llvm_func_ty = _initialize_function(func_ty);
    return 1;
}

/*
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
}*/
