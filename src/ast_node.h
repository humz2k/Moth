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
    REFERENCE_NODE,
    ASSIGN_NODE
};

NODE make_ast_node(void);

struct ast_node_vector;

typedef struct ast_node_vector NODE_VEC;

NODE_VEC make_node_vec(void);
NODE_VEC append_node_vec(NODE_VEC lst, NODE elem);
int len_node_vec(NODE_VEC lst);
NODE get_node_vec_elem(NODE_VEC lst, int idx);

#endif
