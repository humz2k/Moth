#include "parser/ast.h"
#include "gc.h"
#include <assert.h>
#include "error.h"
#include "simple_alloc.h"

struct ast_node* make_ast_node(void){
    struct ast_node* out;
    VERIFY_ALLOC(out = alloc_struct_ptr(struct ast_node));
    out->moth_file = current_moth_file;
    return out;
}
