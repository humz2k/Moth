#include "backend/interface.h"
#include "backend/file_table.h"
#include "error.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "simple_alloc.h"

MOTH_VALUE eval_assign(NODE assign){
    assert(assign != NULL);
    assert(assign->t == ASSIGN_NODE);
    struct assign_node data = assign->data.assign_data;
    MOTH_VALUE left = eval(data.left);
    MOTH_VALUE right = get_value(eval(data.right));
    if (!set_variable(left,right)){
        PANIC("Should have errored out already?");
    }
    return right;
}