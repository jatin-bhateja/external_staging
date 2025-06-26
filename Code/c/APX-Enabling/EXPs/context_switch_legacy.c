
#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <assert.h>
#include <signal.h>
#include <sys/unistd.h>

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
  assert(td->ossize == td->issize >> 3);
  for (int i = 0, j = 0; i < td->issize; i+=8, j++) {
      struct sigaction act;
      act.sa_handler = signal_handle;
      act.sa_sigaction = sig_action;
      sigaction(SIGSEGV, &act, NULL);
      asm volatile (
          "movq %2, %%rsi          \n\t"
          "movq 0x0(%%rsi),   %%r8 \n\t"
          "movq 0x8(%%rsi),   %%r9 \n\t"
          "movq 0x10(%%rsi),  %%r10 \n\t"
          "movq 0x18(%%rsi),  %%r11 \n\t"
          "movq 0x20(%%rsi),  %%r12 \n\t"
          "movq 0x28(%%rsi),  %%r13 \n\t"
          "movq 0x30(%%rsi),  %%r14 \n\t"
          "movq 0x38(%%rsi),  %%r15 \n\t"
          "addq $5, %%r8 \n\t"
          "addq $5, %%r9 \n\t"
          "addq $5, %%r10 \n\t"
          "addq $5, %%r11 \n\t"
          "addq $5, %%r12 \n\t"
          "addq $5, %%r13 \n\t"
          "addq $5, %%r14 \n\t"
          "addq $5, %%r15 \n\t"
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
          "movq %%rdx,  (%%rdi)    \n\t"
          // Post signal handling instruction.
          "movq $1, (%%rax)        \n\t"
          "movq $0x10, %%rax       \n\t"
          "addq %%rax, %%r8 \n\t"
          "addq %%r9, %%r8 \n\t"
          "addq %%r10, %%r8 \n\t"
          "addq %%r11, %%r8 \n\t"
          "addq %%r12, %%r8 \n\t"
          "addq %%r13, %%r8 \n\t"
          "addq %%r14, %%r8 \n\t"
          "addq %%r15, %%r8 \n\t"
          "movq %%r8,  %0   \n\t"
        : "+m"(td->outslice[j]), "=m"(next_pc)
        : "r"(&td->inslice[i])
        : "%r8", "%r9", "%r10", "%r11", "%r12" , "%r13", "%r14", "%r15", "cc", "%rsi", "%rdi", "%rax", "%rdx"
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
   long * inslice = (long*)malloc(sizeof(long) * 8 * 10240 * threads); 
   memset(inslice, 0, sizeof(long) * 8 * 10240);
   long * outslice = (long*)malloc(sizeof(long) * 10240 * threads); 
   for (int i = 0; i < threads; i++) {
       tds[i].tid = i + 1;
       tds[i].outslice = outslice + 10240 * i; 
       tds[i].inslice = inslice + 8 * 10240 * i;
       tds[i].issize = 8*10240; 
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
