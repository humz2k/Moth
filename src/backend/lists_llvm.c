
#include "lists_llvm.h"
#include "parser/ast.h"
//#include "../values_llvm.h"

#define list_t MOTH_FIELD
#include "generic_list/generic_list.h"
#undef list_t

#define list_t MOTH_TYPE
#include "generic_list/generic_list.h"
#undef list_t

#define list_t MOTH_VALUE
#include "generic_list/generic_list.h"
#undef list_t

