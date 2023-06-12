#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
 
// Driver Code
int check_match(const char* regex, const char* str){
    regex_t reegex;
    if (regcomp(&reegex,regex,0) != 0){
        printf("regex compilation error\n");
        exit(1);
    }
    if (regexec(&reegex,str,0,NULL,0) == 0){
        return 1;
    }
    return 0;
}