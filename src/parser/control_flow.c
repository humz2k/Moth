#include "parser/ast.h"

NODE make_break(void){
    NODE out = make_ast_node();
    out->t = BREAK_NODE;
    return out;
}

NODE make_continue(void){
    NODE out = make_ast_node();
    out->t = CONTINUE_NODE;
    return out;
}

NODE make_pass(void){
    NODE out = make_ast_node();
    out->t = PASS_NODE;
    return out;
}

NODE make_if_statement(NODE cond, NODE block, NODE else_statement){
    NODE out = make_ast_node();
    out->t = IF_NODE;
    out->data.if_statement_data.condition = cond;
    out->data.if_statement_data.block = block;
    out->data.if_statement_data.else_statement = else_statement;
    return out;
}

NODE make_elif_statement(NODE cond, NODE block){
    NODE out = make_ast_node();
    out->t = ELIF_NODE;
    out->data.elif_statement_data.condition = cond;
    out->data.elif_statement_data.block = block;
    return out;
}

NODE make_else_statement(NODE_VEC elifs, NODE block){
    NODE out = make_ast_node();
    out->t = ELSE_NODE;
    out->data.else_statement_data.elifs = elifs;
    out->data.else_statement_data.block = block;
    return out;
}

NODE make_while_loop(NODE cond, NODE block){
    NODE out = make_ast_node();
    out->t = WHILE_LOOP_NODE;
    out->data.while_loop_data.condition = cond;
    out->data.while_loop_data.block = block;
    return out;
}

NODE make_for_loop(NODE idx, NODE iterator, NODE block){
    NODE out = make_ast_node();
    out->t = FOR_LOOP_NODE;
    out->data.for_loop_data.idx = idx;
    out->data.for_loop_data.iterator = iterator;
    out->data.for_loop_data.block = block;
    return out;
}
