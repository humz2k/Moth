#ifndef _MOTH_LLVM_H_
#define _MOTH_LLVM_H_

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>

#include "parser/ast.h"

enum scope_t{
    LOCAL_SCOPE,
    FILE_SCOPE
};

typedef enum {
    VARIABLE,
    CONSTANT,
    TYPE,
    FUNCTION
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

#endif
