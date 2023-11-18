#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <iostream>

int yyparse();
extern "C" int yylex();
extern FILE* yyin;

int main(int argc, char *argv[]){
    if (argc == 1)return -1;

    FILE* fp = fopen(argv[1], "r");
    yyin = fp;
    yyparse();
    fclose(fp);

    return 0;
}