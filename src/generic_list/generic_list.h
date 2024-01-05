#include "gc.h"
#include <assert.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "error.h"
#include "simple_alloc.h"

#ifndef list_t
#define list_t int
#endif

#include "list_defs.h"

#define ITEMS_PER_BLOCK 20

struct list_entry_t {
    int used;
    list_t items[ITEMS_PER_BLOCK];
    struct list_entry_t* next;
};

struct list_struct{
    int length;
    struct list_entry_t* first;
};

typedef struct list_struct* list;

list make_list(void){
    list out;

    VERIFY_ALLOC(out = alloc_struct_ptr(struct list_struct));

    out->length = 0;
    out->first = NULL;

    return out;
};

static inline struct list_entry_t* make_list_entry(void){
    struct list_entry_t* out;
    VERIFY_ALLOC(out = alloc_struct_ptr(struct list_entry_t));
    out->used = 0;
    out->next = NULL;
    return out;
}

int len(list lst){
    assert(lst != NULL);
    assert(lst->length >= 0);
    return lst->length;
}

static inline int append_to_list_entry(struct list_entry_t* entry, list_t val){
    assert(entry != NULL);
    assert(entry->used >= 0);
    if (entry->used < ITEMS_PER_BLOCK){
        entry->items[entry->used] = val;
        entry->used++;
        return 1;
    }
    if (entry->next == NULL){
        entry->next = make_list_entry();
    }
    return append_to_list_entry(entry->next,val);
}

//returns true on success
int append(list lst, list_t val){
    assert(lst != NULL);
    assert(lst->length >= 0);
    if (lst->length == 0){
        assert(lst->first == NULL);
        lst->first = make_list_entry();
    }
    if (!(append_to_list_entry(lst->first,val))){
        return 0;
    }
    lst->length++;
    return 1;
}

static inline list_t get_from_list_entry(struct list_entry_t* entry, int idx){
    assert(entry != NULL);
    assert(idx >= 0);
    if (idx < entry->used){
        return entry->items[idx];
    }
    return get_from_list_entry(entry->next, idx - entry->used);
}

list_t get(list lst, int idx){
    assert(lst != NULL);
    assert(idx < len(lst));
    return get_from_list_entry(lst->first,idx);
}

static inline list_t pop_from_list_entry(struct list_entry_t* entry){
    assert(entry != NULL);
    assert(entry->used > 0);
    assert(entry->used <= ITEMS_PER_BLOCK);
    if (entry->next == NULL){
        assert(entry->used > 1);
        list_t out = entry->items[entry->used - 1];
        entry->used--;
        return out;
    }
    if (entry->next->used == 1){
        list_t out = entry->next->items[0];
        entry->next = NULL;
        return out;
    }
    return pop_from_list_entry(entry->next);
}

list_t pop(list lst){
    assert(lst != NULL);
    assert(lst->length > 0);
    list_t out;
    if (lst->length == 1){
        out = get_from_list_entry(lst->first,0);
        lst->first = NULL;
    }
    else {
        out = pop_from_list_entry(lst->first);
    }
    lst->length--;
    return out;
}

static int shift_list_entry(struct list_entry_t* entry){
    assert(entry != NULL);
    assert(entry->used > 1);

    if (entry->next == NULL){
        entry->used--;
        return 1;
    }

    assert(entry->used == ITEMS_PER_BLOCK);
    assert(entry->next->used > 0);

    entry->items[entry->used - 1] = entry->next->items[0];
    if (entry->next->used == 1){
        entry->next = NULL;
        return 1;
    }
       
    for (int i = 0; i < (entry->next->used - 1); i++){
        entry->next->items[i] = entry->next->items[i + 1];
    }

    return shift_list_entry(entry->next);

}

static list_t pop_and_shift_list_entry(struct list_entry_t* entry, int idx){
    assert(entry != NULL);
    if (idx >= entry->used){
        assert(entry->used == ITEMS_PER_BLOCK);
        assert(entry->next != NULL);
        return pop_and_shift_list_entry(entry->next,idx - entry->used);
    }
    assert(idx < entry->used);
    assert(entry->used > 1);
    if (entry->next == NULL){
        assert(idx != (entry->used - 1));
    }

    list_t out = entry->items[idx];
    for (int i = idx; i < (entry->used-1); i++){
        entry->items[i] = entry->items[i + 1];
    }
    
    assert(shift_list_entry(entry) == 1);

    return out;
    
}

list_t pop_idx(list lst, int idx){
    assert(lst != NULL);
    assert(lst->length > 0);
    assert(lst->first != NULL);
    assert(idx < len(lst));
    if (idx == (len(lst) - 1)){
        return pop(lst);
    }
    list_t out = pop_and_shift_list_entry(lst->first,idx);
    lst->length--;
    return out;
}

static struct list_entry_t* copy_list_entry(struct list_entry_t* entry){
    assert(entry != NULL);
    assert(entry->used > 0);
    assert(entry->used <= ITEMS_PER_BLOCK);
    struct list_entry_t* out = make_list_entry();
    out->used = entry->used;
    for (int i = 0; i < entry->used; i++){
        out->items[i] = entry->items[i];
    }
    if (entry->next == NULL){
        return out;
    }
    out->next = copy_list_entry(entry->next);
    return out;
}

list copy_list(list lst){
    assert(lst != NULL);
    list out = make_list();
    out->length = lst->length;

    if ((lst->length == 0) || (lst->first == NULL)){
        assert(lst->length == 0);
        assert(lst->first == NULL);
        return out;
    }

    out->first = copy_list_entry(lst->first);

    return out;
}

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
