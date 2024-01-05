#include "moth_llvm.h"
#include "tables_llvm.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "error.h"
#include <string.h>

static MOTH_VALUE active_moth_file = NULL;
static MOTH_VALUE_table moth_file_table = NULL;
static MOTH_VALUE_table local_vars = NULL;

int initialize_llvm_state(void){
    moth_file_table = make_MOTH_VALUE_table();
    return 1;
}

int create_new_moth_file(const char* name){
    assert(moth_file_table != NULL);
    if (exists_MOTH_VALUE_table(moth_file_table,name)){
        return 0;
    }

    MOTH_VALUE moth_file = make_moth_file(name);

    insert_MOTH_VALUE_table(moth_file_table,name,moth_file);

    active_moth_file = moth_file;

    return 1;
}

int update_value_in_current_moth_file(const char* name, MOTH_VALUE value){
    assert(active_moth_file != NULL);
    return update_moth_file(active_moth_file,name,value);
}

int find_value(const char* name, MOTH_VALUE* out){
    assert(active_moth_file != NULL);
    assert(moth_file_table != NULL);

    if (local_vars != NULL){
        if (get_MOTH_VALUE_table(moth_file_table,name,out)){
            return 1;
        }
    }

    if (find_in_moth_file(active_moth_file,name,out)){
        return 1;
    }
    return get_MOTH_VALUE_table(moth_file_table,name,out);
}