#include "list_defs.h"

#ifndef list_t
#define list_t int
#endif

struct list_struct;

typedef struct list_struct* list;

list make_list(void);
int len(list lst);

//returns true on success
int append(list lst, list_t val);

list_t get(list lst, int idx);

list_t pop(list lst);

list_t pop_idx(list lst, int idx);

list copy_list(list lst);

#undef list_entry_t
#undef list_struct
#undef list
#undef make_list
#undef copy_list
#undef copy_list_entry
#undef append
#undef make_list_entry
#undef append_to_list_entry
#undef get_from_list_entry
#undef pop_from_list_entry
#undef pop_and_shift_list_entry
#undef shift_list_entry
#undef get
#undef pop
#undef pop_idx
#undef len
