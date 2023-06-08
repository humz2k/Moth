#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include "../bdwgc/include/gc.h"

//#define MUTEX_LOCK

#ifdef MUTEX_LOCK
pthread_mutex_t Lock;
#endif

struct real_thread_data
{
  int thread_id;
  int fake_per_real;
  int n_fake;
  void* functionPtr;
  void* args;
};

void test(){

}

void *__launch_fake(void* restrict threadarg)
{
    struct real_thread_data my_data;   

    my_data = *((struct real_thread_data *) threadarg);
    int real_id = my_data.thread_id;
    int fake_per_real = my_data.fake_per_real;
    int n_fake = my_data.n_fake;
    int fake_start = real_id * fake_per_real;

    void (*kernelPtr)(int,int,void*) = my_data.functionPtr;
    //void (realKernelPtr)(int,int,void*) = *kernelPtr;

    //printf("Real Thread ID : %d, Fake start: %d\n",real_id,fake_start);
    //int fake_start = 0;
    //int fake_per_real = 20;
    //int n_fake = 100;
    for (int idx = fake_start; idx < fake_start + fake_per_real; idx++){
        if (idx < n_fake){
            #ifdef MUTEX_LOCK
            pthread_mutex_lock(&Lock);
            #endif
            (*kernelPtr)(idx,real_id,my_data.args);
            #ifdef MUTEX_LOCK
            pthread_mutex_unlock(&Lock);
            #endif
            //test();
        }
    }
    //free(my_data.args);
    //free(threadarg);
    pthread_exit(NULL);
    
    //printf("Done : %d\n",my_data->thread_id);
    //return NULL;
}

void __launch_threads(int nReal, int nFake, void* kernelPtr, void* args){

    pthread_t threads[nReal];

    struct real_thread_data td[nReal];
    #ifdef MUTEX_LOCK
    if (pthread_mutex_init(&Lock, NULL))
    {
        perror("pthread_mutex_init failed!");
        return;
    }
    #endif

    int fake_per_real = (nFake + nReal - 1)/nReal;

    int count = 0;

    char* args_ptr = (char*)args;

    for (int i = 0; i < nReal; i++){
        //struct real_thread_data* td = GC_malloc(sizeof(struct real_thread_data));
        td[i].thread_id = i;
        td[i].fake_per_real = fake_per_real;
        td[i].n_fake = nFake;
        td[i].functionPtr = kernelPtr;
        if (i * fake_per_real >= nFake){
            break;
        }
       //char* tmp_args = GC_malloc(sizeofargs);
       // for (int j = 0; j < sizeofargs; j++){
       //     tmp_args[j] = args_ptr[j];
       // }
        td[i].args = args;
        int rc = pthread_create(&threads[i], NULL, __launch_fake, &td[i]);
        if (rc){
            perror("pthred_create failed!");
        }
        count++;
    }
    //printf("COUNT %d\n",count);
    for(int i = 0; i < count; i++){
        if(pthread_join(threads[i],NULL)){
            perror("pthred_join failed!");
        }
    }

}