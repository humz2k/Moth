#include "types_llvm.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

NODE type_of_declaration(NODE decl){
    assert(decl->t == DECLARATION_NODE);
    return decl->data.declaration_data.type;
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