#include "moth_llvm.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int types_equal(NODE left, NODE right){
    assert(left->t == TYPE_NODE);
    assert(right->t == TYPE_NODE);

    struct type_node left_data = left->data.type_data;
    struct type_node right_data = right->data.type_data;

    if ((left_data.t == TY_I1) ||
        (left_data.t == TY_I8) ||
        (left_data.t == TY_I16) ||
        (left_data.t == TY_I32) ||
        (left_data.t == TY_I64) ||
        (left_data.t == TY_F16) ||
        (left_data.t == TY_F32) ||
        (left_data.t == TY_F64) ||
        (left_data.t == TY_STR) ||
        (left_data.t == TY_VOID)){
            return left_data.t == right_data.t;
        }
    
    if (left_data.t == TY_ARRAY){
        if (right_data.t != TY_ARRAY)return 0;
        if (!types_equal(left_data.base,right_data.base))return 0;
        if (left_data.ndims == 0)return 1;
        if (right_data.ndims == 0)return 1;
        if (left_data.ndims == right_data.ndims)return 1;
        return 0;
    }

    if (left_data.t == TY_USER){
        if (right_data.t != TY_USER)return 0;
        if (strcmp(left_data.id,right_data.id) == 0)return 1;
        return 0;
    }

    if (left_data.t == TY_TEMPLATE){
        if (right_data.t != TY_TEMPLATE)return 0;
        return types_equal(right_data.base,left_data.base)
                && types_equal(left_data.specialize,right_data.specialize);
    }
    
    //MISSING REFERNCE TYPES

    return 0;
}

NODE type_of_declaration(NODE decl){
    assert(decl->t == DECLARATION_NODE);
    return decl->data.declaration_data.type;
}

NODE type_of_variable(NODE var){
    assert(var->t == VAR_NODE);
    moth_value val = find_variable(var);
    return val.moth_type;
}

NODE type_of_expr(NODE expr){
    switch(expr->t){
        case TYPE_NODE:
            assert(1 == 0);
            return NULL;
        case REAL_CONSTANT:
            return make_base_type(TY_F64);
        case BOOL_CONSTANT:
            return make_base_type(TY_I1);
        case INTEGER_CONSTANT:
            return make_base_type(TY_I64);
        case STRING_CONSTANT:
            return make_base_type(TY_STR);
        case VAR_NODE:
            return type_of_variable(expr);
        case DECLARATION_NODE:
            return type_of_declaration(expr);
        
        default:
            assert(1 == 0);
    }
}

LLVMTypeRef type_to_llvm(NODE type){
    assert(type->t == TYPE_NODE);

    struct type_node data = type->data.type_data;

    switch(data.t){
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
            assert(1 == 0);
            return "";
    }
}

const char* type_to_string(NODE type){
    assert(type->t == TYPE_NODE);

    struct type_node data = type->data.type_data;

    switch(data.t){
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
            assert(1 == 0);
            return "";
    }
}