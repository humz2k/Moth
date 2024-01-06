#include "interface.h"
#include "moth_ops.h"
#include "backend.h"
#include "parser/ast.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "error.h"
#include <assert.h>

int compile(void){
    NODE program = get_program();
    initialize_file_table_state();
    initialize_backend();

    eval(program);

    if (module_initialized()){
        print_module();
        clear_module();
    }

    return 1;
}