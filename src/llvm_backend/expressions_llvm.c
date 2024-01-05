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

LLVMValueRef generate_expr(NODE line){
    switch(line->t){
        case RETURN_NODE:
            return generate_return(line);
        case INTEGER_CONSTANT:
            return generate_i_const(line);
        default:
            return NULL;
    }
    return NULL;
}