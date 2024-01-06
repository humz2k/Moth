#include "moth_llvm.h"
#include <stdlib.h>
#include <stdio.h>
#include "error.h"
#include <assert.h>
#include <string.h>
#include "simple_alloc.h"
#include "backend/file_table.h"

LLVMModuleRef mod = NULL;

int clear_module(void){
    LLVMDisposeModule(mod);
    mod = NULL;
    return 1;
}

int initialize_module(void){
    assert(mod == NULL);
    mod = LLVMModuleCreateWithName(get_active_moth_file_name());
    return 1;
}

void print_module(void){
    assert(mod != NULL);
    char *moduleStr = LLVMPrintModuleToString(mod);
    printf("%s\n", moduleStr);
    LLVMDisposeMessage(moduleStr);
}