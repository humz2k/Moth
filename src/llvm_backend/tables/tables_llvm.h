#ifndef _TABLES_H_
#define _TABLES_H_

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>

#define table_t LLVMValueRef
#include "generic_table/generic_table_header.h"
#undef table_t

#endif