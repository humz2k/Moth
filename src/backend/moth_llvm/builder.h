#ifndef _BUILDER_H_
#define _BUILDER_H_

#include "moth_llvm_type_defs.h"
#include "moth_llvm_state.h"

LLVMBuilderRef get_builder(void);

int init_builder(void);

int delete_builder(void);

#endif