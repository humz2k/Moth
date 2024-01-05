#include <stdlib.h>
#include <stdio.h>
#include "llvm_backend/moth_llvm.h"

int yyparse(void);
int yylex(void);
extern FILE* yyin;

int main(int argc, char** argv){

    if (argc == 1)return -1;

    FILE* fp = fopen(argv[1], "r");
    yyin = fp;
    yyparse();
    fclose(fp);

    return compile();
}
