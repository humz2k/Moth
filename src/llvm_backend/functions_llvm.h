#ifndef _FUNCTIONS_LLVM_H_
#define _FUNCTIONS_LLVM_H_

#include "parser/ast.h"

int generate_function(NODE func);

LLVMTypeRef get_function_type(NODE ret_type, NODE_VEC inputs);

#endif