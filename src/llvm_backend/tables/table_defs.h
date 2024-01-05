#define COMBINE(a,b) b ## _ ## a

#define combine(a, b) COMBINE(a, b)

#define table_entry_t combine(table_entry,table_t)

#define table_struct combine(table_struct,table_t)

#define table combine(table,table_t)

#define make_table combine(table,make)

#define copy_table combine(table,copy)

#define copy_table_entry combine(table_entry_t,copy)

#define insert combine(table,insert)

#define make_table_entry combine(table_entry_t,make)

#define get combine(table,get)

#define delete combine(table,delete)

#define update combine(table,update)