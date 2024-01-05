
#include "tables_llvm.h"
#include "parser/ast.h"
//#include "../values_llvm.h"

#define table_t LLVMValueRef
#include "generic_table/generic_table.h"
#undef table_t

/*#define table_t moth_value
#include "generic_table/generic_table.h"
#undef table_t*/

#define table_t LLVMTypeRef
#include "generic_table/generic_table.h"
#undef table_t

#define table_t NODE
#include "generic_table/generic_table.h"
#undef table_t
