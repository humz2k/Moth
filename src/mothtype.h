#ifndef _MOTH_MOTHTYPE_H_
#define _MOTH_MOTHTYPE_H_

#include <llvm-c/Core.h>

enum moth_type_id{
    I1,
    I8,
    I16,
    I32,
    I64,
    F16,
    F32,
    F64,
    MOTH_STRING,
    MOTH_OBJECT,
    MOTH_STRUCT,
    MOTH_ARRAY
};

struct moth_type;

enum moth_type_id get_moth_type_id(struct moth_type);

LLVMTypeRef moth_type_to_llvm_type_ref(struct moth_type);

struct moth_type make_int_type(int width);

struct moth_type make_float_type(int width);

struct moth_type make_string_type(void);

struct moth_type make_array_type(struct moth_type, int ndims);

struct moth_type make_struct_type(struct moth_type* types, int ntypes);

struct moth_type make_object_type(struct moth_type* types, int ntypes);

#endif

