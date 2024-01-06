#include "moth_llvm.h"
#include "backend/interface.h"
#include <stdlib.h>
#include <stdio.h>
#include "error.h"
#include <string.h>
#include <assert.h>
#include "simple_alloc.h"
#include "backend/file_table.h"

static inline const char* _mangle_function_name(const char* moth_file_name, const char* name, MOTH_VALUE_list inputs){

    assert(moth_file_name != NULL);
    assert(name != NULL);
    assert(inputs != NULL);

    int n_inputs = len_MOTH_VALUE_list(inputs);

    int len = strlen(moth_file_name) + strlen(name) + 5;

    const char* strings[n_inputs];
    for (int i = 0; i < n_inputs; i++){
        strings[i] = type_to_string(get_MOTH_VALUE_list(inputs,i));
        len += strlen(strings[i]) + 1;
    }

    char* out = GC_MALLOC(sizeof(char) * len);

    strcpy(out,moth_file_name);

    strcat(out,"_");

    strcat(out,name);

    strcat(out,"_");

    for (int i = 0; i < n_inputs; i++){
        strcat(out,strings[i]);
        strcat(out,"_");
    }

    return out;
}

const char* mangle_function_name(MOTH_VALUE func_ty){
    assert(func_ty != NULL);
    MOTH_TYPE type = val_to_func_ty(func_ty);
    return _mangle_function_name(type->moth_file,type->id,type->func_ty->inputs);
}

int function_is_declared(MOTH_VALUE func){
    assert(func != NULL);
    assert(func->t == FUNCTION);
    assert((func->declared == 0) || (func->declared == 1));
    return func->declared;
}