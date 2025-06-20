#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <assert.h>
#include <signal.h>

#define __GNU_SOURCE
#include <unistd.h>

typedef struct _large_atomic {
   int _field1;
   int _field2;
   int _field3;
   int _field4;
} large_atomic;

void fall_back_handler_func(int tid) {
   printf("[tid=%d] RTM Aborted\n", tid);
}


#define REG_RIP 16
#define REG_RDX 12

void sig_action(int sig, siginfo_t* si, void* ucontext) {
   printf("Called Signal Hnalder\n");
   ucontext_t* const uc = (ucontext_t*) ucontext;
   if (sig == SIGSEGV) {
     printf("Caught SIGSEGV\n");
     printf("RIP = %p\n", (intptr_t*)uc->uc_mcontext.gregs[REG_RIP]);
   } else if (sig == SIGABRT) {
     printf("Caught SIGABRT\n");
   }
}

void* micro1(void * obj) {
   large_atomic * lobj = (large_atomic*)obj;
   pid_t tid = gettid();   
   printf("[tid] : %d \n" , tid);
   for (int i = 0; i < 10; i++) {
     asm volatile (
        "jmp 0f \n\t" 
        "1:  \n\t"
        "movl %1, %%edi \n\t"
        "call fall_back_handler_func \n\t"
        "jmp 2f  \n\t"
        "0: \n\t"
        "xbegin  1b \n\t"
        "movq %0, %%rax \n\t"
        "movl $10, (%%rax) \n\t"
        "movl $20, 0x4(%%rax) \n\t"
        "movl $30, 0x8(%%rax) \n\t"
        "movl $40, 0xc(%%rax) \n\t"
        "xend     \n\t"
        "2: \n\t"
      : : "m"(lobj), "r"(tid) : "%rax", "%edi"
     );
   }
}
void* micro2(void * obj) {
   large_atomic * lobj = (large_atomic*)obj;
   pid_t tid = gettid();   
   printf("[tid] : %d \n" , tid);
   for (int i = 0; i < 10; i++) {
     asm volatile (
        "jmp 0f \n\t" 
        "1:  \n\t"
        "movl %1, %%edi \n\t"
        "call fall_back_handler_func \n\t"
        "jmp 2f  \n\t"
        "0: \n\t"
        "xbegin  1b \n\t"
        "movq %0, %%rax \n\t"
        "movl $100, (%%rax) \n\t"
        "movl $200, 0x4(%%rax) \n\t"
        "movl $300, 0x8(%%rax) \n\t"
        "movl $400, 0xc(%%rax) \n\t"
        "xend     \n\t"
        "2: \n\t"
      : : "m"(lobj), "r"(tid) : "%rax", "%edi"
     );
   }
}

void* micro3(void * obj) {
   large_atomic * lobj = (large_atomic*)obj;
   pid_t tid = gettid();   
   printf("[tid] : %d \n" , tid);
   for (int i = 0; i < 10; i++) {
     asm volatile (
        "jmp 0f \n\t" 
        "1:  \n\t"
        "movl %1, %%edi \n\t"
        "call fall_back_handler_func \n\t"
        "jmp 2f  \n\t"
        "0: \n\t"
        "xbegin  1b \n\t"
        "movq %0, %%rax \n\t"
        "movl $1000, (%%rax) \n\t"
        "movl $2000, 0x4(%%rax) \n\t"
        "movl $3000, 0x8(%%rax) \n\t"
        "movl $4000, 0xc(%%rax) \n\t"
        "xend     \n\t"
        "2: \n\t"
      : : "m"(lobj), "r"(tid) : "%rax", "%edi"
     );
   }
}
void* micro4(void * obj) {
   large_atomic * lobj = (large_atomic*)obj;
   pid_t tid = gettid();   
   printf("[tid] : %d \n" , tid);
   for (int i = 0; i < 10; i++) {
     asm volatile (
        "jmp 0f \n\t" 
        "1:  \n\t"
        "movl %1, %%edi \n\t"
        "call fall_back_handler_func \n\t"
        "jmp 2f  \n\t"
        "0: \n\t"
        "xbegin  1b \n\t"
        "movq %0, %%rax \n\t"
        "movl $10000, (%%rax) \n\t"
        "movl $20000, 0x4(%%rax) \n\t"
        "movl $30000, 0x8(%%rax) \n\t"
        "movl $40000, 0xc(%%rax) \n\t"
        "xend     \n\t"
        "2: \n\t"
      : : "m"(lobj), "r"(tid) : "%rax", "%edi"
     );
   }
}

int main() {
  struct sigaction act;
  memset(&act, 0, sizeof(act));
  act.sa_sigaction = sig_action;
  act.sa_flags = SA_SIGINFO | SA_RESTART;
  sigemptyset(&act.sa_mask);
  sigaction(SIGSEGV, &act, NULL);
  sigaction(SIGABRT, &act, NULL);

  pthread_t t1;
  pthread_t t2;
  pthread_t t3;
  pthread_t t4;
  large_atomic obj = {0,0,0,0};

  pthread_create(&t1, NULL, micro1, (void*)&obj);
  pthread_create(&t2, NULL, micro2, (void*)&obj);
  pthread_create(&t3, NULL, micro3, (void*)&obj);
  pthread_create(&t4, NULL, micro4, (void*)&obj);

  pthread_join(t1, NULL);
  pthread_join(t2, NULL);
  pthread_join(t3, NULL);
  pthread_join(t4, NULL);

  printf("large_atomic._field1 = %d\n", obj._field1);
  printf("large_atomic._field2 = %d\n", obj._field2);
  printf("large_atomic._field3 = %d\n", obj._field3);
  printf("large_atomic._field4 = %d\n", obj._field4);
  return 0;
}
