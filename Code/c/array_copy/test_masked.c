
#include "stdio.h"
#include "iacaMarks.h"
#include "xmmintrin.h"

#ifndef _USE_AVX512

__attribute__((noinline))
void vector_masked_load(int * dst, int * src, int imm8) {
  IACA_START;
  __asm__ volatile(
     "vmovdqu   %0 , %%ymm1                \n\t"
     "vpblendd  $0xf, %1 , %%ymm1 , %%ymm1 \n\t"
     "vmovdqu   %%ymm1 , %0                \n\t"
    : "=m"(*dst)
    : "m"(*src) 
    : "%ymm1" 
  );
  IACA_END;
}

#else
__attribute__((noinline))
void vector_masked_load(int * dst, int * src, int imm8) {
  IACA_START;
  __asm__ volatile(
     "kmovw  %2 , %%k1                \n\t"
     "vmovdqu32  %1 , %%ymm1 {{%%k1}} \n\t"
     "vmovdqu   %%ymm1 , %0           \n\t"
    : "=m"(*dst)
    : "m"(*src) , "r"(imm8) 
    : "%ymm1" , "%k1" 
  );
  IACA_END;
}
#endif



int main() {
  int res = 0;
  int * src = _mm_malloc(32768, 64);
  int * dst = _mm_malloc(32768, 64);

  memset(src, 1, 32768);
  memset(dst, 0, 32768);

  for (int i = 0 ; i < 1000000 ; i++) {
    res += vector_masked_load(dst, src, 0xf);
  }

  return printf("res = \n", res);
}


