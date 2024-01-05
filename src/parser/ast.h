#ifndef _AST_H_
#define _AST_H_

#include "parser/ast_node.h"

extern NODE program_start;
extern char* current_moth_file;

#include "parser/constants.h"

#include "parser/binop.h"

#include "parser/type.h"

#include "parser/vars.h"

#include "parser/refs.h"

#include "parser/functions.h"

#include "parser/struct_object.h"

#include "parser/block.h"

#include "parser/control_flow.h"

#include "parser/templates.h"

#include "parser/program.h"

#include "parser/array.h"

#include "parser/sinop.h"

union node_data{
    float r;
    int i;
    char* id;
    char* s;
    struct binop_node binop_data;
    struct type_node type_data;
    struct var_node var_data;
    struct declaration_node declaration_data;
    struct reference_node reference_data;
    struct assign_node assign_data;
    struct function_call_node function_call_data;
    struct index_node index_data;
    struct return_node return_data;
    struct attrs_node attrs_data;
    struct struct_or_object_node struct_or_object_data;
    struct block_node block_data;
    struct if_statement_node if_statement_data;
    struct elif_statement_node elif_statement_data;
    struct else_statement_node else_statement_data;
    struct while_loop_node while_loop_data;
    struct for_loop_node for_loop_data;
    struct function_node function_data;
    struct template_node template_data;
    struct program_node program_data;
    struct array_initializer_node array_initializer_data;
    struct print_node print_data;
    struct sinop_node sinop_data;
    struct cast_node cast_data;
};

struct ast_node{
    enum node_type t;
    char* moth_file;
    union node_data data;
};

//NODE get_type_of_expr(NODE expr);

#endif
