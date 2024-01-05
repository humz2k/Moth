#ifndef _MOTH_ERROR_H_
#define _MOTH_ERROR_H_

#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

#define KNRM  "\x1B[0m"
#define KRED  "\x1B[31m"
#define KGRN  "\x1B[32m"
#define KYEL  "\x1B[33m"
#define KBLU  "\x1B[34m"
#define KMAG  "\x1B[35m"
#define KCYN  "\x1B[36m"
#define KWHT  "\x1B[37m"

#define ERR_COL KYEL
#define PANIC_COL KRED
#define INFO_COL KBLU
#define STR_COL KGRN

#define PANIC(...) printf(" -- %sPANIC%s :: <%s",PANIC_COL,KNRM,ERR_COL);printf(__VA_ARGS__);printf("%s> in %sfunc%s: %s%s%s, %sfile%s: %s%s%s, %sline%s: %s%d%s)",KNRM,INFO_COL,KNRM,STR_COL,__func__,KNRM,INFO_COL,KNRM,STR_COL, __FILE__,KNRM,INFO_COL,KNRM,STR_COL, __LINE__,KNRM);printf("\n");exit(1);

#define PANIC_GC() PANIC("GC_MALLOC FAILED!");

#define CHECK_PTR(ptr) ((ptr) != NULL)
//({int __out = (ptr == NULL); if(__out){printf("%s is NULL\n",#ptr);} !__out;})

#define VERIFY_ALLOC(ptr) if(!CHECK_PTR(ptr)){PANIC_GC();}

#endif
