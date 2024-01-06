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
    return out;
}

static inline MOTH_VALUE_table get_table(MOTH_VALUE moth_file){
    assert(moth_file->t == MOTH_FILE);
    assert(moth_file->table != NULL);
    return moth_file->table;
}

int update_moth_file(MOTH_VALUE moth_file, const char* name, MOTH_VALUE value){
    return update_MOTH_VALUE_table(get_table(moth_file),name,value);
}

int find_in_moth_file(MOTH_VALUE moth_file, const char* name, MOTH_VALUE* out){
    return get_MOTH_VALUE_table(get_table(moth_file),name,out);
}

const char* get_moth_file_name(MOTH_VALUE moth_file){
    assert(moth_file->t == MOTH_FILE);
    return moth_file->moth_file;
}