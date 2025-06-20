
#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <assert.h>
#include <signal.h>

#define DEBUG(...) \
  do { \
    assert(td != NULL);                    \
    fprintf(stdout, "[tid=%d]", td->tid);  \
    fprintf(stdout, __VA_ARGS__);          \
    fflush(stdout);                        \
  } while(0);


#define __USE_GNU
#include <ucontext.h>
#define __USE_GNU
#include <sys/ucontext.h>

void* next_pc = NULL;

void signal_handle(int sig) {
   printf("Received Signal => %d\n", sig);
}

#define REG_RIP 16

void sig_action(int sig, siginfo_t* si, void* ucontext) {
   ucontext_t* const uc = (ucontext_t*) ucontext;
   if (sig == SIGSEGV) {
     uc->uc_mcontext.gregs[REG_RIP] = (intptr_t)next_pc;
   }
}

typedef struct _thread_data {
  long* outslice;
  long* inslice;
  int tid;
  int issize;
  int ossize;
} thread_data;


void* kernel(void* data) {
  thread_data* td = (thread_data*)data;
  DEBUG("Entering thread.\n");
  DEBUG("Input slice size = %d.\n", td->issize);
  DEBUG("Output slice size = %d.\n", td->ossize);
  assert(td->ossize == td->issize >> 4);
  for (int i = 0, j = 0; i < td->issize; i+=16, j++) {
      struct sigaction act;
      act.sa_handler = signal_handle;
      act.sa_sigaction = sig_action;
      sigaction(SIGSEGV, &act, NULL);
      asm volatile (
          "movq %2, %%rsi          \n\t"
          "movq 0x0(%%rsi),   %%r16 \n\t"
          "movq 0x8(%%rsi),   %%r17 \n\t"
          "movq 0x10(%%rsi),  %%r18 \n\t"
          "movq 0x18(%%rsi),  %%r19 \n\t"
          "movq 0x20(%%rsi),  %%r20 \n\t"
          "movq 0x28(%%rsi),  %%r21 \n\t"
          "movq 0x30(%%rsi),  %%r22 \n\t"
          "movq 0x38(%%rsi),  %%r23 \n\t"
          "movq 0x40(%%rsi),  %%r24 \n\t"
          "movq 0x48(%%rsi),  %%r25 \n\t"
          "movq 0x50(%%rsi),  %%r26 \n\t"
          "movq 0x58(%%rsi),  %%r27 \n\t"
          "movq 0x60(%%rsi),  %%r28 \n\t"
          "movq 0x68(%%rsi),  %%r29 \n\t"
          "movq 0x70(%%rsi),  %%r30 \n\t"
          "movq 0x78(%%rsi),  %%r31 \n\t"
          "addq $8, %%r16 \n\t"
          "addq $8, %%r17 \n\t"
          "addq $8, %%r18 \n\t"
          "addq $8, %%r19 \n\t"
          "addq $8, %%r20 \n\t"
          "addq $8, %%r21 \n\t"
          "addq $8, %%r22 \n\t"
          "addq $8, %%r23 \n\t"
          "addq $8, %%r24 \n\t"
          "addq $8, %%r25 \n\t"
          "addq $8, %%r26 \n\t"
          "addq $8, %%r27 \n\t"
          "addq $8, %%r28 \n\t"
          "addq $8, %%r29 \n\t"
          "addq $8, %%r30 \n\t"
          "addq $8, %%r31 \n\t"
          "pause          \n\t"
          "pause          \n\t"
          "pause          \n\t"
          "pause          \n\t"
          "pause          \n\t"
          "pause          \n\t"
          "pause          \n\t"
          "pause          \n\t"
          "pause          \n\t"
          "pause          \n\t"
          "pause          \n\t"
          "pause          \n\t"
          "pause          \n\t"
          "pause          \n\t"
          "pause          \n\t"
          "pause          \n\t"
          "pause          \n\t"
          "leaq %1 ,  %%rdi        \n\t"
          "movq $0x0, %%rax        \n\t"
          "leaq 0x0(%%rip), %%rdx  \n\t"
          "addq $0xe, %%rdx       \n\t"
          // Based on base and index register encoding, offset to post
          // signal handling instruction may change, thus its better to
          // move next_pc address into an know register upfront.
          // starting address of next_pc is 8 bytes aligned and a
          // a quadword store to it will be implicitly atomic on x86.
          "movq %%rdx,  (%%rdi)    \n\t"
          // Post signal handling instruction.
          "movq $1, (%%rax)        \n\t"
          "movq $0x10, %%rax       \n\t"
          "addq %%rax, %%r16 \n\t"
          "addq %%r17, %%r16 \n\t"
          "addq %%r18, %%r16 \n\t"
          "addq %%r19, %%r16 \n\t"
          "addq %%r20, %%r16 \n\t"
          "addq %%r21, %%r16 \n\t"
          "addq %%r22, %%r16 \n\t"
          "addq %%r23, %%r16 \n\t"
          "addq %%r24, %%r16 \n\t"
          "addq %%r25, %%r16 \n\t"
          "addq %%r26, %%r16 \n\t"
          "addq %%r27, %%r16 \n\t"
          "addq %%r28, %%r16 \n\t"
          "addq %%r29, %%r16 \n\t"
          "addq %%r30, %%r16 \n\t"
          "addq %%r31, %%r16 \n\t"
          "movq %%r16, %0 \n\t"
        : "=m"(td->outslice[j]), "=m"(next_pc)
        : "r"(&td->inslice[i])
        : "%r16", "%r17", "%r18", "%r19", "%r20" , "%r21", "%r22", "%r23", "%r24", "%r25", "%r26", "%r27", "%r28", "%r29", "%r30", "%r31", "cc", "%rsi", "%rdi", "%rax", "%rdx"
      );
  }
  for (int i = 1; i < td->ossize; i++) {
      td->outslice[0] += td->outslice[i];
  }
  DEBUG("Exiting thread.\n");
  return td;
}


int main(int argc, char* argv[]) {
   if (argc != 2) {
     return fprintf(stderr, "Incorrect arguments! => ./app <thread_count>\n");
   }
   int threads = atoi(argv[1]);
   pthread_t tid[threads];
   thread_data* tds = (thread_data*)malloc(sizeof(thread_data) * threads); 
   long * inslice = (long*)malloc(sizeof(long) * 16 * 10240 * threads); 
   memset(inslice, 0, sizeof(long) * 16 * 10240 * threads);
   long * outslice = (long*)malloc(sizeof(long) * 10240 * threads); 
   for (int i = 0; i < threads; i++) {
       tds[i].tid = i + 1;
       tds[i].outslice = outslice + 10240 * i; 
       tds[i].inslice = inslice + 16 * 10240 * i;
       tds[i].issize = 16*10240; 
       tds[i].ossize = 10240; 
   }
   for (int i = 0; i < threads; i++) {
      pthread_create(&tid[i], NULL, kernel, &tds[i]);
   } 
   for (int i = 0; i < threads; i++) {
      pthread_join(tid[i], NULL);
   } 
   for (int i = 0; i < threads; i++) {
      printf("[thead %d] res = %ld\n", tds[i].tid, tds[i].outslice[0]); 
   }
   return 0;
}
