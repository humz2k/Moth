#include <stdlib.h>
#include <stdio.h>
#include "mothtype.h"
#include "error.h"

struct moth_struct_object_params{
    struct moth_type* types;
    int nitems;
};

struct moth_array_params{
    struct moth_type* type;
    int ndims;
};

union moth_type_params{
    struct moth_struct_object_params struct_object;
    struct moth_array_params array;
};

struct moth_type{
    enum moth_type_id id;
    union moth_type_params params;
};

enum moth_type_id get_moth_type_id(struct moth_type type){
    return type.id;
}

static LLVMTypeRef make_llvm_array_type(struct moth_array_params params){
    PANIC("make_llvm_array_type not implemented\n");
}

static LLVMTypeRef make_llvm_struct_type(struct moth_struct_object_params params){
    assert(params.types);
    assert(params.nitems > 0);

    LLVMTypeRef* items;

    CHECK_PTR(items = malloc(sizeof(LLVMTypeRef) * params.nitems));

    for (int i = 0; i < params.nitems; i++){
        items[i] = moth_type_to_llvm_type_ref(params.types[i]);
    }

    LLVMTypeRef out = LLVMStructType(items,params.nitems,0);

    return out;
}

LLVMTypeRef moth_type_to_llvm_type_ref(struct moth_type type){
    switch (type.id){
        case I1:
            return LLVMInt1Type();
        case I8:
            return LLVMInt8Type();
        case I16:
            return LLVMInt16Type();
        case I32:
            return LLVMInt32Type();
        case I64:
            return LLVMInt64Type();
        case F16:
            return LLVMHalfType();
        case F32:
            return LLVMFloatType();
        case F64:
            return LLVMDoubleType();
        case MOTH_STRING:
            return LLVMPointerType(LLVMInt8Type(),0);
        case MOTH_STRUCT:
            return make_llvm_struct_type(type.params.struct_object);
        case MOTH_OBJECT:
            return LLVMPointerType(make_llvm_struct_type(type.params.struct_object),0);
        case MOTH_ARRAY:
            return make_llvm_array_type(type.params.array);
    }
    PANIC("Unmatched type(?)\n");
}

static struct moth_type make_empty_type(void){
    struct moth_type out;
    out.params.array.type = NULL;
    out.params.struct_object.types = NULL;
    return out;
}

int free_moth_type(struct moth_type type){
    switch(type.id){
        case MOTH_STRUCT:
            CHECK_PTR(type.params.struct_object.types);
            if (!(type.params.struct_object.types))
                return 1;
            free(type.params.struct_object.types);
            return 0;
        case MOTH_OBJECT:
            CHECK_PTR(type.params.struct_object.types);
            if (!(type.params.struct_object.types))
                return 1;
            free(type.params.struct_object.types);
            return 0;
        case MOTH_ARRAY:
            CHECK_PTR(type.params.array.type);
            if (!(type.params.array.type))
                return 1;
            free(type.params.array.type);
            return 0;
        default:
            return 0;
    }
}

struct moth_type make_int_type(int width){
    struct moth_type out = make_empty_type();
    switch (width){
        case 1:
            out.id = I1;
            break;
        case 8:
            out.id = I8;
            break;
        case 16:
            out.id = I16;
            break;
        case 32:
            out.id = I32;
            break;
        case 64:
            out.id = I64;
            break;
        default:
            PANIC("Int type invalid!\n");
    }
    return out;
}

struct moth_type make_float_type(int width){
    struct moth_type out = make_empty_type();
    switch (width){
        case 16:
            out.id = F16;
            break;
        case 32:
            out.id = F32;
            break;
        case 64:
            out.id = F64;
            break;
        default:
            PANIC("Float type invalid!\n");
    }
    return out;
}

struct moth_type make_string_type(void){
    struct moth_type out = make_empty_type();
    out.id = MOTH_STRING;
    return out;
}

struct moth_type make_array_type(struct moth_type type, int ndims){
    struct moth_type out = make_empty_type();
    out.id = MOTH_ARRAY;
    out.params.array.ndims = ndims;
    CHECK_PTR(out.params.array.type = (struct moth_type*)malloc(sizeof(struct moth_type)));
    out.params.array.type[0] = type;
    return out;
}