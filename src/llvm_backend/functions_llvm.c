#include "moth_llvm.h"
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>
#include "gc.h"
#include "tables/tables_llvm.h"

int n_vars;

void reset_var_count(void){
    n_vars = 0;
}

const char* get_unused_var_name(void){
    int len = (n_vars/10) + 3;
    char* out = GC_MALLOC(sizeof(char) * len);
    sprintf(out,"%d",len);
    return out;
}

LLVMBuilderRef builder;

LLVMValueRef_table local_variables;

const char* mangle_function_name(const char* name, NODE_VEC inputs){

    int n_inputs = len_node_vec(inputs);

    int len = strlen(name) + 2;

    const char* strings[n_inputs];
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

LLVMValueRef generate_return(NODE ret){
    assert(ret->t = RETURN_NODE);
    struct return_node data = ret->data.return_data;

    if(data.expr == NULL){
        return LLVMBuildRetVoid(builder);
    }

    LLVMValueRef out = generate_expr(data.expr);

    return LLVMBuildRet(builder,out);
}

int generate_block(NODE block){

    assert(block->t == BLOCK_NODE);

    struct block_node block_data = block->data.block_data;

    NODE_VEC statements = block_data.statements;

    int len_statements = len_node_vec(statements);

    for (int i = 0; i < len_statements; i++){
        NODE statement = get_node_vec_elem(statements,i);
        generate_expr(statement);
    }

    return 0;
}

int generate_function(NODE func){

    reset_var_count();

    printf("GENERATING FUNCTION!\n");

    assert(func->t == FUNCTION_NODE);

    struct function_node data = func->data.function_data;

    LLVMValueRef func_ref = make_llvm_function(data.id,data.ret_type,data.inputs);

    LLVMBasicBlockRef entry = LLVMAppendBasicBlock(func_ref,"entry");

    builder = LLVMCreateBuilder();

    LLVMPositionBuilderAtEnd(builder,entry);

    local_variables = make_LLVMValueRef_table();

    int n_inputs = len_node_vec(data.inputs);

    for (int i = 0; i < n_inputs; i++){
        NODE inp = get_node_vec_elem(data.inputs,i);
        assert(inp->t == DECLARATION_NODE);
        const char* var_name = var_to_string(inp->data.declaration_data.var);
        LLVMValueRef var_ptr = LLVMBuildAlloca(builder,type_to_llvm(type_of_declaration(inp)),get_unused_var_name());
        LLVMBuildStore(builder,LLVMGetParam(func_ref,i),var_ptr);
        insert_LLVMValueRef_table(local_variables,var_name,var_ptr);
    }

    generate_block(data.block);

    local_variables = NULL;

    return 0;
}