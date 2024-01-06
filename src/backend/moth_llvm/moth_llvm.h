#ifndef _MOTH_LLVM_H_
#define _MOTH_LLVM_H_

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>

#include "moth_llvm_type_defs.h"
#include "moth_llvm_state.h"

const char* get_unused_var_name(void);

int is_function(MOTH_VALUE func);
int is_func_ty(MOTH_VALUE value);
int is_variable(MOTH_VALUE val);
int is_constant(MOTH_VALUE val);

MOTH_VALUE wrap_local_constant(LLVMValueRef llvm_value, MOTH_VALUE type);

LLVMModuleRef get_module(void);

MOTH_TYPE val_to_type(MOTH_VALUE val);
MOTH_VALUE type_to_val(MOTH_TYPE typ);
MOTH_TYPE val_to_func_ty(MOTH_VALUE val);
LLVMTypeRef moth_value_to_llvm_type(MOTH_VALUE value);
LLVMTypeRef moth_type_to_llvm_function_type(MOTH_TYPE value);
int types_equal(MOTH_TYPE left_type, MOTH_TYPE right_type);

int clear_moth_file(MOTH_VALUE moth_file);

int function_is_declared(MOTH_VALUE func);

LLVMBuilderRef get_builder(void);

int init_builder(void);

int delete_builder(void);

#endif