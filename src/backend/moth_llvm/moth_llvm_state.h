#ifndef _MOTH_LLVM_STATE_H_
#define _MOTH_LLVM_STATE_H_

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>

extern LLVMModuleRef mod;
extern LLVMBuilderRef builder;

#endif