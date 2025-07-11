
#include <stdio.h>

int main() {
  unsigned long val1[] =  {
     0xFFFFFFFFFFFFFFF0UL, 0xFFFFFFFFFFFFFFFFUL, 0xFFFFFFFFFFFFFFFFUL, 0xFFFFFFFFFFFFFFFFUL,
  };
  unsigned long val2[] =  {
     17UL,2UL,2UL,2UL,
  };


  // addition / subtraction works over 2s complement representation and is agnostic to signed / unsigned value.
  unsigned long res[4];
  for (int i = 0; i < 9000000; i++) {
    asm volatile (
       // Read unsigned inputs INP1, INP2.
       "vmovdqu %1, %%ymm1 \n\t"
       "vmovdqu %2, %%ymm2 \n\t"
       // Res = Signed Add INP1, INP2
       "vpaddq %%ymm1, %%ymm2, %%ymm6 \n\t"
       // Max_Input = Unsigned MAX INP1, INP2
       "vpmaxuq %%ymm1, %%ymm2, %%ymm4 \n\t"
       // Min_Input = Unsigned MIN INP1, INP2
       "vpminuq %%ymm1, %%ymm2, %%ymm5 \n\t"
       // Max_Unsigned = 0xFFFFFFFF
       "vpcmpeqq %%ymm3, %%ymm3, %%ymm3 \n\t"
       // X = Max_Unsigned - Max_Input
       "vpsubq %%ymm4, %%ymm3, %%ymm4 \n\t" 

       //> Unsigned compare:  Mask = X < Min_Unsigned
       "movq $0x8000000000000000UL, %%rax \n\t"
       "movd %%rax, %%xmm7      \n\t"
       "vpbroadcastq %%xmm7, %%ymm7 \n\t"
       "vpxor %%ymm7, %%ymm5, %%ymm5 \n\t" 
       "vpxor %%ymm7, %%ymm4, %%ymm4 \n\t" 
       "vpcmpgtq %%ymm4, %%ymm5, %%ymm4 \n\t"
       //<
       // res  = X < Min_Unsigned ? Max_Unsigned : Res
       "vpblendvb %%ymm4, %%ymm3, %%ymm6, %%ymm4 \n\t"
       "vmovdqu %%ymm4, %0 \n\t"
     : "=m"(res[0])
     : "m"(val1[0]), "m"(val2[0])
     : "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%ymm5", "%ymm6", "%ymm7",  "%rax"
    );
  }

  return printf("[res] %lu\n", res[0]); 
}
