#include <stdlib.h>
#include <stdio.h>
#include <math.h>
int main(){
int* i = (int*)malloc(sizeof(int)*(10));
free(i);
}
