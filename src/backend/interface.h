#ifndef _INTERFACE_H_
#define _INTERFACE_H_

#include "type_definitions.h"
#include "parser/ast.h"

int initialize_backend(void);

MOTH_VALUE eval(NODE expr);

MOTH_VALUE eval_top_level(NODE expr);

int module_initialized(void);

static inline MODIFIERS make_modifiers(int is_inline, int is_extern){
    MODIFIERS out;
    out.is_inline = is_inline;
    out.is_extern = is_extern;
    return out;
}

const char* get_moth_file_name(MOTH_VALUE moth_file);

MOTH_VALUE make_moth_file(const char* name);

int update_moth_file(MOTH_VALUE moth_file, const char* key, MOTH_VALUE value);

int find_in_moth_file(MOTH_VALUE moth_file, const char* key, MOTH_VALUE* out);



int clear_module(void);

int initialize_module(void);

void print_module(void);



const char* type_to_string(MOTH_VALUE type);

MOTH_VALUE type_node_to_type(NODE node);

const char* mangle_function_name(MOTH_VALUE func_ty);

MOTH_VALUE make_function_type(const char* name, MOTH_VALUE ret_type, MOTH_VALUE_list inputs, MODIFIERS mods);

int in_function(void);

int return_value(MOTH_VALUE val);
MOTH_VALUE get_current_function(void);
int finalize_builder_in_function(void);
MOTH_VALUE init_function(MOTH_VALUE func_ty);
int declare_function(MOTH_VALUE func);
int init_builder_in_function(MOTH_VALUE func);
MOTH_VALUE get_argument(MOTH_VALUE func, int idx);

MOTH_VALUE declare_local_variable(const char* name, MOTH_VALUE type);
MOTH_VALUE get_value(MOTH_VALUE val);
int set_variable(MOTH_VALUE var, MOTH_VALUE value);


MOTH_VALUE make_long(long int val);
MOTH_VALUE make_double(double val);
MOTH_VALUE make_bool(int val);

void set_anon(int val);
int get_anon(void);

#endif
