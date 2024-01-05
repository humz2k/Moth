#ifndef table_t
#define table_t int
#endif

#include "table_defs.h"

struct table_struct;

typedef struct table_struct* table;

table make_table(void);

table copy_table(table in);

//return true on success
int insert(table my_table, const char* key, table_t val);

//returns true on success
int get(table my_table, const char* key, table_t* out);

//returns true on success
int delete(table my_table, const char* key);

//returns true on success. Either rewrites or creates new
int update(table my_table, const char* key, table_t val);

#undef make_table
#undef table_struct
#undef table_entry_t
#undef table
#undef copy_table_entry
#undef copy_table
#undef insert
#undef get
#undef delete
#undef update

