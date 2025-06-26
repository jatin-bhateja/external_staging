
#include <signal.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdio.h>

#define __USE_GNU
#include <ucontext.h>
#define __USE_GNU
#include <sys/ucontext.h>

void* next_pc = NULL;

long func() {
  long res = 0;
  asm volatile (
     "leaq %0 ,  %%rdi        \n\t"
     "movq $0x0, %%rax        \n\t"
     "leaq 0x0(%%rip), %%rdx  \n\t"
     "addq $0xe, %%rdx       \n\t"
     // Based on base and index register encoding, offset to post
     // signal handling instruction may change, thus its better to
     // move next_pc address into an know register upfront.
     "movq %%rdx,  (%%rdi)    \n\t"
     // Post signal handling instruction.
     "movq $1, (%%rax)        \n\t"
     "movq $0x10, %1          \n\t"
   : "+m"(next_pc), "=r"(res)
   :
   : "%rdx", "%rax", "%rdi", "cc" 
  );
  return res;
}

void signal_handle(int sig) {
   printf("Received Signal => %d\n", sig);
}

#define REG_RIP 16

void sig_action(int sig, siginfo_t* si, void* ucontext) {
   ucontext_t* const uc = (ucontext_t*) ucontext;
   if (sig == SIGSEGV) {
     fprintf(stdout,"Signal handler:\n");
     fprintf(stdout,__PRETTY_FUNCTION__);
     fprintf(stdout,"\n");
     uc->uc_mcontext.gregs[REG_RIP] = (intptr_t)next_pc;
   }
}

int main() {
  struct sigaction act;
  act.sa_handler = signal_handle;
  act.sa_sigaction = sig_action;
  sigaction(SIGSEGV, &act, NULL);
  return printf("RES = %ld\n", func()); 
}
