
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

struct intArray {
    int initialized;
    int ndims;
    int* dims;
    int* raw;
};

struct intList {

    int val;
    int terminator;
    struct intList* next;
};
int* indexintList(struct intList* input, int index) {

    struct intList* indexer = input;
    if (index == 0){
        return &indexer->val;
    }
    for (int i = 0; i < index; i++){
        if (indexer->terminator == 1){
            printf("LIST ERROR: index out of range in list typeint\n");
            exit(1);
        }
        indexer = indexer->next;
    }
    return &indexer->val;
}

struct voidArray {
    int initialized;
    int ndims;
    int* dims;
    void* raw;
};
int Mothmain(){
struct intList* a;struct intArray* b;
a = (struct intList*)malloc(sizeof(struct intList));
a->terminator = 1;
struct intList* Moth_tmp_a = a;
Moth_tmp_a->val = 1;
Moth_tmp_a->terminator = 0;
Moth_tmp_a->next = (struct intList*)malloc(sizeof(struct intList));
Moth_tmp_a = Moth_tmp_a->next;
Moth_tmp_a->val = 2;
Moth_tmp_a->terminator = 0;
Moth_tmp_a->next = (struct intList*)malloc(sizeof(struct intList));
Moth_tmp_a = Moth_tmp_a->next;
Moth_tmp_a->val = 3;
Moth_tmp_a->terminator = 0;
Moth_tmp_a->next = (struct intList*)malloc(sizeof(struct intList));
Moth_tmp_a = Moth_tmp_a->next;
Moth_tmp_a->val = 4;
Moth_tmp_a->terminator = 0;
Moth_tmp_a->next = (struct intList*)malloc(sizeof(struct intList));
Moth_tmp_a = Moth_tmp_a->next;
Moth_tmp_a->val = 5;
Moth_tmp_a->terminator = 1;
;
*(indexintList(a,3)) = (*(indexintList(a,1))) + (*(indexintList(a,4)));
printf("%d",*(indexintList(a,3)));printf("%s",",");printf("%d",*(indexintList(a,1)));printf("%s",",");printf("%d",*(indexintList(a,4)));printf("%s","\n");
b = (struct intArray*)malloc(sizeof(struct intArray));
b->dims = (int*)malloc(2*sizeof(int));
b->dims[0] = 1;b->dims[1] = 3;
b->raw = (int*)malloc(1*3*sizeof(int));
b->raw[(0*1*(b->dims[1]))+(0*1)] = ((*(indexintList(a,0))) + (*(indexintList(a,1)))) + (*(indexintList(a,2)));
printf("%d",b->raw[(0*1*(b->dims[1]))+(0*1)]);printf("%s","\n");
return 0;

}

int main() { return Mothmain();}
