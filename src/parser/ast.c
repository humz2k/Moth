#include "parser/ast.h"
#include "gc.h"
#include <assert.h>

struct ast_node* make_ast_node(void){
    struct ast_node* out = GC_MALLOC(sizeof(struct ast_node));
    out->moth_file = current_moth_file;
    return out;
}