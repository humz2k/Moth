#ifndef _MOTH_VALUE_H_
#define _MOTH_VALUE_H_

#include "parser/ast.h"

//#include "state_llvm.h"

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

MOTH_VALUE make_moth_file(const char* name);

int update_moth_file(MOTH_VALUE moth_file, const char* name, MOTH_VALUE value);

int find_in_moth_file(MOTH_VALUE moth_file, const char* name, MOTH_VALUE* out);

#endif
