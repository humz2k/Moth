#include <stdlib.h>
#include <stdio.h>
#include <math.h>

struct intArray {
    int initialized;
    int ndims;
    int* dims;
    int* raw;
};
        int Mothtest3(struct intArray* b){

return 10;

}
void Mothtest(struct intArray* b){

b->raw[(0*1*(b->dims[1]))+(0*1)] = Mothtest3(b);

}
int Mothmain(){
struct intArray* a;
a = (struct intArray*)malloc(sizeof(struct intArray));
a->dims = (int*)malloc(2*sizeof(int));
a->dims[0] = 1;a->dims[1] = 3;
a->raw = (int*)malloc(1*3*sizeof(int));
Mothtest(a);
printf("%d",a->raw[(0*1*(a->dims[1]))+(0*1)]);printf("%s","\n");
free(a->dims);free(a->raw);free(a);
return 0;

}

int main() { return Mothmain();}
