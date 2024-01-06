#ifndef _TYPE_DEFS_H_
#define _TYPE_DEFS_H_

struct moth_llvm_type;
typedef struct moth_llvm_type* MOTH_TYPE;
struct moth_llvm_field;
typedef struct moth_llvm_field* MOTH_FIELD;
struct moth_structure_descriptor;
typedef struct moth_structure_descriptor* MOTH_STRUCTURE;
struct moth_func_descriptor;
typedef struct moth_func_descriptor* MOTH_FUNC_TYPE;
struct moth_llvm_value;
typedef struct moth_llvm_value* MOTH_VALUE;

#define table_t MOTH_VALUE
#include "generic_table/generic_table_header.h"
#undef table_t

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