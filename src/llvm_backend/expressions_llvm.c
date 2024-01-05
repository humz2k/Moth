#include "moth_llvm.h"
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

LLVMValueRef generate_i_const(NODE i_const){
    assert(i_const->t == INTEGER_CONSTANT);
    int val = i_const->data.i;
    LLVMValueRef out = LLVMConstInt(LLVMInt64Type(),val,1);
    return out;
}

LLVMValueRef generate_f_const(NODE f_const){
    assert(f_const->t == REAL_CONSTANT);
    double val = f_const->data.r;
    LLVMValueRef out = LLVMConstReal(LLVMDoubleType(),val);
    return out;
}

//This should probably return a moth_value instead of LLVMValueRef

LLVMValueRef generate_expr(NODE expr){
    switch(expr->t){
        case RETURN_NODE:
            return generate_return(expr);
        case INTEGER_CONSTANT:
            return generate_i_const(expr);
        case REAL_CONSTANT:
            return generate_f_const(expr);
        default:
            return NULL;
    }
    return NULL;
}