#include "variables_llvm.h"
#include <assert.h>

const char* var_to_string(NODE var){
    assert(var->t == VAR_NODE);
    return var->data.var_data.id;
}