#ifndef _TABLES_H_
#define _TABLES_H_

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>
#include "parser/ast.h"

#include "../values_llvm.h"

#define table_t LLVMValueRef
#include "generic_table/generic_table_header.h"
#undef table_t

#define table_t moth_value
#include "generic_table/generic_table_header.h"
#undef table_t

#define table_t LLVMTypeRef
#include "generic_table/generic_table_header.h"
#undef table_t

#define table_t NODE
#include "generic_table/generic_table_header.h"
#undef table_t

#endif