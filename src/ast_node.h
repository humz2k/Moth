#ifndef _AST_NODE_H_
#define _AST_NODE_H_

struct ast_node;

typedef struct ast_node* NODE;

enum node_type{
    REAL_CONSTANT,
    BOOL_CONSTANT,
    INTEGER_CONSTANT,
    STRING_CONSTANT,
    BINOP_NODE,
    TYPE_NODE,
    VAR_NODE,
    DECLARATION_NODE,
    REFERENCE_NODE
};

#endif