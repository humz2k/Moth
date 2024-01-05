#ifndef _LISTS_H_
#define _LISTS_H_

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>
#include "parser/ast.h"

//#include "../values_llvm.h"

#define list_t LLVMValueRef
#include "generic_list/generic_list_header.h"
#undef list_t

#define list_t LLVMTypeRef
#include "generic_list/generic_list_header.h"
#undef list_t

#define list_t NODE
#include "generic_list/generic_list_header.h"
#undef list_t

#endif
