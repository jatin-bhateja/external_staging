
#include <stdio.h>

int main() {
  unsigned int val1[] =  {
     0x2, 0xFFFFFFFF, 0x4, 0xFFFFFFFF,
     0x2, 0xFFFFFFFF, 0x4, 0xFFFFFFFF
  };
  unsigned int val2[] =  {
     17,2,5,2,
     17,2,5,2
  };

  // Unsigned A - B
  // Underflow  = B > A 
  
  unsigned int res[8];
  for (int i = 0; i < 900000000; i++) {
    asm volatile (
       // Read unsigned inputs INP1, INP2.
       "vmovdqu %1, %%ymm1 \n\t"
       "vmovdqu %2, %%ymm2 \n\t"
       // Res = Signed Add INP1, INP2
       "vpsubd %%ymm2, %%ymm1, %%ymm3 \n\t"
       // MIN_Unsigned = 0x0
       "vpxord %%ymm6, %%ymm6, %%ymm6 \n\t"
       // Unsigned compare:  Mask = A <U B => A + Min_Unsigned <S B + Min_Unsigned
       "vpcmpeqd %%ymm4, %%ymm4, %%ymm4 \n\t"
       // 
       "vpslld $31, %%ymm4, %%ymm4         \n\t"
       "vpaddd %%ymm4, %%ymm1, %%ymm5      \n\t"
       "vpaddd %%ymm4, %%ymm2, %%ymm4      \n\t"
       "vpcmpgtd %%ymm5, %%ymm4, %%ymm5    \n\t"
       // res  = A < B ? 0 : Res
       "vpblendvb %%ymm5, %%ymm6, %%ymm3 , %%ymm4 \n\t"
       "vmovdqu %%ymm4, %0                 \n\t"
     : "=m"(res[0])
     : "m"(val1[0]), "m"(val2[0])
     : "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%ymm5", "%ymm6"
    );
  }

  return printf("{res[0], res[1], res[2], res[3]} = {%u, %u, %u, %u}\n", res[0], res[1], res[2], res[3]);
}
