#include "backend/backend.h"
#include "backend/interface.h"
#include "error.h"

MOTH_VALUE eval_type(NODE type){
    assert(type->t == TYPE_NODE);
    return type_node_to_type(type);
}