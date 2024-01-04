#ifndef _CONTROL_FLOW_H_
#define _CONTROL_FLOW_H_

#include "parser/ast_node.h"

NODE make_break(void);

NODE make_continue(void);

NODE make_pass(void);

struct if_statement_node{
    NODE condition;
    NODE block;
    NODE else_statement;
};

struct elif_statement_node{
    NODE condition;
    NODE block;
};

struct else_statement_node{
    NODE_VEC elifs;
    NODE block;
};

NODE make_if_statement(NODE cond, NODE block, NODE else_statement);

NODE make_elif_statement(NODE cond, NODE block);

NODE make_else_statement(NODE_VEC elifs, NODE block);

struct while_loop_node{
    NODE condition;
    NODE block;
};

struct for_loop_node{
    NODE idx;
    NODE iterator;
    NODE block;
};

NODE make_while_loop(NODE cond, NODE block);

NODE make_for_loop(NODE idx, NODE iterator, NODE block);

#endif
