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
k->raw = (int*)malloc((2)*(3)*sizeof(int));
k->ndims = 2;
k->dims = (int*)malloc(2*sizeof(int));
k->dims[0] = 2;k->dims[1] = 3;
k->raw[(1*(1*k->dims[1]))+(0*(1))] = 1;
k->raw[(0*(1*k->dims[1]))+(0*(1))] = 2;
printf("%d",k->raw[(1*(1*k->dims[1]))+(0*(1))]);printf("\n");
printf("%d",k->raw[(0*(1*k->dims[1]))+(0*(1))]);printf("\n");
}
