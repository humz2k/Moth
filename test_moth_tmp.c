
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <complex.h>
#include <stdarg.h>
struct intArray; typedef struct intArray intArray;
struct intList; typedef struct intList intList;struct voidArray; typedef struct voidArray voidArray;


#define __MothprintComplex(a) printf("%f + %fi",creal(a),cimag(a))

void get_index(int idx1d, int ndims, int* dims, int* out){
    int* muls = (int*)malloc(ndims*sizeof(int));
    int dim;
    for (dim = 0; dim < ndims; dim++){
        muls[dim] = 1;
        int start = dim+1;
        for (int i = start; i < ndims; i++){
            muls[dim] = muls[dim] * dims[i];
        }
    }
    for (dim = 0; dim < ndims; dim++){
        int start = dim - 1;
        int idx = idx1d;
        for (int i = start; i > 0; i--){
            idx -= out[i]*muls[i];
        }
        idx = idx / muls[dim];
        out[dim] = idx;
    }
    free(muls);
}


struct intArray {
    int initialized;
    int ndims;
    int* dims;
    int* raw;
}; 

intArray* reshapeintArray(intArray* input, int new_ndims, ...){
    int* new_dims = (int*)malloc(new_ndims*sizeof(int));
    int new_tot = 1;
    va_list argp;
    va_start(argp, new_ndims);
    int i;
    for (i = 0; i < new_ndims; i++){
        new_dims[i] = va_arg(argp,int);
        new_tot = new_tot * new_dims[i];
    }
    va_end(argp);
    int current_tot = 1;
    for (i = 0; i < input->ndims; i++){
        current_tot = current_tot*(input->dims[i]);
    }
    if (current_tot != new_tot){
        printf("ARRAY ERROR: Can't reshape array of shape [");
        for (i = 0; i < (input->ndims - 1); i++){
            printf("%d,",input->dims[i]);
        }
        printf("%d] to array of shape [",input->dims[input->ndims - 1]);
        for (i = 0; i < (new_ndims - 1); i++){
            printf("%d,",new_dims[i]);
        }
        printf("%d]\n",new_dims[new_ndims-1]);
        exit(1);
    }
    input->ndims = new_ndims;
    free(input->dims);
    input->dims = new_dims;
    return input;

}


void printintArray(intArray* input){
    int i; int j;
    int tot = 1;
    int* indexes = (int*)malloc((input->ndims)*sizeof(int));
    int* last = (int*)malloc((input->ndims)*sizeof(int));
    for (i = 0; i < input->ndims; i++){
        tot = tot*(input->dims[i]);
        last[i] = 0;
    }
    for (i = 0; i < input->ndims; i++){
        printf("[");
    }
    for (i = 0; i < tot; i++){
        get_index(i,input->ndims,input->dims,indexes);
        for (j = 0; j < (input->ndims -1); j++){
            if (last[j] != indexes[j]){
                printf("]");
            }
        }
        for (j = 0; j < (input->ndims -1); j++){
            if (last[j] != indexes[j]){
                if (j == 0){
                    printf("\n [");
                }else{
                    printf("[");
                }
            }
            else{
                if (i != 0){
                    printf(" ");
                }
            }
            last[j] = indexes[j];
        }
        printf("%3d",input->raw[i]);
        //for (j = 0; j < input->ndims; j++){
        //    if ((indexes[j] == (input->dims[j]-1)) && (last[j] != indexes[j])){
        //        printf("]");
        //    }
        //    last[j] = indexes[j];
            //else{
            //    if (last[j] != indexes[j]){
            //        printf(",");
            //        last[j] = indexes[j];
            //    }
            //}
        //}
    }
    for (i = 0; i < input->ndims; i++){
        printf("]");
    }
    printf("\n");
    free(last);
    free(indexes);
}

struct intList {

    int val;
    int terminator;
    int initialized;
    struct intList* next;
};
int* indexintList(intList* input, int index) {

    intList* indexer = input;
    if (indexer->initialized == 0){
        printf("LIST INDEX ERROR: index out of range in list typeint\n");
        exit(1);
    }
    if (index == 0){
        return &indexer->val;
    }
    for (int i = 0; i < index; i++){
        if (indexer->terminator == 1){
            printf("LIST INDEX ERROR: index out of range in list typeint\n");
            exit(1);
        }
        indexer = indexer->next;
    }
    return &indexer->val;
}
void appendintList(intList* input, int new_val) {

    intList* indexer = input;
    if (indexer->initialized == 0){
        indexer->val = new_val;
        indexer->initialized = 1;
        return;
    }
    while (indexer->terminator == 0){
        indexer = indexer->next;
    }
    indexer->next = (intList*)malloc(sizeof(intList));
    indexer->terminator = 0;
    indexer = indexer->next;
    indexer->val = new_val;
    indexer->terminator = 1;

}

void insertintList(intList* input, int new_val, int index) {

    intList* indexer = input;
    if (indexer->initialized == 0){
        if (index != 0){
            printf("LIST INSERT ERROR: index out of range in list type int\n");
            exit(1);
        }
        indexer->val = new_val;
        indexer->initialized = 1;
        indexer->terminator = 1;
        return;
    }
    int count = 0;
    while (indexer->terminator == 0){
        if (count == index){
            break;
        }
        indexer = indexer->next;
        count++;
    }
    if (count != index){
        printf("LIST INSERT ERROR: index out of range in list type int\n");
        exit(1);
    }
    intList* temp = (intList*)malloc(sizeof(intList));
    temp->next = indexer->next;
    temp->terminator = indexer->terminator;
    temp->val = indexer->val;
    indexer->next = temp;
    indexer->terminator = 0;
    indexer->val = new_val;
    indexer->initialized = 1;

}

void removeintList(intList* input, int index) {

    intList* indexer = input;
    intList* temp;
    if (indexer->initialized == 0){
        printf("LIST REMOVE ERROR: index out of range in list typeint\n");
        exit(1);
    }
    if (index == 0){
        if (indexer->terminator == 1){
            indexer->initialized = 0;
            return;
        }
        temp = indexer->next;
        indexer->next = temp->next;
        indexer->terminator = temp->terminator;
        indexer->val = temp->val;
        free(temp);
        return;
    }
    int count = 1;
    while (indexer->terminator == 0){
        if (count == index){
            break;
        }
        indexer = indexer->next;
        count++;
    }
    if (count != index){
        printf("LIST REMOVE ERROR: index out of range in list typeint\n");
        exit(1);
    }
    temp = indexer->next->next;
    free(indexer->next);
    indexer->next = temp;

}

int lenintList(intList* input) {

    intList* indexer = input;
    if (indexer->initialized == 0){
        return 0;
    }
    int count = 1;
    while (indexer->terminator == 0){
        indexer = indexer->next;
        count++;
    }
    return count;

}
int popintList(intList* input) {

    intList* indexer = input;
    if(indexer->terminator == 1){
        return indexer->val;
    }
    while (indexer->next->terminator == 0){
        indexer = indexer->next;
    }
    int out_val = indexer->next->val;
    free(indexer->next);
    indexer->terminator = 1;
    return out_val;

}

struct voidArray {
    int initialized;
    int ndims;
    int* dims;
    void* raw;
}; 

voidArray* reshapevoidArray(voidArray* input, int new_ndims, ...){
    int* new_dims = (int*)malloc(new_ndims*sizeof(int));
    int new_tot = 1;
    va_list argp;
    va_start(argp, new_ndims);
    int i;
    for (i = 0; i < new_ndims; i++){
        new_dims[i] = va_arg(argp,int);
        new_tot = new_tot * new_dims[i];
    }
    va_end(argp);
    int current_tot = 1;
    for (i = 0; i < input->ndims; i++){
        current_tot = current_tot*(input->dims[i]);
    }
    if (current_tot != new_tot){
        printf("ARRAY ERROR: Can't reshape array of shape [");
        for (i = 0; i < (input->ndims - 1); i++){
            printf("%d,",input->dims[i]);
        }
        printf("%d] to array of shape [",input->dims[input->ndims - 1]);
        for (i = 0; i < (new_ndims - 1); i++){
            printf("%d,",new_dims[i]);
        }
        printf("%d]\n",new_dims[new_ndims-1]);
        exit(1);
    }
    input->ndims = new_ndims;
    free(input->dims);
    input->dims = new_dims;
    return input;

}

int Mothmain(){
intArray* a;int i;
a = (intArray*)malloc(sizeof(intArray));
a->dims = (int*)malloc(1*sizeof(int));
a->dims[0] = 12;
a->ndims = 1;
a->raw = (int*)malloc(12*sizeof(int));
for (i = 0;i < 12;i = i + 1){

a->raw[(i*1)] = i;

}

printintArray(a);
reshapeintArray(a,2,3,4);
printintArray(a);
reshapeintArray(a,3,3,4,1);
printintArray(a);
reshapeintArray(a,4,3,2,2,1);
printintArray(a);
free(a->dims);free(a->raw);free(a);
return 0;

}

int main() { return Mothmain();}
