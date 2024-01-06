#ifndef _MOTH_LLVM_H_
#define _MOTH_LLVM_H_

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>

#include "moth_llvm_type_defs.h"
#include "moth_llvm_state.h"

MOTH_TYPE val_to_type(MOTH_VALUE val);

MOTH_VALUE type_to_val(MOTH_TYPE typ);

MOTH_VALUE val_to_func_ty(MOTH_VALUE val);

LLVMTypeRef moth_value_to_llvm_type(MOTH_VALUE value);

LLVMTypeRef moth_value_to_llvm_function_type(MOTH_VALUE value);

int function_is_declared(MOTH_VALUE func);

#endif