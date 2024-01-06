#ifndef _MOTH_LLVM_TYPES_H_
#define _MOTH_LLVM_TYPES_H_

#include "moth_llvm_type_defs.h"
#include "moth_llvm_state.h"

int is_func_ty(MOTH_VALUE value);

MOTH_TYPE val_to_type(MOTH_VALUE val);
MOTH_VALUE type_to_val(MOTH_TYPE typ);
MOTH_TYPE val_to_func_ty(MOTH_VALUE val);
LLVMTypeRef moth_value_to_llvm_type(MOTH_VALUE value);
LLVMTypeRef moth_type_to_llvm_function_type(MOTH_TYPE value);
int types_equal(MOTH_TYPE left_type, MOTH_TYPE right_type);

#endif