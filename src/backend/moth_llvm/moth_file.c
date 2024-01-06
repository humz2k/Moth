#include "moth_llvm.h"
#include "backend/interface.h"
#include <stdlib.h>
#include <stdio.h>
#include "error.h"
#include <string.h>
#include <assert.h>
#include "simple_alloc.h"
#include "backend/file_table.h"

MOTH_VALUE make_moth_file(const char* name){
    MOTH_VALUE out = make_moth_value();
    out->t = MOTH_FILE;
    out->type = NULL;
    out->modifiable = 0;
    out->value = NULL;
    out->scope = FILE_SCOPE;
    out->moth_file = name;
    out->table = make_MOTH_VALUE_table();
    out->name_list = make_string_t_list();
    return out;
}

static inline MOTH_VALUE_table get_table(MOTH_VALUE moth_file){
    assert(moth_file->t == MOTH_FILE);
    assert(moth_file->table != NULL);
    return moth_file->table;
}

static inline string_t_list get_name_list(MOTH_VALUE moth_file){
    assert(moth_file->t == MOTH_FILE);
    assert(moth_file->name_list != NULL);
    return moth_file->name_list;
}

int update_moth_file(MOTH_VALUE moth_file, const char* name, MOTH_VALUE value){
    append_string_t_list(get_name_list(moth_file),name);
    return update_MOTH_VALUE_table(get_table(moth_file),name,value);
}

int find_in_moth_file(MOTH_VALUE moth_file, const char* name, MOTH_VALUE* out){
    return get_MOTH_VALUE_table(get_table(moth_file),name,out);
}

const char* get_moth_file_name(MOTH_VALUE moth_file){
    assert(moth_file->t == MOTH_FILE);
    return moth_file->moth_file;
}

int clear_moth_file(MOTH_VALUE moth_file){
    string_t_list name_list = get_name_list(moth_file);
    MOTH_VALUE_table table = get_table(moth_file);
    int len = len_string_t_list(name_list);
    for (int i = 0; i < len; i++){
        const char* name = get_string_t_list(name_list,i);
        MOTH_VALUE value;
        assert(get_MOTH_VALUE_table(table,name,&value));
        assert(undeclare_moth_value(value));
    }
    return 1;
}