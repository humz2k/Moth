#ifndef _LISTS_LLVM_H_
#define _LISTS_LLVM_H_

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>
#include "parser/ast.h"
#include "type_definitions.h"

//#include "../values_llvm.h"

#define list_t MOTH_FIELD
#include "generic_list/generic_list_header.h"
#undef list_t

#define list_t MOTH_TYPE
#include "generic_list/generic_list_header.h"
#undef list_t

#define list_t MOTH_VALUE
#include "generic_list/generic_list_header.h"
#undef list_t

#endif
