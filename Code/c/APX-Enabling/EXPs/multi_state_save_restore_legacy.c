
#include "stdio.h"
#include "unistd.h"
#include "pthread.h"
#include "stdlib.h"
#include "string.h"
#include "sys/types.h"

#define PRINT(...) \
  do { \
    fprintf(stdout, "[TID=%lu] ", pthread_self()); \
    fprintf(stdout, __VA_ARGS__);                  \
    fflush(stdout);                                \
  } while(0)

typedef struct _gprs {
  long r8;
  long r9;
  long r10;
  long r11;
  long r12;
  long r13;
  long r14;
  long r15;
} gprs;

void* func(void * data) {
  gprs restore_data;
  memset((char*)&restore_data, 0, sizeof(gprs));
  void* dest = &restore_data;
  PRINT("Entered function..\n");
  PRINT("Saving EGPR state..\n");
  PRINT("Sleeping..\n");
  asm volatile (
     "movq %1 ,          %%rsi \n\t"
     "movq 0x0(%%rsi),   %%r8 \n\t"     
     "movq 0x8(%%rsi),   %%r9 \n\t"     
     "movq 0x10(%%rsi),  %%r10 \n\t"     
     "movq 0x18(%%rsi),  %%r11 \n\t"     
     "movq 0x20(%%rsi),  %%r12 \n\t"     
     "movq 0x28(%%rsi),  %%r13 \n\t"     
     "movq 0x30(%%rsi),  %%r14 \n\t"     
     "movq 0x38(%%rsi),  %%r15 \n\t"     
     "caller saved..."
     "movl $10, %edi,          \n\t"
     "call sleep               \n\t"
     "movq %0 ,          %%rax \n\t"
     "movq %%r8,  0x0(%%rax) \n\t"     
     "movq %%r9,  0x8(%%rax) \n\t"     
     "movq %%r10, 0x10(%%rax) \n\t"     
     "movq %%r11, 0x18(%%rax) \n\t"     
     "movq %%r12, 0x20(%%rax) \n\t"     
     "movq %%r13, 0x28(%%rax) \n\t"     
     "movq %%r14, 0x30(%%rax) \n\t"     
     "movq %%r15, 0x38(%%rax) \n\t"     
    : "=r"(dest) 
    : "r"(data)
    : "%r15", "%r14", "%r13", "%r12" , "%r11", "%r10" , "%r9", "%r8", "%rsi", "%rdi", "%rax"
  );
  PRINT("Wakeup..\n");
  PRINT("Restored EGPR state..\n");
  for (int i = 0; i < sizeof(gprs)/sizeof(long); i++) {
     long saved = *((long*)((char*)data + sizeof(long)*i));
     long restore = *((long*)((char*)&restore_data + sizeof(long)*i));
     if (saved != restore) {
        char reg[16] = {'\0'};
        sprintf(reg, "%%r%d", i + 8);
        PRINT("Incorrect %s restoration => saved[=%ld] : restored[=%ld]\n", reg, saved, restore);
     }
  }
  PRINT("Successful state restoration..\n");
  return 0;
}

int main(int argc, char* argv[]) {
  if (argc != 2) {
    printf("Incorrect Arguments!\n");
    return -1;
  }
  int threads = atoi(argv[1]);
  printf("Thread Count = %d\n", threads);
  pthread_t tids[threads];
  for (int i = 0; i < threads; i++) {
     gprs data;
     memset((char*)&data, 0, sizeof(gprs));
     for (int j = 0; j < sizeof(gprs)/sizeof(long); j++) {
       *((long*)((char*)&data + j * sizeof(long))) = j + i*sizeof(gprs);
     }
     pthread_create(&tids[i], 0x0, func, &data);
     //func(&data);
  }
  for (int i = 0; i < threads; i++) {
     pthread_join(tids[i], 0x0);
  } 
  return 0;
}
