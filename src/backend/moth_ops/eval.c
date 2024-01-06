#include "backend/interface.h"
#include "backend/moth_ops.h"
#include "parser/ast.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "error.h"
#include <assert.h>

static int _module_initialized = 0;

int module_initialized(void){
    return _module_initialized;
}

MOTH_VALUE eval_anon_func(NODE expr){
    NOT_IMPLEMENTED;
}

MOTH_VALUE eval_top_level(NODE expr){
    if (!module_initialized()){
        assert(initialize_module());
    }
    NOT_IMPLEMENTED;
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