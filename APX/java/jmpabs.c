#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>

long callee1_ctr = 0;
long callee2_ctr = 0;
long callee3_ctr = 0;
long callee4_ctr = 0;
long callee5_ctr = 0;

#ifdef _DEBUG
#define DEBUG(...) \
 do {                            \
   fprintf(stdout, __VA_ARGS__); \
 } while (0)
#else
#define DEBUG(...)
#endif

void stub_callee1() {
   DEBUG("Called callee1 stub\n");
   callee1_ctr++;
}

void stub_callee2() {
   DEBUG("Called callee2 stub\n");
   callee2_ctr++;
}

void stub_callee3() {
   DEBUG("Called callee3 stub\n");
   callee3_ctr++;
}

void stub_callee4() {
   DEBUG("Called callee4 stub\n");
   callee4_ctr++;
}

void stub_callee5() {
   DEBUG("Called callee5 stub\n");
   callee5_ctr++;
}

typedef void (*func_tray[5])();
func_tray funcp;

// Actual CallRuntime will save call clobbered
// registers before call to stub, so will not
// malign the caller activation. 
__attribute((noinline))
long micro1(long idx) {
   asm volatile (
      "call jmp_abs1  \n\t"
      "jmp stub2      \n\t" 
      "jmp_abs1:      \n\t"
      "   jmp stub_callee1 \n\t"
      "stub2:         \n\t"
      "call jmp_abs2  \n\t"
      "jmp stub3      \n\t" 
      "jmp_abs2:      \n\t"
      "   jmp stub_callee2 \n\t"
      "stub3:         \n\t"
      "call jmp_abs3  \n\t"
      "jmp stub4      \n\t" 
      "jmp_abs3:      \n\t"
      "   jmp stub_callee3 \n\t"
      "stub4:         \n\t"
      "call jmp_abs4  \n\t"
      "jmp stub5      \n\t" 
      "jmp_abs4:      \n\t"
      "   jmp stub_callee4 \n\t"
      "stub5:         \n\t"
      "call jmp_abs5  \n\t"
      "jmp done      \n\t" 
      "jmp_abs5:      \n\t"
      "   jmp stub_callee5 \n\t"
      "done:         \n\t"
      : : :  
   );
   return callee1_ctr + callee2_ctr + callee3_ctr + callee4_ctr + callee5_ctr + idx;
}

__attribute((noinline))
long micro2(long idx) {
   asm volatile (
      "xorq %%rbx, %%rbx           \n\t"
      "leaq 0x0(%0, %%rbx, 8),  %%rax \n\t"
      "movq (%%rax), %%rax         \n\t"
      "call *%%rax                 \n\t"
      "incq %%rbx                  \n\t"
      "leaq 0x0(%0, %%rbx, 8),  %%rax \n\t"
      "movq (%%rax), %%rax         \n\t"
      "call *%%rax                 \n\t"
      "incq %%rbx                  \n\t"
      "leaq 0x0(%0, %%rbx, 8),  %%rax \n\t"
      "movq (%%rax), %%rax         \n\t"
      "call *%%rax                 \n\t"
      "incq %%rbx                  \n\t"
      "leaq 0x0(%0, %%rbx, 8),  %%rax \n\t"
      "movq (%%rax), %%rax         \n\t"
      "call *%%rax                 \n\t"
      "incq %%rbx                  \n\t"
      "leaq 0x0(%0, %%rbx, 8),  %%rax \n\t"
      "movq (%%rax), %%rax         \n\t"
      "call *%%rax                 \n\t"
      :
      : "r"(funcp)
      : "%rax", "%rbx"
   );
   return callee1_ctr + callee2_ctr + callee3_ctr + callee4_ctr + callee5_ctr + idx;
}

int main(int argc, char *argv[]) {
  long res = 0;
  if (argc != 2) {
     fprintf(stderr, "Incorrect Arguments! <app> <algo> \n");
     return -1;
  }
  int algo = atoi(argv[1]);

  funcp[0] = stub_callee1;
  funcp[1] = stub_callee2;
  funcp[2] = stub_callee3;
  funcp[3] = stub_callee4;
  funcp[4] = stub_callee5;

  assert (algo == 0 || algo == 1);
  if (algo == 0) {
    for (long i = 0; i < 100000000; i+=5) {
       res += micro1(i % 5);
       res += micro1((i+1) % 5);
       res += micro1((i+2) % 5);
       res += micro1((i+3) % 5);
       res += micro1((i+4) % 5);
    }
  }
  if (algo == 1) {
    for (long i = 0; i < 100000000; i+=5) {
       res += micro2(i % 5);
       res += micro2((i+1) % 5);
       res += micro2((i+2) % 5);
       res += micro2((i+3) % 5);
       res += micro2((i+4) % 5);
    }
  }
  printf("Res = %ld \n", res);
  printf("Invocation count of stub_callee1 : %ld \n", callee1_ctr);
  printf("Invocation count of stub_callee2 : %ld \n", callee2_ctr);
  printf("Invocation count of stub_callee3 : %ld \n", callee3_ctr);
  printf("Invocation count of stub_callee4 : %ld \n", callee4_ctr);
  printf("Invocation count of stub_callee5 : %ld \n", callee5_ctr);
  return 0;
}
