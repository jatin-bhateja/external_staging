
#include <stdio.h>

int main() {
  unsigned long val1[] =  {
     0x2UL, 0xFFFFFFFFFFFFFFFFUL, 0x4UL, 0xFFFFFFFFFFFFFFFFUL,
  };
  unsigned long val2[] =  {
     17UL,2UL,5UL,2UL,
  };

  // Unsigned A - B
  // Underflow  = B > A 
  
  unsigned long res[4];
  for (int i = 0; i < 900000000; i++) {
    asm volatile (
       // Read unsigned inputs INP1, INP2.
       "vmovdqu %1, %%ymm1 \n\t"
       "vmovdqu %2, %%ymm2 \n\t"
       // Res = Signed Add INP1, INP2
       "vpsubq %%ymm2, %%ymm1, %%ymm3 \n\t"
       // MIN_Unsigned = 0x0
       "vpxorq %%ymm6, %%ymm6, %%ymm6 \n\t"
       // Unsigned compare:  Mask = A <U B => A + Min_Unsigned <S B + Min_Unsigned
       "vpcmpeqq %%ymm4, %%ymm4, %%ymm4 \n\t"
       // 
       "vpsllq $63, %%ymm4, %%ymm4         \n\t"
       "vpaddq %%ymm4, %%ymm1, %%ymm5     \n\t"
       "vpaddq %%ymm4, %%ymm2, %%ymm4     \n\t"
       "vpcmpgtq %%ymm5, %%ymm4, %%ymm5 \n\t"
       // res  = A < B ? 0 : Res
       "vpblendvb %%ymm5, %%ymm6, %%ymm3 , %%ymm4 \n\t"
       "vmovdqu %%ymm4, %0 \n\t"
     : "=m"(res[0])
     : "m"(val1[0]), "m"(val2[0])
     : "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%ymm5", "%ymm6"
    );
  }

  return printf("{res[0], res[1], res[2], res[3]} = {%lu, %lu, %lu, %lu}\n", res[0], res[1], res[2], res[3]);
}
