#ifndef _VALUES_LLVM_H_
#define _VALUES_LLVM_H_

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>

#include "parser/ast.h"

#include "tables/tables_llvm.h"
#include <assert.h>

typedef struct{
    LLVMValueRef llvm_value;
    NODE moth_type;
} moth_value;

static inline moth_value make_moth_value(LLVMValueRef llvm_value, NODE moth_type){
    assert(moth_type->t == TYPE_NODE);
    moth_value out;
    out.llvm_value = llvm_value;
    out.moth_type = moth_type;
    return out;
}

#endif