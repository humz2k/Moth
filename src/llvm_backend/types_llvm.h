#ifndef _TYPES_LLVM_H_
#define _TYPES_LLVM_H_

#include "ast.h"

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>

const char* type_to_string(NODE type);

NODE type_of_declaration(NODE decl);

LLVMTypeRef type_to_llvm(NODE type);

#endif
