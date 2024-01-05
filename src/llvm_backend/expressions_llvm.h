#ifndef _EXPRESSIONS_LLVM_H_
#define _EXPRESSIONS_LLVM_H_

#include "parser/ast.h"

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>

#include "tables/tables_llvm.h"

LLVMValueRef generate_expr(NODE line);

#endif