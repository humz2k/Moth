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
    ASSIGN_NODE,
    FUNCTION_CALL_NODE,
    INDEX_NODE,
    RETURN_NODE,
    BREAK_NODE,
    CONTINUE_NODE,
    ATTRS_NODE,
    STRUCT_NODE,
    OBJECT_NODE,
    PASS_NODE,
    BLOCK_NODE,
    IF_NODE,
    ELSE_NODE,
    ELIF_NODE,
    WHILE_LOOP_NODE,
    FOR_LOOP_NODE,
    FUNCTION_NODE,
    TEMPLATE_NODE,
    PROGRAM_NODE,
    ARRAY_INITIALIZER_NODE,
    PRINT_NODE,
    SINOP_NODE,
    MODIFIER_NODE,
    CAST_NODE
};

NODE make_ast_node(void);

struct ast_node_vector_block;

struct ast_node_vector{
    int len;
    struct ast_node_vector_block* first;
};

typedef struct ast_node_vector NODE_VEC;

NODE_VEC make_empty_node_vec(void);
NODE_VEC make_node_vec(NODE elem);
NODE_VEC append_node_vec(NODE_VEC lst, NODE elem);
int len_node_vec(NODE_VEC lst);
NODE get_node_vec_elem(NODE_VEC lst, int idx);

#endif
