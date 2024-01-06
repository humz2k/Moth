#include "backend/interface.h"
#include "backend/file_table.h"
#include "error.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "simple_alloc.h"
#include <assert.h>

MOTH_VALUE eval_constant(NODE constant){
    assert(constant != NULL);
    switch(constant->t){
        case REAL_CONSTANT:
            return make_double(constant->data.r);
        case BOOL_CONSTANT:
            return make_bool(constant->data.i);
        case INTEGER_CONSTANT:
            return make_long(constant->data.i);
        case STRING_CONSTANT:
            NOT_IMPLEMENTED;
        default:
            PANIC("Something terrible happened");
    }
    return NULL;
}