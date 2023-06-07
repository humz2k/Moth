#include <stdlib.h>
#include <stdio.h>
#include "../bdwgc/include/gc.h"

int* __allocFile__(){
    int* out = GC_malloc(sizeof(FILE*));
    return out;
}

void __openFile__(int* voidfp, const char* filename, const char* mode){
    FILE** fp = (FILE**)voidfp;
    *fp = fopen(filename,mode);
}

void __writeLine__(int* voidfp, const char* line){
    FILE** fp = (FILE**)voidfp;
    fprintf(*fp, "%s", line);
}

void __closeFile__(int* voidfp){
    FILE** fp = (FILE**)voidfp;
    fclose(*fp);
}

char* __readFile__(int* voidfp){
    FILE** fp = (FILE**)voidfp;
    rewind(*fp);
    int len = 0;
    while (!feof(*fp)) {
        char ch = fgetc(*fp);
        len++;
    }
    char* out = GC_malloc(len*sizeof(char));
    out[len-1] = '\0';
    rewind(*fp);
    for (int i = 0; i < (len-1); i++){
        char ch = fgetc(*fp);
        out[i] = ch;
    }
    return out;
}