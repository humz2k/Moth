#include <stdlib.h>
#include <stdio.h>
#include <time.h>

void fill(float* arr, int n){
    for (int i = 0; i < n; i++){
        arr[i] = (float)rand()/(float)RAND_MAX;
    }
}

inline float sum(const float* restrict arr, const int n){
    float total = 0;
    const float* restrict tmp = arr;
    for (int i = 0; i < n; i++){
        total = total + *arr++;
    }
    return total;
}

int main(){
    srand(21082001);
    int n = 1000000;
    float* arr = (float*)malloc(n * sizeof(float));
    fill(arr,n);
    clock_t start = clock();
    float out = sum(arr,n);
    clock_t end = clock();
    float time = ((float)(end-start))/((float)CLOCKS_PER_SEC);
    printf("Time: %fs, total %f\n",time,out);
    free(arr);
}