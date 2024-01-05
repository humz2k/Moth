#ifndef _SIMPLE_ALLOC_H_
#define _SIMPLE_ALLOC_H_

#include "gc.h"

#define alloc_struct_ptr(strct) ((strct*)GC_MALLOC(sizeof(strct)))

#endif
