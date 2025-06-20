
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
  fprintf(stderr, "sig_action got called from IP : %p \n",uc->uc_mcontext.gregs[REG_RIP]);
}

void kernel() {
   asm volatile(
      "movl $0, %%r15d  \n\t"
      "movl $1, (%%r15) \n\t"
      "incl %%r15d      \n\t"
      "incl %%r15d      \n\t"
      "incl %%r15d      \n\t"
      "incl %%r15d      \n\t"
      "incl %%r15d      \n\t"
      "incl %%r15d      \n\t"
      "incl %%r15d      \n\t"
      "movl $0, %%r15d  \n\t"
      "movl $0,(%%r15)  \n\t"
     : 
     :
     : "%r15", "cc"
   );
}


int main(int argc, char* argv[]) {
  struct sigaction act;
  memset(&act, 0, sizeof(act));
  act.sa_sigaction = sig_action;
  act.sa_flags = SA_SIGINFO | SA_RESTART;
  sigemptyset(&act.sa_mask);
  sigaction(SIGSEGV, &act, NULL);

  kernel();
  return 0;
}
