#ifndef _TYPE_DEFS_H_
#define _TYPE_DEFS_H_

typedef const char* string_t;

enum scope_t{
    LOCAL_SCOPE,
    FILE_SCOPE
};

typedef enum {
    VARIABLE,
    CONSTANT,
    TYPE,
    FUNCTION,
    MOTH_FILE
} VALUE_TYPE;

typedef struct {
    int is_inline;
    int is_extern;
} MODIFIERS;

struct moth_type;
typedef struct moth_type* MOTH_TYPE;
struct moth_field;
typedef struct moth_field* MOTH_FIELD;
struct moth_structure_descriptor;
typedef struct moth_structure_descriptor* MOTH_STRUCTURE;
struct moth_func_descriptor;
typedef struct moth_func_descriptor* MOTH_FUNC_TYPE;
struct moth_value;
typedef struct moth_value* MOTH_VALUE;

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

#define list_t string_t
#include "generic_list/generic_list_header.h"
#undef list_t

#endif