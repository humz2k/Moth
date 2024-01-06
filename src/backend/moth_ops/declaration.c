#include "backend/interface.h"
#include "backend/file_table.h"
#include "error.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "simple_alloc.h"

MOTH_VALUE eval_declaration(NODE declaration){
    assert(declaration != NULL);
    assert(declaration->t == DECLARATION_NODE);
    struct declaration_node data = declaration->data.declaration_data;
    MOTH_VALUE type = type_node_to_type(data.type);
    const char* name = data.var->data.var_data.id;
    assert(name != NULL);
    if (get_anon() == 0){
        return declare_local_variable(name,type);
    }
    NOT_IMPLEMENTED;
}