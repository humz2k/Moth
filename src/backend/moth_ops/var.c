#include "backend/interface.h"
#include "backend/file_table.h"
#include "error.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "simple_alloc.h"

MOTH_VALUE eval_var(NODE var){
    assert(var != NULL);
    assert(var->t == VAR_NODE);
    struct var_node data = var->data.var_data;
    MOTH_VALUE out;
    if(!find_value(data.id,&out)){
        RUNTIME_ERROR("Could't find variable %s",data.id);
    }
    return out;
}