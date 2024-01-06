#include "moth_llvm.h"
#include "backend/interface.h"
#include <stdlib.h>
#include <stdio.h>
#include "error.h"
#include <string.h>
#include <assert.h>
#include "simple_alloc.h"
#include "backend/file_table.h"

const char* type_to_string(MOTH_VALUE type){
    assert(type != NULL);
    assert(type->t == TYPE);
    switch(type->type->t){
        case TY_I1:
            return "i1";
        case TY_I8:
            return "i8";
        case TY_I16:
            return "i16";
        case TY_I32:
            return "i32";
        case TY_I64:
            return "i64";
        case TY_F16:
            return "f16";
        case TY_F32:
            return "f32";
        case TY_F64:
            return "f64";
        case TY_STR:
            return "str";
        case TY_VOID:
            return "void";
        default:
            NOT_IMPLEMENTED;
    }
}

MOTH_TYPE val_to_type(MOTH_VALUE val){
    assert(val != NULL);
    assert(val->type != NULL);
    assert(val->t == TYPE);
    return val->type;
}

MOTH_VALUE type_to_val(MOTH_TYPE typ){
    assert(typ != NULL);
    MOTH_VALUE out = make_moth_value();
    out->t = TYPE;
    out->moth_file = typ->moth_file;
    out->modifiable = 0;
    out->type = typ;
    return out;
}

MOTH_TYPE val_to_func_ty(MOTH_VALUE val){
    MOTH_TYPE out = val_to_type(val);
    assert(out->t == TY_FUNC);
    return out;
}

MOTH_VALUE type_node_to_type(NODE node){
    assert(node != NULL);
    assert(node->t == TYPE_NODE);
    enum type_type t = node->data.type_data.t;
    if (type_type_is_base(t)){
        MOTH_TYPE type = make_moth_type();
        type->t = t;
        type->moth_file = node->moth_file;
        return type_to_val(type);
    }
    if (t == TY_USER){
        MOTH_VALUE out;
        if (find_value(node->data.type_data.id,&out)){
            assert(out->t == TYPE);
            assert(strcmp(out->moth_file,node->moth_file) == 0);
            assert(out->type != NULL);
            return out;
        }
        RUNTIME_ERROR("Couldn't find type %s",node->data.type_data.id);
    }

    if (t == TY_REF){
        MOTH_VALUE out;
        out = eval(node->data.type_data.ref);
        assert(out->t == TYPE);
        assert(out->type != NULL);
        return out;
    }

    if (t == TY_ARRAY){
        MOTH_TYPE type = make_moth_type();
        type->t = t;
        type->moth_file = node->moth_file;
        type->ndims = node->data.type_data.ndims;
        type->base = val_to_type(type_node_to_type(node->data.type_data.base));
        return type_to_val(type);
    }

    if (t == TY_TEMPLATE)NOT_IMPLEMENTED;

    PANIC("Something really bad happened");
}

LLVMTypeRef moth_type_to_llvm_type(MOTH_TYPE moth_type){
    assert(moth_type != NULL);
    if (type_type_is_base(moth_type->t)){
        switch(moth_type->t){
            case TY_I1:
                return LLVMInt1Type();
            case TY_I8:
                return LLVMInt8Type();
            case TY_I16:
                return LLVMInt16Type();
            case TY_I32:
                return LLVMInt32Type();
            case TY_I64:
                return LLVMInt64Type();
            case TY_F16:
                return LLVMHalfType();
            case TY_F32:
                return LLVMFloatType();
            case TY_F64:
                return LLVMDoubleType();
            case TY_STR:
                return LLVMPointerType(LLVMInt8Type(),0);
            case TY_VOID:
                return LLVMVoidType();
            default:
                PANIC("SOMETHING BAD HAPPENED");
        }
    }

    if (moth_type->t == TY_FUNC){
        MOTH_FUNC_TYPE func_ty = moth_type->func_ty;
        LLVMTypeRef ret_type = moth_value_to_llvm_type(func_ty->ret_type);
        int n_inputs = len_MOTH_VALUE_list(func_ty->inputs);
        LLVMTypeRef param_types[n_inputs];
        for (int i = 0; i < n_inputs; i++){
            MOTH_VALUE this_type = get_MOTH_VALUE_list(func_ty->inputs,i);
            param_types[i] = moth_value_to_llvm_type(this_type);
        }
        LLVMTypeRef out = LLVMFunctionType(ret_type,param_types,n_inputs,0);
        return out;
    }

    NOT_IMPLEMENTED;
}

LLVMTypeRef moth_value_to_llvm_type(MOTH_VALUE value){
    return moth_type_to_llvm_type(val_to_type(value));
}

MOTH_VALUE make_function_type(const char* name, MOTH_VALUE ret_type, MOTH_VALUE_list inputs, MODIFIERS mods){
    MOTH_FUNC_TYPE func_ty;
    VERIFY_ALLOC(func_ty = alloc_struct_ptr(struct moth_func_descriptor));
    func_ty->inputs = inputs;
    func_ty->mods = mods;
    func_ty->name = name;
    func_ty->named = 1;
    func_ty->ret_type = ret_type;
    MOTH_TYPE type = make_moth_type();
    type->t = TY_FUNC;
    type->moth_file = get_active_moth_file_name();
    type->func_ty = func_ty;
    MOTH_VALUE out = type_to_val(type);
    out->declared = 0;
    return out;
}

int is_func_ty(MOTH_VALUE value){
    return val_to_type(value)->t == TY_FUNC;
}

LLVMTypeRef moth_value_to_llvm_function_type(MOTH_VALUE value){
    assert(val_to_type(value)->t == TY_FUNC);
    return moth_value_to_llvm_type(value);
}

LLVMTypeRef moth_type_to_llvm_function_type(MOTH_TYPE value){
    assert(value->t == TY_FUNC);
    return moth_type_to_llvm_type(value);
}

int types_equal(MOTH_TYPE left_type, MOTH_TYPE right_type){
    assert(left_type != NULL);
    assert(right_type != NULL);
    if (type_type_is_base(left_type->t)){
        if (type_type_is_base(right_type->t))
            return left_type->t == right_type->t;
    }
    NOT_IMPLEMENTED;
}