#include <string.h>

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
struct charArray; typedef struct charArray charArray;
struct charList; typedef struct charList charList;struct intArray; typedef struct intArray intArray;
struct intList; typedef struct intList intList;struct voidArray; typedef struct voidArray voidArray;
struct Mothstring;typedef struct Mothstring Mothstring;

struct charArray {
    int initialized;
    int ndims;
    int* dims;
    char* raw;
}; 

struct charList {

    char val;
    int terminator;
    int initialized;
    struct charList* next;
};
char* indexcharList(charList* input, int index) {

    charList* indexer = input;
    if (indexer->initialized == 0){
        printf("LIST INDEX ERROR: index out of range in list typechar\n");
        exit(1);
    }
    if (index == 0){
        return &indexer->val;
    }
    for (int i = 0; i < index; i++){
        if (indexer->terminator == 1){
            printf("LIST INDEX ERROR: index out of range in list typechar\n");
            exit(1);
        }
        indexer = indexer->next;
    }
    return &indexer->val;
}
void appendcharList(charList* input, char new_val) {

    charList* indexer = input;
    if (indexer->initialized == 0){
        indexer->val = new_val;
        indexer->initialized = 1;
        return;
    }
    while (indexer->terminator == 0){
        indexer = indexer->next;
    }
    indexer->next = (charList*)malloc(sizeof(charList));
    indexer->terminator = 0;
    indexer = indexer->next;
    indexer->val = new_val;
    indexer->terminator = 1;

}

void insertcharList(charList* input, char new_val, int index) {

    charList* indexer = input;
    if (indexer->initialized == 0){
        if (index != 0){
            printf("LIST INSERT ERROR: index out of range in list type char\n");
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
        printf("LIST INSERT ERROR: index out of range in list type char\n");
        exit(1);
    }
    charList* temp = (charList*)malloc(sizeof(charList));
    temp->next = indexer->next;
    temp->terminator = indexer->terminator;
    temp->val = indexer->val;
    indexer->next = temp;
    indexer->terminator = 0;
    indexer->val = new_val;
    indexer->initialized = 1;

}

void removecharList(charList* input, int index) {

    charList* indexer = input;
    charList* temp;
    if (indexer->initialized == 0){
        printf("LIST REMOVE ERROR: index out of range in list typechar\n");
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
        printf("LIST REMOVE ERROR: index out of range in list typechar\n");
        exit(1);
    }
    temp = indexer->next->next;
    free(indexer->next);
    indexer->next = temp;

}

int lencharList(charList* input) {

    charList* indexer = input;
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
char popcharList(charList* input) {

    charList* indexer = input;
    if(indexer->terminator == 1){
        return indexer->val;
    }
    while (indexer->next->terminator == 0){
        indexer = indexer->next;
    }
    char out_val = indexer->next->val;
    free(indexer->next);
    indexer->terminator = 1;
    return out_val;

}

struct intArray {
    int initialized;
    int ndims;
    int* dims;
    int* raw;
}; 

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
struct Mothstring{
charArray* raw;int length;

};
void OBJECT_string_Moth__init__(Mothstring* self,const char * input){

self->length = strlen(input);
self->raw = (charArray*)malloc(sizeof(charArray));
self->raw->dims = (int*)malloc(1*sizeof(int));
self->raw->dims[0] = (self->length) + (1);
self->raw->raw = (char*)malloc((self->length) + (1)*sizeof(char));
strcpy(self->raw->raw,input);

}

void OBJECT_string_Moth__print__(Mothstring* self){

printf("%s",self->raw->raw);

}

void OBJECT_string_Moth__free__(Mothstring* self){

free(self->raw->dims);free(self->raw->raw);free(self->raw);

}

void OBJECT_string_Mothset_idx(Mothstring* self,int index,const char * input){

self->raw->raw[(index*1)] = input[0];

}

void OBJECT_string_Mothset(Mothstring* self,const char * input){

free(self->raw->dims);free(self->raw->raw);free(self->raw);
self->length = strlen(input);
self->raw = (charArray*)malloc(sizeof(charArray));
self->raw->dims = (int*)malloc(1*sizeof(int));
self->raw->dims[0] = (self->length) + (1);
self->raw->raw = (char*)malloc((self->length) + (1)*sizeof(char));
strcpy(self->raw->raw,input);

}

Mothstring* OBJECT_string_Mothget_slice(Mothstring* self,int start,int end){
int new_len;Mothstring* new_string;int i;
new_len = (end) - (start);
new_string = (Mothstring*)malloc(sizeof(Mothstring));OBJECT_string_Moth__init__(new_string,"");
free(new_string->raw->dims);free(new_string->raw->raw);free(new_string->raw);
new_string->length = new_len;
new_string->raw = (charArray*)malloc(sizeof(charArray));
new_string->raw->dims = (int*)malloc(1*sizeof(int));
new_string->raw->dims[0] = (new_len) + (1);
new_string->raw->raw = (char*)malloc((new_len) + (1)*sizeof(char));
new_string->raw->raw[(new_len*1)] = self->raw->raw[(self->length*1)];
for (i = 0;i < new_len;i = i + 1){

new_string->raw->raw[(i*1)] = self->raw->raw[((i) + (start)*1)];

}

return new_string;

}

void OBJECT_string_Mothslice(Mothstring* self,int start,int end){
int new_len;charArray* new_raw;int i;
new_len = (end) - (start);
new_raw = (charArray*)malloc(sizeof(charArray));
new_raw->dims = (int*)malloc(1*sizeof(int));
new_raw->dims[0] = (new_len) + (1);
new_raw->raw = (char*)malloc((new_len) + (1)*sizeof(char));
new_raw->raw[(new_len*1)] = self->raw->raw[(self->length*1)];
for (i = 0;i < new_len;i = i + 1){

new_raw->raw[(i*1)] = self->raw->raw[((i) + (start)*1)];

}

free(self->raw->dims);free(self->raw->raw);free(self->raw);
self->raw = new_raw;
self->length = new_len;

}

void OBJECT_string_Mothcopy(Mothstring* self,Mothstring* other){
int i;
free(self->raw->dims);free(self->raw->raw);free(self->raw);
self->length = other->length;
self->raw = (charArray*)malloc(sizeof(charArray));
self->raw->dims = (int*)malloc(1*sizeof(int));
self->raw->dims[0] = (self->length) + (1);
self->raw->raw = (char*)malloc((self->length) + (1)*sizeof(char));
for (i = 0;i < (self->length) + (1);i = i + 1){

self->raw->raw[(i*1)] = other->raw->raw[(i*1)];

}


}

Mothstring* OBJECT_string_Moth__addself__(Mothstring* self,Mothstring* other){
int new_len;charArray* new_raw;int i;
new_len = (self->length) + (other->length);
new_raw = (charArray*)malloc(sizeof(charArray));
new_raw->dims = (int*)malloc(1*sizeof(int));
new_raw->dims[0] = (new_len) + (1);
new_raw->raw = (char*)malloc((new_len) + (1)*sizeof(char));
for (i = 0;i < self->length;i = i + 1){

new_raw->raw[(i*1)] = self->raw->raw[(i*1)];

}

for (i = 0;i < (other->length) + (1);i = i + 1){

new_raw->raw[((i) + (self->length)*1)] = other->raw->raw[(i*1)];

}

free(self->raw->dims);free(self->raw->raw);free(self->raw);
self->length = new_len;
self->raw = new_raw;
return self;

}

Mothstring* OBJECT_string_Moth__mulself__(Mothstring* self,int amount){
int new_len;charArray* new_raw;int i;
new_len = (self->length) * (amount);
new_raw = (charArray*)malloc(sizeof(charArray));
new_raw->dims = (int*)malloc(1*sizeof(int));
new_raw->dims[0] = (new_len) + (1);
new_raw->raw = (char*)malloc((new_len) + (1)*sizeof(char));
new_raw->raw[(new_len*1)] = self->raw->raw[(self->length*1)];
for (i = 0;i < amount;i = i + 1){
int start;int j;
start = (self->length) * (i);
for (j = 0;j < self->length;j = j + 1){

new_raw->raw[((j) + (start)*1)] = self->raw->raw[(j*1)];

}


}

free(self->raw->dims);free(self->raw->raw);free(self->raw);
self->length = new_len;
self->raw = new_raw;
return self;

}

int Mothmain(){
Mothstring* test;Mothstring* slice;
test = (Mothstring*)malloc(sizeof(Mothstring));OBJECT_string_Moth__init__(test,"test");
OBJECT_string_Moth__print__(test);printf("%s","\n");
slice = OBJECT_string_Mothget_slice(test,0,3);
OBJECT_string_Moth__print__(slice);printf("%s","\n");
OBJECT_string_Mothslice(test,0,test->length);
OBJECT_string_Moth__print__(test);printf("%s","\n");
OBJECT_string_Mothcopy(test,slice);
OBJECT_string_Moth__print__(test);printf("%s","\n");
OBJECT_string_Moth__addself__(test,slice);
OBJECT_string_Moth__print__(test);printf("%s","\n");
OBJECT_string_Moth__mulself__(test,3);
OBJECT_string_Moth__print__(test);printf("%s","\n");
return 0;

}

int main() { return Mothmain();}
