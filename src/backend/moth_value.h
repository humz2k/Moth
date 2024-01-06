#ifndef _MOTH_VALUE_H_
#define _MOTH_VALUE_H_

#include "parser/ast.h"
//#include "state_llvm.h"

#include "lists_llvm.h"
#include "type_definitions.h"

enum scope_t{
    LOCAL_SCOPE,
    FILE_SCOPE
};

typedef enum {
    VARIABLE,
    CONSTANT,
    TYPE,
    FUNCTION,
    MOTH_FILE
} VALUE_TYPE;

typedef struct {
    int is_inline;
    int is_extern;
} MODIFIERS;

static inline MODIFIERS make_modifiers(int is_inline, int is_extern){
    MODIFIERS out;
    out.is_inline = is_inline;
    out.is_extern = is_extern;
    return out;
}

MOTH_VALUE make_moth_file(const char* name);

int update_moth_file(MOTH_VALUE moth_file, const char* name, MOTH_VALUE value);

int find_in_moth_file(MOTH_VALUE moth_file, const char* name, MOTH_VALUE* out);

const char* get_moth_file_name(MOTH_VALUE moth_file);

int clear_module(void);

int initialize_module(void);

void print_module(void);

MOTH_VALUE type_node_to_type(NODE node);

int in_function(void);

MOTH_VALUE make_function_type(const char* name, MOTH_VALUE ret_type, MOTH_VALUE_list inputs, MODIFIERS mods);

#endif
