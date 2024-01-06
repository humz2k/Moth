#ifndef _FILE_TABLE_H_
#define _FILE_TABLE_H_

#include "type_definitions.h"

int initialize_file_table_state(void);

string_t_list get_moth_file_list(void);

MOTH_VALUE get_active_moth_file(void);

MOTH_VALUE_table get_moth_file_table(void);

MOTH_VALUE_table get_local_vars(void);

MOTH_VALUE_table get_template_context(void);

const char* get_active_moth_file_name(void);

int set_active_moth_file(MOTH_VALUE moth_file);

int create_new_moth_file(const char* name);

int update_value_in_current_moth_file(const char* name, MOTH_VALUE value);

int find_value(const char* name, MOTH_VALUE* out);

#endif