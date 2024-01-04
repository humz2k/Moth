#include "moth_llvm.h"
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>
#include "gc.h"

LLVMBuilderRef builder;

const char* mangle_function_name(const char* name, NODE_VEC inputs){

    int n_inputs = len_node_vec(inputs);

    int len = strlen(name) + 2;

    char* strings[n_inputs];
    for (int i = 0; i < n_inputs; i++){
        strings[i] = type_to_string(type_of_declaration(get_node_vec_elem(inputs,i)));
        len += strlen(strings[i]) + 1;
    }

    char* out = GC_MALLOC(sizeof(char) * len);

    strcpy(out,name);

    strcat(out,"_");

    for (int i = 0; i < n_inputs; i++){
        strcat(out,strings[i]);
        strcat(out,"_");
    }

    return out;
}

LLVMTypeRef get_function_type(NODE type, NODE_VEC inputs){
    LLVMTypeRef ret_type = type_to_llvm(type);
    int n_inputs = len_node_vec(inputs);
    LLVMTypeRef param_types[n_inputs];

    for (int i = 0; i < n_inputs; i++){
        param_types[i] = type_to_llvm(type_of_declaration(get_node_vec_elem(inputs,i)));
    }

    LLVMTypeRef out = LLVMFunctionType(ret_type,param_types,n_inputs,0);

    return out;

}

LLVMValueRef make_llvm_function(char* name, NODE ret_type, NODE_VEC inputs){
    LLVMTypeRef func_ty = get_function_type(ret_type,inputs);

    const char* mangled_name = mangle_function_name(name,inputs);

    LLVMValueRef func = LLVMAddFunction(mod,mangled_name,func_ty);

    return func;
}

int generate_function(NODE func){

    printf("GENERATING FUNCTION!\n");

    assert(func->t == FUNCTION_NODE);

    struct function_node data = func->data.function_data;

    LLVMValueRef func_ref = make_llvm_function(data.id,data.ret_type,data.inputs);

    LLVMBasicBlockRef entry = LLVMAppendBasicBlock(func_ref,"entry");

    builder = LLVMCreateBuilder();

    LLVMPositionBuilderAtEnd(builder,entry);

    

    return 0;
}