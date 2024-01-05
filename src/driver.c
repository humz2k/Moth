#include <stdlib.h>
#include <stdio.h>
#include "llvm_backend/moth_llvm.h"

#include "llvm_backend/tables/int_table.h"

void print_entry(int_table table, const char* key){
    int test;
    if (!get_int_table(table,key,&test)){
        printf("Couldn't find %s\n",key);
    } else{
        printf("%s = %d\n",key,test);
    }
}

int test_int_table(void){

    int_table table = make_int_table();

    insert_int_table(table,"HI!",1023);
    update_int_table(table,"a",2);

    print_entry(table,"HI!");
    print_entry(table,"a");

    if(!delete_int_table(table,"HI!")){
        printf("couldn't delete HI!\n");
    }

    print_entry(table,"HI!");
    print_entry(table,"a");
    
    update_int_table(table,"a",10);

    print_entry(table,"HI!");
    print_entry(table,"a");

    int_table new_table = copy_int_table(table);

    print_entry(new_table,"HI!");
    print_entry(new_table,"a");

    update_int_table(table,"a",5);

    print_entry(table,"HI!");
    print_entry(table,"a");

    print_entry(new_table,"HI!");
    print_entry(new_table,"a");

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
