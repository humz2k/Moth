#ifndef _MOTH_LLVM_FUNCTIONS_H_
#define _MOTH_LLVM_FUNCTIONS_H_

#include "moth_llvm_type_defs.h"
#include "moth_llvm_state.h"

int is_function(MOTH_VALUE func);

int function_is_declared(MOTH_VALUE func);

#endif