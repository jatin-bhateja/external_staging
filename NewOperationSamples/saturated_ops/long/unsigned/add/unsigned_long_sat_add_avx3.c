
#include <stdio.h>

int main() {
  unsigned long val1[] =  {
     0xFFFFFFFFFFFFFFF0UL, 0xFFFFFFFFFFFFFFFFUL, 0xFFFFFFFFFFFFFFFFUL, 0xFFFFFFFFFFFFFFFFUL,
     0xFFFFFFFFFFFFFFF0UL, 0xFFFFFFFFFFFFFFFFUL, 0xFFFFFFFFFFFFFFFFUL, 0xFFFFFFFFFFFFFFFFUL,
  };
  unsigned long val2[] =  {
     17L,2L,2L,2L,
     1L,1L,1L,1L,
  };

  unsigned long res[8];
  for (int i = 0; i < 900000000; i++) {
    asm volatile (
       // Read unsigned inputs INP1, INP2.
       "vmovdqu64 %1, %%zmm1 \n\t"
       "vmovdqu64 %2, %%zmm2 \n\t"
       // Res = Signed Add INP1, INP2
       "vpaddq %%zmm1, %%zmm2, %%zmm3 \n\t"
       // Max_Input = Unsigned MAX INP1, INP2
       "vpmaxuq %%zmm1, %%zmm2, %%zmm4 \n\t"
       // Min_Input = Unsigned MIN INP1, INP2
       "vpminuq %%zmm1, %%zmm2, %%zmm5 \n\t"
       // Max_Unsigned = 0xFFFFFFFF
       "vpternlogq $0xff, %%zmm6, %%zmm6, %%zmm6 \n\t"
       // X = Max_Unsigned - Max_Input
       "vpsubq %%zmm4, %%zmm6, %%zmm4 \n\t" 
       // Unsigned compare:  Mask = X < Min_Unsigned
       "vpcmpuq $6, %%zmm4, %%zmm5, %%k1 \n\t"
       // res  = X < Min_Unsigned ? Max_Unsigned : Res
       "vpblendmq %%zmm6, %%zmm3, %%zmm4 %{%%k1} \n\t"
       "vmovdqu64 %%zmm4, %0 \n\t"
     : "=m"(res[0])
     : "m"(val1[0]), "m"(val2[0])
     : "%zmm1", "%zmm2", "%zmm3", "%zmm4", "%zmm5", "%zmm6", "%eax"
    );
  }

  return printf("{res[0], res[1], res[2], res[3]} = {%ld, %ld, %ld, %ld}\n", res[0], res[1], res[2], res[3]);
}
