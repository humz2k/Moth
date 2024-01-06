#ifndef _MOTH_LLVM_TYPE_DEFS_H_
#define _MOTH_LLVM_TYPE_DEFS_H_

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>

#include "backend/type_definitions.h"
#include "parser/ast.h"
#include "error.h"
#include "simple_alloc.h"

struct moth_value{
    VALUE_TYPE t;
    MOTH_TYPE type;
    LLVMValueRef value;
    enum scope_t scope;
    int modifiable;
    const char* moth_file;
    MOTH_VALUE_table table;
    string_t_list name_list;
    int declared;
};

struct moth_field{
    MOTH_TYPE type;
    char* name;
};

struct moth_structure_descriptor{
    char* name;
    MOTH_FIELD_list fields;
};

struct moth_func_descriptor{
    int named;
    char* name;
    MOTH_VALUE ret_type;
    MOTH_VALUE_list inputs;
    MODIFIERS mods;
};

struct moth_type{
    enum type_type t;
    const char* moth_file;
    const char* id;
    MOTH_STRUCTURE struct_descriptor;
    MOTH_TYPE base;
    MOTH_TYPE specialize;
    int ndims;
    MOTH_FUNC_TYPE func_ty;
};

static inline MOTH_VALUE make_moth_value(void){
    MOTH_VALUE out;
    VERIFY_ALLOC(out = alloc_struct_ptr(struct moth_value));
    return out;
}

static inline int undeclare_moth_value(MOTH_VALUE value){
    assert(value != NULL);
    value->declared = 0;
    return 1;
}

static inline MOTH_TYPE make_moth_type(void){
    MOTH_TYPE out;
    VERIFY_ALLOC(out = alloc_struct_ptr(struct moth_type));
    return out;
}

static inline int type_type_is_base(enum type_type t){
    switch (t){
        case TY_TEMPLATE:
            return 0;
        case TY_USER:
            return 0;
        case TY_REF:
            return 0;
        case TY_ARRAY:
            return 0;
        case TY_FUNC:
            return 0;
        case TY_MOTH_FILE:
            return 0;
        default:
            return 1;
    }
}

#endif