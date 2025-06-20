#include "stdio.h"
#include "pthread.h"
#include "stdlib.h"

#define CORES 112
#define ITERATIONS 500000000

typedef struct {
  int init;
  int res;
} packet;

void* micro(void* val) {
  packet * data = (packet*)(val);
  int init = data->init;
  int ret = 0;
  for(int i = 0; i < ITERATIONS; i++) {
    int res[16];
    asm volatile(
       "vpbroadcastd %1 , %%zmm1 \n\t"
       "vpmulld %%zmm1, %%zmm1, %%zmm1 \n\t"
       "vfmadd231ps %%zmm1, %%zmm1, %%zmm1 \n\t"
       "vfmadd231ps %%zmm1, %%zmm1, %%zmm1 \n\t"
       "vmovdqu64 %%zmm1 , %0 \n\t"
     : "=m"(*res)
     : "r"(init)
     : "%zmm1"
    );
    ret += res[i & 7];
  }
  data->res = ret;
  return data;
}
int main() {
  int res = 0;
  pthread_t workers[CORES];
  char * mem = (char*)malloc(sizeof(packet)*CORES);
  for(int i = 0; i < CORES; i++) {
    packet * workitem = (packet*)(mem + sizeof(packet)*i); 
    workitem->init = i*1000;
  } 
  for(int i = 0; i < CORES; i++) {
     pthread_create(&workers[i], NULL, micro, (void*)(mem + sizeof(packet)*i));
  }
  for(int i = 0; i < CORES; i++) {
     pthread_join(workers[i], NULL);
  }
  // Accumulate the results;
  for(int i = 0; i < CORES; i++) {
    packet * workitem = (packet*)(mem + sizeof(packet)*i); 
    res += workitem->res;
  } 
  printf("[RES] %d\n", res);
  return res;
}

