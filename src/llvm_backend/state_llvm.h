#ifndef _STATE_LLVM_H_
#define _STATE_LLVM_H_

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>

#include "parser/ast.h"

#include "tables/tables_llvm.h"

extern LLVMBuilderRef builder;

extern LLVMValueRef_table local_variables;

extern NODE current_function_return_type;

const char* get_unused_var_name(void);

void reset_var_count(void);

#endif