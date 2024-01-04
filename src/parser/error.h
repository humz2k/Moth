#ifndef _MOTH_ERROR_H_
#define _MOTH_ERROR_H_

#include <stdio.h>
#include <assert.h>

#define PANIC(...) printf(__VA_ARGS__);exit(1)

#define CHECK_PTR(ptr) if(!(ptr)){printf("%s is NULL\n",#ptr);}

#endif
