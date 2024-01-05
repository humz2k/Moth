#include <stdlib.h>
#include <stdio.h>
#include "llvm_backend/moth_llvm.h"

#include "llvm_backend/tables/int_table.h"
int test_int_table(void){

    int_table table = make_int_table();

    insert_int_table(table,"HI!",1023);
    insert_int_table(table,"a",2);

    int test;
    if (!get_int_table(table,"HI!",&test)){
        printf("Couldn't find HI!\n");
    }
    printf("HI! = %d\n",test);

    if (!get_int_table(table,"a",&test)){
        printf("Couldn't find a\n");
    }
    printf("a = %d\n",test);

    if(!delete_int_table(table,"HI!")){
        printf("couldn't delete HI!\n");
    }

    if (!get_int_table(table,"HI!",&test)){
        printf("Couldn't find HI!\n");
    }

    if (!get_int_table(table,"a",&test)){
        printf("Couldn't find a\n");
    }
    printf("a = %d\n",test);

    return 1;

}

int yyparse(void);
int yylex(void);
extern FILE* yyin;

int main(int argc, char** argv){

    if (argc == 1)return -1;

    test_int_table();

    FILE* fp = fopen(argv[1], "r");
    yyin = fp;
    yyparse();
    fclose(fp);

    return compile();
}
