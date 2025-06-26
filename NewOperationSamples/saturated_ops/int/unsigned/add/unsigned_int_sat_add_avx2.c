
#include <stdio.h>

int main() {
  unsigned int val1[] =  {
     0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
     0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
  };
  unsigned int val2[] =  {
     17,2,2,2,
     17,2,2,2,
  };


  // addition / subtraction works over 2s complement representation and is agnostic to signed / unsigned value.
  unsigned int res[8];
  for (int i = 0; i < 900000000; i++) {
    asm volatile (
       // Read unsigned inputs INP1, INP2.
       "vmovdqu %1, %%ymm1 \n\t"
       "vmovdqu %2, %%ymm2 \n\t"
       // Res = Signed Add INP1, INP2
       "vpaddd %%ymm1, %%ymm2, %%ymm6 \n\t"
       // Max_Input = Unsigned MAX INP1, INP2
       "vpmaxud %%ymm1, %%ymm2, %%ymm4 \n\t"
       // Min_Input = Unsigned MIN INP1, INP2
       "vpminud %%ymm1, %%ymm2, %%ymm5 \n\t"
       // Max_Unsigned = 0xFFFFFFFF
       "vpcmpeqd %%ymm3, %%ymm3, %%ymm3 \n\t"
       // X = Max_Unsigned - Max_Input
       "vpsubd %%ymm4, %%ymm3, %%ymm4 \n\t" 

       //> Unsigned compare:  Mask = X < Min_Unsigned
       "movl $0x80000000, %%eax \n\t"
       "movd %%eax, %%xmm7      \n\t"
       "vpbroadcastd %%xmm7, %%ymm7 \n\t"
       "vpxor %%ymm7, %%ymm5, %%ymm5 \n\t" 
       "vpxor %%ymm7, %%ymm4, %%ymm4 \n\t" 
       "vpcmpgtd %%ymm4, %%ymm5, %%ymm4 \n\t"
       //<
       // res  = X < Min_Unsigned ? Max_Unsigned : Res
       "vpblendvb %%ymm4, %%ymm3, %%ymm6, %%ymm4 \n\t"
       "vmovdqu %%ymm4, %0 \n\t"
     : "=m"(res[0])
     : "m"(val1[0]), "m"(val2[0])
     : "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%ymm5", "%ymm6", "%ymm7",  "%eax"
    );
  }

  return printf("{res[0], res[1], res[2], res[3]} = {%d, %d, %d, %d}\n", res[0], res[1], res[2], res[3]); 
}
