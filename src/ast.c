#include "ast.h"
#include "gc.h"

struct ast_node* make_ast_node(void){
    return GC_MALLOC(sizeof(struct ast_node));
}
