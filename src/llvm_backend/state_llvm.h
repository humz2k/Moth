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

extern moth_value_table local_variables;

extern moth_value_table global_variables;

extern NODE current_function_return_type;

const char* get_unused_var_name(void);

void reset_var_count(void);

moth_value find_variable(NODE var);

moth_value find_variable_from_str(const char* var);

#endif