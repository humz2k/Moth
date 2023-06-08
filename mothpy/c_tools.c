#include <time.h>
#include <stdlib.h>

#include <sys/time.h>
#define USECPSEC 1000000ULL

clock_t get_clocks_per_sec(){
    return CLOCKS_PER_SEC;
}

int rand_max(){
    return RAND_MAX;
}

//#define check

typedef unsigned long long CPUTimer_t;

unsigned long long CPUTimer(){

  struct timeval tv;
  gettimeofday(&tv, 0);
  return ((tv.tv_sec*USECPSEC)+tv.tv_usec);
}