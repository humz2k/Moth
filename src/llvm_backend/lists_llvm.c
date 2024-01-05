
#include "lists_llvm.h"
#include "parser/ast.h"
//#include "../values_llvm.h"

#define list_t LLVMValueRef
#include "generic_list/generic_list.h"
#undef list_t

#define list_t LLVMTypeRef
#include "generic_list/generic_list.h"
#undef list_t

#define list_t NODE
#include "generic_list/generic_list.h"
#undef list_t
