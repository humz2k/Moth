#ifndef _STATE_LLVM_H_
#define _STATE_LLVM_H_

#include "moth_value.h"

int initialize_llvm_state(void);

int update_value_in_current_moth_file(const char* name, MOTH_VALUE value);

int find_value(const char* name, MOTH_VALUE* out);

int find_in_moth_file(MOTH_VALUE moth_file, const char* name, MOTH_VALUE* out);

#endif