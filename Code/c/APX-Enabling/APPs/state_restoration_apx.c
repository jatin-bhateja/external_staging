
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

__attribute__((aligned(8)))
void* next_pc = NULL;

#define REG_RIP 16
#define REG_RDX 12

void sig_action(int sig, siginfo_t* si, void* ucontext) {
   ucontext_t* const uc = (ucontext_t*) ucontext;
   if (sig == SIGSEGV) {
     asm volatile("movq $20, %%r17 \n\t" : : : "%r17");
     asm volatile("movq $20, %%r21 \n\t" : : : "%r21");
     uc->uc_mcontext.gregs[REG_RIP] = (intptr_t)next_pc;
   }
}

void print_error() {
   printf("State Restoration error!\n");
}

typedef struct _thread_data {
  int tid;
} thread_data;

void* kernel(void* data) {
  thread_data* td = (thread_data*)data;
  DEBUG("Entering thread.\n");
  struct sigaction act;
  memset(&act, 0, sizeof(act));
  act.sa_sigaction = sig_action;
  act.sa_flags = SA_SIGINFO | SA_RESTART;

  sigemptyset(&act.sa_mask);
  sigaction(SIGSEGV, &act, NULL);
  asm volatile (
      "movq $30, %%r17         \n\t"
      "movq $30, %%r21         \n\t"
      "leaq %0 ,  %%rdi        \n\t"
      "movq $0x0, %%rax        \n\t"
      "leaq 0x0(%%rip), %%rdx  \n\t"
      "addq $0x11, %%rdx       \n\t"
      // Based on base and index register encoding, offset to post
      // signal handling instruction may change, thus its better to
      // move next_pc address into an know register upfront.
      "movq %%rdx,  (%%rdi)    \n\t"
      "sfence                  \n\t"
      "movq $1, (%%rax)        \n\t"
      // Post signal handling instruction.
      "movq $0x10, %%rax       \n\t"
      "cmpq $30, %%r17         \n\t"
      "jnz  error              \n\t"
      "cmpq $30, %%r21         \n\t"
      "jnz  error              \n\t"
      "jmp  done               \n\t"
      "error:                  \n\t"
      " call print_error       \n\t"
      "done:                   \n\t" 
    : "=m"(next_pc)
    : 
    : "%r10", "%r17", "%r21", "%rdx", "%rdi", "%rax", "cc"
  );
  DEBUG("Exiting thread.\n");
  return 0;
}


int main(int argc, char* argv[]) {
   if (argc != 2) {
     return fprintf(stderr, "Incorrect arguments! => ./app <thread_count>\n");
   }
   int threads = atoi(argv[1]);
   pthread_t tid[threads];
   thread_data* tds = (thread_data*)malloc(sizeof(thread_data) * threads); 
   for (int i = 0; i < threads; i++) {
       tds[i].tid = i + 1;
   }
   for (int i = 0; i < threads; i++) {
      pthread_create(&tid[i], NULL, kernel, &tds[i]);
   } 
   for (int i = 0; i < threads; i++) {
      pthread_join(tid[i], NULL);
   } 
   for (int i = 0; i < threads; i++) {
      printf("[thead %d] res = %ld\n", tds[i].tid); 
   }
   return 0;
}
