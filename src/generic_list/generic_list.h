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

int len(list lst){
    assert(lst->length >= 0);
    return lst->length;
}

