
#include "xmmintrin.h"
#include "stdio.h"
#include "assert.h"

__attribute__((noinline))
int setMemVec(char* dst, char val, int size) {
  asm volatile(
      "xorq    %%rax, %%rax  \n\t"
      "movq    %2, %%rax     \n\t"
      "salq    $8, %%rax     \n\t"
      "addq    %2, %%rax     \n\t"
      "movq    %%rax, %%rdi  \n\t"
      "salq    $16, %%rdi    \n\t"
      "addq    %%rdi, %%rax  \n\t"
      "movq    %%rax, %%rdi  \n\t"  
      "salq    $32, %%rdi    \n\t"
      "addq    %%rax, %%rdi  \n\t"
      "movq    %0 , %%rdx    \n\t"
      "movq    %0 , %%rax    \n\t"
      "addq    %1 , %%rax    \n\t"
      "vpbroadcastq %%rdi , %%ymm0 \n\t"
      "Loop1:                 \n\t"
        "vmovdqu32  %%ymm0, (%%rdx) \n\t"
        "addq    $32, %%rdx     \n\t"
        "cmpq    %%rax, %%rdx   \n\t"
        "jne     Loop1"
   : "=m"(dst)
   : "r"((long)(size)) , "r"((long)(val))
   : "%rax", "%rdi", "%rdx"
  );
  return dst[0];
}

__attribute__((noinline))
int setMemScalar(char * dst, char val, int size) {
  asm volatile(
      "xorq    %%rax, %%rax  \n\t"
      "movq    %2, %%rax     \n\t"
      "salq    $8, %%rax     \n\t"
      "addq    %2, %%rax     \n\t"
      "movq    %%rax, %%rdi  \n\t"
      "salq    $16, %%rdi    \n\t"
      "addq    %%rdi, %%rax  \n\t"
      "movq    %%rax, %%rdi  \n\t"  
      "salq    $32, %%rdi    \n\t"
      "addq    %%rax, %%rdi  \n\t"
      "movq    %0 , %%rdx    \n\t"
      "movq    %0 , %%rax    \n\t"
      "addq    %1 , %%rax    \n\t"
      "Loop2:                \n\t"
        "movq    %%rdi, (%%rdx) \n\t"
        "addq    $8, %%rdx     \n\t"
        "cmpq    %%rax, %%rdx   \n\t"
        "jne     Loop2"
   : "=m"(dst)
   : "r"((long)size) , "r"((long)val)
   : "%rax", "%rdi", "%rdx"
  );
  return dst[0];
}

int main(int argc, char * argv[]) {
  char * mem = _mm_malloc(8192,64);

  long res = 0;
  int algo = atoi(argv[1]);
  if (algo == 0) {
    for(int i = 0 ; i < 1000000 ; i++)
       res += setMemScalar(mem, 10, 8192);
  } else {
    assert(algo == 1);
    for(int i = 0 ; i < 1000000 ; i++)
       res += setMemVec(mem, 10, 8192);
  }
  return printf("[res_%s_loop] : %ld \n", algo ? "vec":"scalar", res);
}

