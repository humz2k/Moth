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

#define append_to_list_entry combine(list_entry_t,append_to)

#define get_from_list_entry combine(list_entry_t,get_from)

#define pop_from_list_entry combine(list_entry_t,pop_from)

#define pop_and_shift_list_entry combine(list_entry_t,pop_and_shift)

#define shift_list_entry combine(list_entry_t,shift)

#define get combine(list,get)

#define pop combine(list,pop)

#define pop_idx combine(list,pop_idx)

#define len combine(list,len)
