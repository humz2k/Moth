#include "../bdwgc/include/gc.h"

void bohem_start(){
    GC_INIT();
}

void* bohem_malloc(int sz){
    return GC_malloc(sz);
}