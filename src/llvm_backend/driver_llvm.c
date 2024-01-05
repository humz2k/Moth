#include "moth_llvm.h"
#include "parser/ast.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "error.h"
#include <assert.h>

MOTH_VALUE eval_program(NODE program){
    assert(program != NULL);
    assert(program->t == PROGRAM_NODE);
    MOTH_VALUE prev_moth_file = get_active_moth_file();
    
    assert(create_new_moth_file(program->moth_file));

    NODE_VEC nodes = program->data.program_data.comp_unit_list;

    int n_nodes = len_node_vec(nodes);

    for (int i = 0; i < n_nodes; i++){
        eval(get_node_vec_elem(nodes,i));
    }

    MOTH_VALUE this_moth_file = get_active_moth_file();

    assert(set_active_moth_file(prev_moth_file));

    return this_moth_file;
}

MOTH_VALUE eval(NODE expr){
    assert(expr != NULL);

    switch(expr->t){
        case REAL_CONSTANT:
            return eval_constant(expr);
        case BOOL_CONSTANT:
            return eval_constant(expr);
        case INTEGER_CONSTANT:
            return eval_constant(expr);
        case STRING_CONSTANT:
            return eval_constant(expr);
        case BINOP_NODE:
            return eval_binop(expr);
        case TYPE_NODE:
            return eval_type(expr);
        case VAR_NODE:
            return eval_var(expr);
        case DECLARATION_NODE:
            return eval_declaration(expr);
        case REFERENCE_NODE:
            return eval_reference(expr);
        case ASSIGN_NODE:
            return eval_assign(expr);
        case FUNCTION_CALL_NODE:
            return eval_function_call(expr);
        case INDEX_NODE:
            return eval_index(expr);
        case RETURN_NODE:
            return eval_return(expr);
        case BREAK_NODE:
            return eval_break(expr);
        case CONTINUE_NODE:
            return eval_continue(expr);
        case ATTRS_NODE:
            return eval_attrs(expr);
        case STRUCT_NODE:
            return eval_struct(expr);
        case OBJECT_NODE:
            return eval_object(expr);
        case PASS_NODE:
            return eval_pass(expr);
        case BLOCK_NODE:
            return eval_block(expr);
        case IF_NODE:
            return eval_if(expr);
        case ELSE_NODE:
            return eval_else(expr);
        case ELIF_NODE:
            return eval_elif(expr);
        case WHILE_LOOP_NODE:
            return eval_while(expr);
        case FOR_LOOP_NODE:
            return eval_for(expr);
        case FUNCTION_NODE:
            return eval_function(expr);
        case TEMPLATE_NODE:
            return eval_template(expr);
        case PROGRAM_NODE:
            return eval_program(expr);
        case ARRAY_INITIALIZER_NODE:
            return eval_array_initializer(expr);
        case PRINT_NODE:
            return eval_print(expr);
        case SINOP_NODE:
            return eval_sinop(expr);
        case CAST_NODE:
            return eval_cast(expr);
        default:
            PANIC("Something bad happened");
    }
    return NULL;
}

int compile(void){
    NODE program = get_program();
    initialize_llvm_state();

    eval(program);

    return 1;
}