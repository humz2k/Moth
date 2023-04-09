#include <stdlib.h>
#include <stdio.h>
#include <math.h>

    struct floatArray {
        int refs;
        int initialized;
        int ndims;
        int* dims;
        float* raw;
    };
    
int main(){
struct floatArray* particles = (struct floatArray*)malloc(sizeof(struct floatArray));
particles->initialized = 0;
if (particles->initialized != 0){ printf("array err"); exit(1);}
particles->raw = (float*)malloc((2)*(3)*sizeof(float));
particles->ndims = 2;
particles->dims = (int*)malloc(2*sizeof(int));
particles->dims[0] = 2;particles->dims[1] = 3;
particles->raw[(0*(1*particles->dims[1]))+(0*(1))] = 1.0;
particles->raw[(1*(1*particles->dims[1]))+(0*(1))] = -1.0;
free(particles->raw);free(particles->dims);free(particles);
}
