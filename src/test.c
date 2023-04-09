#include <stdlib.h>
#include <stdio.h>
#include <math.h>

    struct intArray {
        int refs;
        int initialized;
        int ndims;
        int* dims;
        int* raw;
    };
    
int main(){
struct intArray* k = (struct intArray*)malloc(sizeof(struct intArray));
if (k->initialized != 0){ printf("arrayErr");exit(1);}
k->raw = (int*)malloc((10)*sizeof(int));
k->ndims = 1;
k->dims = (int*)malloc(1*sizeof(int));
k->dims[0] = 10;
k->raw[(0*(1))];
}
