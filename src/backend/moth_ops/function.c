#include "backend/interface.h"
#include "backend/file_table.h"
#include "error.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "simple_alloc.h"

MOTH_VALUE eval_function(NODE func) {
    assert(func->t == FUNCTION_NODE);
    struct function_node data = func->data.function_data;
    MOTH_VALUE ret_type = type_node_to_type(data.ret_type);
    MOTH_VALUE_list input_types = make_MOTH_VALUE_list();

    NODE_VEC input_type_nodes = data.inputs;
    int n_inputs = len_node_vec(input_type_nodes);
    for (int i = 0; i < n_inputs; i++){
        NODE decl = get_node_vec_elem(input_type_nodes,i);
        assert(decl->t = DECLARATION_NODE);
        append_MOTH_VALUE_list(input_types,type_node_to_type(decl->data.declaration_data.type));
    }

    int is_inline = 0;
    int is_extern = 0;
    NODE_VEC modifier_nodes = data.modifiers;
    int n_mods = len_node_vec(modifier_nodes);
    for (int i = 0; i < n_mods; i++){
        NODE mod = get_node_vec_elem(modifier_nodes,i);
        assert(mod->t == MODIFIER_NODE);
        const char* mod_str = mod->data.id;
        if (strcmp(mod_str,"extern") == 0){
            is_extern = 1;
            continue;
        }
        if (strcmp(mod_str,"inline") == 0){
            is_extern = 1;
            continue;
        }
        RUNTIME_ERROR("Unknown modifier %s",mod_str);
    }

    MOTH_VALUE func_ty = make_function_type(data.id,ret_type,input_types,make_modifiers(is_inline,is_extern));

    MOTH_VALUE out = init_function(func_ty);

    assert(update_value_in_current_moth_file(mangle_function_name(out),out));

    assert(declare_function(out));

    assert(init_local_variables());

    assert(init_builder_in_function(out));

    for (int i = 0; i < n_inputs; i++){
        NODE decl = get_node_vec_elem(input_type_nodes,i);
        assert(decl->t = DECLARATION_NODE);
        const char* input_name = decl->data.declaration_data.var->data.var_data.id;
        MOTH_VALUE var = declare_local_variable(input_name,type_node_to_type(decl->data.declaration_data.type));
        assert(set_local_variable(var,get_argument(out,i)));
    }

    return out;
}

