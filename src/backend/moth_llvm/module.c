#include "moth_llvm.h"
#include <stdlib.h>
#include <stdio.h>
#include "error.h"
#include <assert.h>
#include <string.h>
#include "simple_alloc.h"
#include "backend/file_table.h"
#include <assert.h>

static LLVMModuleRef mod = NULL;

LLVMModuleRef get_module(void){
    assert(mod != NULL);
    return mod;
}

int clear_module(void){

    string_t_list moth_files = get_moth_file_list();
    MOTH_VALUE_table moth_file_table = get_moth_file_table();

    int n_moth_files = len_string_t_list(moth_files);

    for (int i = 0; i < n_moth_files; i++){
        const char* moth_file_name = get_string_t_list(moth_files,i);
        MOTH_VALUE moth_file;
        assert(get_MOTH_VALUE_table(moth_file_table,moth_file_name,&moth_file));
        assert(clear_moth_file(moth_file));
    }

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