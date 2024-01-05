#ifndef _MOTH_LLVM_H_
#define _MOTH_LLVM_H_

#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>

#include "parser/ast.h"

#include "functions_llvm.h"

#include "types_llvm.h"

#include "variables_llvm.h"

extern LLVMModuleRef mod;

int compile(void);

#endif
