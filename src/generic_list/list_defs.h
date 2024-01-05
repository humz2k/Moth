#define COMBINE(a,b) b ## _ ## a

#define combine(a, b) COMBINE(a, b)

#define list_entry_t combine(list_entry,list_t)

#define list_struct combine(list_struct,list_t)

#define list combine(list,list_t)

#define make_list combine(list,make)

#define copy_list combine(list,copy)

#define copy_list_entry combine(list_entry_t,copy)

#define append combine(list,append)

#define make_list_entry combine(list_entry_t,make)

#define get combine(list,get)

#define pop combine(list,pop)

#define pop_idx combine(list,pop_idx)

#define len combine(list,len)