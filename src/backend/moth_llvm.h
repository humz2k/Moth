#ifndef _MOTH_LLVM_H_
#define _MOTH_LLVM_H_

#include "parser/ast.h"

#include "type_definitions.h"

#include "moth_value.h"

#include "state_llvm.h"

#include "moth_ops.h"

MOTH_VALUE eval(NODE expr);

int compile(void);

#endif
