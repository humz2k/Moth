#ifndef _FUNCTIONS_LLVM_H_
#define _FUNCTIONS_LLVM_H_

#include "parser/ast.h"

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>

#include "tables/tables_llvm.h"

int generate_function(NODE func);

LLVMTypeRef get_function_type(NODE ret_type, NODE_VEC inputs);

const char* mangle_function_name(const char* name, NODE_VEC inputs);

LLVMTypeRef get_function_type(NODE type, NODE_VEC inputs);

LLVMValueRef make_llvm_function(char* name, NODE ret_type, NODE_VEC inputs);

LLVMValueRef generate_return(NODE ret);

#endif