
#ifndef _CONSTANTS_H_
#define _CONSTANTS_H_

#include "ast_node.h"

NODE make_real_const(float r);
NODE make_bool_const(int i);
NODE make_int_const(int i);
NODE make_string_const(char* s);

#endif
