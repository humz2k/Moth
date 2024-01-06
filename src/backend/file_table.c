#include "file_table.h"
#include "interface.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "error.h"
#include <assert.h>

static MOTH_VALUE active_moth_file = NULL;
static MOTH_VALUE_table moth_file_table = NULL;
static MOTH_VALUE_table local_vars = NULL;
static MOTH_VALUE_table template_context = NULL;

int initialize_file_table_state(void){
    moth_file_table = make_MOTH_VALUE_table();
    return 1;
}

MOTH_VALUE get_active_moth_file(void){
    return active_moth_file;
}

MOTH_VALUE_table get_moth_file_table(void){
    assert(moth_file_table != NULL);
    return moth_file_table;
}

MOTH_VALUE_table get_local_vars(void){
    return local_vars;
}

MOTH_VALUE_table get_template_context(void){
    return template_context;
}

const char* get_active_moth_file_name(void){
    assert(active_moth_file != NULL);
    return get_moth_file_name(get_active_moth_file());
}

int set_active_moth_file(MOTH_VALUE moth_file){
    active_moth_file = moth_file;
    return 1;
}

int create_new_moth_file(const char* name){
    assert(get_moth_file_table() != NULL);
    if (exists_MOTH_VALUE_table(get_moth_file_table(),name)){
        return 0;
    }

    MOTH_VALUE moth_file = make_moth_file(name);

    insert_MOTH_VALUE_table(get_moth_file_table(),name,moth_file);

    set_active_moth_file(moth_file);

    return 1;
}

int update_value_in_current_moth_file(const char* name, MOTH_VALUE value){
    assert(get_active_moth_file() != NULL);
    return update_moth_file(get_active_moth_file(),name,value);
}

int find_value(const char* name, MOTH_VALUE* out){
    assert(get_active_moth_file() != NULL);
    assert(get_moth_file_table() != NULL);

    if (get_template_context() != NULL){
        if (get_MOTH_VALUE_table(get_template_context(),name,out)){
            return 1;
        }
    }

    if (get_local_vars() != NULL){
        if (get_MOTH_VALUE_table(get_local_vars(),name,out)){
            return 1;
        }
    }

    if (find_in_moth_file(get_active_moth_file(),name,out)){
        return 1;
    }
    return get_MOTH_VALUE_table(get_moth_file_table(),name,out);
}


