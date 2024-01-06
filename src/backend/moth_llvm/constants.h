#ifndef _MOTH_LLVM_CONSTANTS_H_
#define _MOTH_LLVM_CONSTANTS_H_

#include "moth_llvm_type_defs.h"
#include "moth_llvm_state.h"

int is_constant(MOTH_VALUE val);

MOTH_VALUE wrap_local_constant(LLVMValueRef llvm_value, MOTH_VALUE type);

#endif