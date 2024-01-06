#include "type_definitions.h"

#define table_t MOTH_VALUE
#include "generic_table/generic_table.h"
#undef table_t

#define list_t MOTH_FIELD
#include "generic_list/generic_list.h"
#undef list_t

#define list_t MOTH_TYPE
#include "generic_list/generic_list.h"
#undef list_t

#define list_t MOTH_VALUE
#include "generic_list/generic_list.h"
#undef list_t

#define list_t string_t
#include "generic_list/generic_list.h"
#undef list_t
