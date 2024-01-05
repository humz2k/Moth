#include <stdlib.h>
#include <stdio.h>
//#include "llvm_backend/moth_llvm.h"
#include "gc.h"
#include <string.h>
#include "error.h"

int yyparse(void);
int yylex(void);
extern FILE* yyin;

char* current_moth_file;

char* split_filename(const char* name){
    char* out = GC_MALLOC(sizeof(char) * (strlen(name) + 1));
    strcpy(out,name);
    return strtok(out,".");
}

int main(int argc, char** argv){

    if (argc == 1){
        return -1;
    }

    FILE* fp = fopen(argv[1], "r");
    
    current_moth_file = split_filename(argv[1]);

    yyin = fp;
    yyparse();
    fclose(fp);

    return 0;//compile();
}
