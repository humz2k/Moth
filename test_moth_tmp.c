
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
struct intArray; typedef struct intArray intArray;
struct intList; typedef struct intList intList;struct voidArray; typedef struct voidArray voidArray;

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
int* indexintList(intList* input, int index) {

    intList* indexer = input;
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
void appendintList(intList* input, int new_val) {

    intList* indexer = input;
    while (indexer->terminator == 0){
        indexer = indexer->next;
    }
    indexer->next = (intList*)malloc(sizeof(intList));
    indexer->terminator = 0;
    indexer = indexer->next;
    indexer->val = new_val;
    indexer->terminator = 1;

}

struct voidArray {
    int initialized;
    int ndims;
    int* dims;
    void* raw;
}; 
int Mothmain(){
intList* stack;
stack = (intList*)malloc(sizeof(intList));
stack->terminator = 1;
intList* Moth_tmp_stack = stack;
Moth_tmp_stack->val = 1;
Moth_tmp_stack->terminator = 1;
;
appendintList(stack,0);
printf("%d",(*(indexintList(stack,1))));printf("%s","\n");
return 0;

}

int main() { return Mothmain();}
