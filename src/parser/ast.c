#include "parser/ast.h"
#include "gc.h"
#include <assert.h>

struct ast_node* make_ast_node(void){
    return GC_MALLOC(sizeof(struct ast_node));
}