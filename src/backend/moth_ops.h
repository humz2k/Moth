#ifndef _MOTH_OPS_H_

#include "type_definitions.h"

MOTH_VALUE eval_program(NODE program);

MOTH_VALUE eval_constant(NODE constant);

MOTH_VALUE eval_binop(NODE binop);

MOTH_VALUE eval_type(NODE type);

MOTH_VALUE eval_var(NODE var);

MOTH_VALUE eval_declaration(NODE declaration);

MOTH_VALUE eval_reference(NODE reference);

MOTH_VALUE eval_assign(NODE assign);

MOTH_VALUE eval_function_call(NODE func_call);

MOTH_VALUE eval_index(NODE index);

MOTH_VALUE eval_return(NODE ret);

MOTH_VALUE eval_break(NODE brk);

MOTH_VALUE eval_continue(NODE cont);

MOTH_VALUE eval_attrs(NODE attrs);

MOTH_VALUE eval_struct(NODE strct);

MOTH_VALUE eval_object(NODE objct);

MOTH_VALUE eval_pass(NODE pass);

MOTH_VALUE eval_block(NODE block);

MOTH_VALUE eval_if(NODE if_stmt);

MOTH_VALUE eval_else(NODE else_stmt);

MOTH_VALUE eval_elif(NODE elif_stmt);

MOTH_VALUE eval_while(NODE while_loop);

MOTH_VALUE eval_for(NODE for_loop);

MOTH_VALUE eval_function(NODE func);

MOTH_VALUE eval_template(NODE temp);

MOTH_VALUE eval_array_initializer(NODE array_init);

MOTH_VALUE eval_print(NODE prnt);

MOTH_VALUE eval_sinop(NODE sinop);

MOTH_VALUE eval_cast(NODE cst);

#endif