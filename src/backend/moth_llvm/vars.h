#ifndef _MOTH_LLVM_VARS_H_
#define _MOTH_LLVM_VARS_H_

#include "moth_llvm_type_defs.h"
#include "moth_llvm_state.h"

const char* get_unused_var_name(void);

int is_variable(MOTH_VALUE val);

#endif