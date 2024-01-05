#include "gc.h"
#include <assert.h>
#include <stdlib.h>
#include <string.h>

#ifndef table_t
#define table_t int
#endif

#ifndef TABLE_SIZE
#define TABLE_SIZE 50000
#endif

#include "table_defs.h"

#ifndef EMITTED_HASH_FUNCTION
#define EMITTED_HASH_FUNCTION

static int hash_function(const char* str){
    unsigned long i = 0;

    for (int j = 0; str[j]; j++)
        i += str[j];

    return i % TABLE_SIZE;
}

#endif

struct table_entry_t{
    int used;
    const char* key;
    table_t value;
    struct table_entry_t* next;
};

struct table_struct{
    struct table_entry_t* entries[TABLE_SIZE];
};

typedef struct table_struct* table;

table make_table(void){
    table out = (struct table_struct*) GC_MALLOC(sizeof(struct table_struct));
    for (int i = 0; i < TABLE_SIZE; i++){
        out->entries[i] = NULL;
    }
    return out;
}

static inline struct table_entry_t* copy_table_entry(struct table_entry_t* in){
    
    if (in == NULL)return NULL;

    struct table_entry_t* out = (struct table_entry_t*)GC_MALLOC(sizeof(struct table_entry_t));
    out->key = in->key;
    out->used = in->used;
    out->value = in->value;
    if (out->next != NULL){
        out->next = copy_table_entry(in->next);
    }
    return out;
}

static inline struct table_entry_t* make_table_entry(void){
    struct table_entry_t* out = (struct table_entry_t*)GC_MALLOC(sizeof(struct table_entry_t));
    out->used = 0;
    out->next = NULL;
    return out;
}

table copy_table(table in){
    table out = (table) GC_MALLOC(sizeof(struct table_struct));
    for (int i = 0; i < TABLE_SIZE; i++){
        out->entries[i] = copy_table_entry(in->entries[i]);
    }
    return out;
}

//return true on success
int insert(table my_table, const char* key, table_t val){
    int idx = hash_function(key);
    
    if (my_table->entries[idx] == NULL){
        my_table->entries[idx] = make_table_entry();
        my_table->entries[idx]->key = key;
        my_table->entries[idx]->value = val;
        my_table->entries[idx]->used = 1;
        return 1;
    }

    if (my_table->entries[idx]->used == 0){
        my_table->entries[idx]->key = key;
        my_table->entries[idx]->value = val;
        my_table->entries[idx]->used = 1;
        return 1;
    }

    assert(my_table->entries[idx]->used == 1);

    struct table_entry_t* cur = my_table->entries[idx];

    while (cur->used){

        if (cur->next == NULL){
            cur->next = make_table_entry();
            cur->next->key = key;
            cur->next->value = val;
            cur->next->used = 1;
            return 1;
        }

        cur = cur->next;
    }

    assert(cur->used == 0);

    cur->key = key;
    cur->used = 1;
    cur->value = val;
    return 1;
}

//returns true on success
int get(table my_table, const char* key, table_t* out){
    int idx = hash_function(key);

    struct table_entry_t* cur = my_table->entries[idx];

    while (cur != NULL){
        if (cur->used){
            if (strcmp(key,cur->key) == 0){
                *out = cur->value;
                return 1;
            }
        }
        cur = cur->next;
    }
    return 0;
}

//return true on success
int delete(table my_table, const char* key){
    int idx = hash_function(key);

    struct table_entry_t* cur = my_table->entries[idx];

    while (cur != NULL){
        if (cur->used){
            if (strcmp(key,cur->key) == 0){
                cur->used = 0;
                return 1;
            }
        }
        cur = cur->next;
    }

    return 0;
}

//return true on success
int update(table my_table, const char* key, table_t val){
    int idx = hash_function(key);

    //if entry is NULL, we know it cannot exist so we make new entry
    if (my_table->entries[idx] == NULL){
        my_table->entries[idx] = make_table_entry();
        my_table->entries[idx]->key = key;
        my_table->entries[idx]->value = val;
        my_table->entries[idx]->used = 1;
        return 1;
    }

    //now assume that it exists
    struct table_entry_t* cur = my_table->entries[idx];

    //check all entries
    while (cur != NULL){
        if (cur->used){
            if (strcmp(key,cur->key) == 0){
                cur->value = val;
                return 1;
            }
        }
        cur = cur->next;
    }

    //now we know it doesnt exist

    cur = my_table->entries[idx];

    while (cur->used){

        if (cur->next == NULL){
            cur->next = make_table_entry();
            cur->next->key = key;
            cur->next->value = val;
            cur->next->used = 1;
            return 1;
        }

        cur = cur->next;
    }

    //this means we didn't find an unused entry

    assert(cur->used == 0);

    cur->key = key;
    cur->used = 1;
    cur->value = val;
    return 1;
}

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
#undef TABLE_SIZE

