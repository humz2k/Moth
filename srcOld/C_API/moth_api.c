#include <stdio.h>
#include <stdlib.h>

typedef struct __array {
    void* raw;
    int* shape;
    int nd;
    int references;
} __ARRAY;

void __destroy__Array(__ARRAY *arr){

    free(arr->raw);
    free(arr);
}

__ARRAY* __init__Array(int nd, int* shape, size_t type){
    
    int size = 1;
    for (int i = 0; i < nd; i++){
        size *= shape[i];
    }
    __ARRAY *out = (__ARRAY*)malloc(sizeof(__ARRAY));
    out->raw = malloc(size * type);
    out->references = 1;
    out->nd = nd;
    out->shape = shape;

    return out;
}

int main(){

    printf("HELLO\n");

    int shape[3] = {3,3,3};

    __ARRAY* myArray = __init__Array(3,shape,sizeof(int));

    __destroy__Array(myArray);

    return 0;

}

