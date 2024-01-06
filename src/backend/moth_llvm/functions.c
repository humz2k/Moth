#include "moth_llvm.h"
#include "backend/interface.h"
#include <stdlib.h>
#include <stdio.h>
#include "error.h"
#include <string.h>
#include <assert.h>
#include "simple_alloc.h"
#include "backend/file_table.h"

static MOTH_VALUE current_function = NULL;

MOTH_VALUE get_current_function(void){
    assert(current_function != NULL);
    assert(is_function(current_function));
    return current_function;
}

static inline const char* _mangle_function_name(const char* moth_file_name, const char* name, MOTH_VALUE_list inputs){

    assert(moth_file_name != NULL);
    assert(name != NULL);
    assert(inputs != NULL);

    int n_inputs = len_MOTH_VALUE_list(inputs);

    int len = strlen(moth_file_name) + strlen(name) + 5;

    const char* strings[n_inputs];
    for (int i = 0; i < n_inputs; i++){
        MOTH_VALUE val = get_MOTH_VALUE_list(inputs,i);
        const char* tmp = type_to_string(val);
        strings[i] = tmp;
        len += strlen(strings[i]) + 1;
    }

    char* out = GC_MALLOC(sizeof(char) * len);

    strcpy(out,moth_file_name);

    strcat(out,"_");

    strcat(out,name);

    strcat(out,"_");

    for (int i = 0; i < n_inputs; i++){
        strcat(out,strings[i]);
        strcat(out,"_");
    }

    return out;
}

const char* mangle_function_name(MOTH_VALUE func){
    assert(is_function(func));
    MOTH_TYPE type = func->type;
    return _mangle_function_name(type->moth_file,type->func_ty->name,type->func_ty->inputs);
}

int is_function(MOTH_VALUE func){
    assert(func != NULL);
    return func->t == FUNCTION;
}

int function_is_declared(MOTH_VALUE func){
    assert(is_function(func));
    assert((func->declared == 0) || (func->declared == 1));
    if (func->declared){
        assert(func->value != NULL);
    }
    return func->declared;
}

int function_is_initialized(MOTH_VALUE func){
    assert(is_function(func));
    assert((func->declared == 0) || (func->declared == 1));
    assert((func->initialized == 0) || (func->initialized == 1));
    return func->initialized;
}

MOTH_VALUE init_function(MOTH_VALUE func_ty){
    assert(is_func_ty(func_ty));
    //LLVMTypeRef llvm_func_ty = moth_value_to_llvm_function_type(func_ty);
    //const char* name = mangle_function_name(func_ty);
    //LLVMValueRef func = LLVMAddFunction(get_module(),name,llvm_func_ty);
    
    MOTH_VALUE out = make_moth_value();
    out->t = FUNCTION;
    out->type = func_ty->type;
    out->modifiable = 0;
    out->value = NULL;
    out->scope = FILE_SCOPE;
    out->moth_file = func_ty->moth_file;
    out->declared = 0;
    out->initialized = 0;
    return out;
}

int declare_function(MOTH_VALUE func){
    assert(is_function(func));
    assert(!function_is_declared(func));
    assert(func->type != NULL);
    LLVMTypeRef llvm_func_ty = moth_type_to_llvm_function_type(func->type);
    const char* name = mangle_function_name(func);
    LLVMValueRef llvm_func = LLVMAddFunction(get_module(),name,llvm_func_ty);
    func->value = llvm_func;
    func->declared = 1;
    return 1;
}

int init_builder_in_function(MOTH_VALUE func){
    assert(is_function(func));
    assert(!function_is_initialized(func));
    assert(function_is_declared(func));
    assert(current_function == NULL);

    LLVMValueRef llvm_func = func->value;

    LLVMBasicBlockRef entry = LLVMAppendBasicBlock(llvm_func,"entry");

    assert(init_builder());
    LLVMBuilderRef builder = get_builder();

    LLVMPositionBuilderAtEnd(builder,entry);
    current_function = func;

    func->initialized = 1;

    return 1;
}

int finalize_builder_in_function(void){
    assert(get_current_function() != NULL);
    current_function = NULL;
    delete_builder();
    return 1;
}

MOTH_VALUE get_argument(MOTH_VALUE func, int idx){
    assert(is_function(func));
    assert(function_is_declared(func));
    assert(function_is_initialized(func));

    LLVMValueRef llvm_func = func->value;

    LLVMValueRef argument = LLVMGetParam(llvm_func,idx);

    MOTH_TYPE func_ty = func->type;

    MOTH_VALUE_list func_inputs = func_ty->func_ty->inputs;

    MOTH_VALUE arg_type = get_MOTH_VALUE_list(func_inputs,idx);

    return wrap_local_constant(argument,arg_type);

}