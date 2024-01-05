
#include "tables_llvm.h"

#define table_t LLVMValueRef
#include "generic_table/generic_table.h"
#undef table_t

#define table_t LLVMTypeRef
#include "generic_table/generic_table.h"
#undef table_t