
#include <stdio.h>

int main() {
  unsigned int val1[] =  {
     0xFFFFFFF0, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
     0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
     0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
     0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
  };
  unsigned int val2[] =  {
     17,2,2,2,
     1,1,1,1,
     1,1,1,1,
     1,1,1,1,
  };

  // Unsigned values ranges comprise of only +ve numbers, thus there exist only an upper bound saturation.
  unsigned int res[16];
  for (int i = 0; i < 9000000; i++) {
    asm volatile (
       // Read unsigned inputs INP1, INP2.
       "vmovdqu32 %1, %%zmm1 \n\t"
       "vmovdqu32 %2, %%zmm2 \n\t"
       // Res = Signed Add INP1, INP2
       "vpaddd %%zmm1, %%zmm2, %%zmm3 \n\t"
       // Max_Input = Unsigned MAX INP1, INP2
       "vpmaxud %%zmm1, %%zmm2, %%zmm4 \n\t"
       // Min_Input = Unsigned MIN INP1, INP2
       "vpminud %%zmm1, %%zmm2, %%zmm5 \n\t"
       // Max_Unsigned = 0xFFFFFFFF
       "vpternlogd $0xff, %%zmm6, %%zmm6, %%zmm6 \n\t"
       // X = Max_Unsigned - Max_Input
       "vpsubd %%zmm4, %%zmm6, %%zmm4 \n\t" 
       // Unsigned compare:  Mask = X < Min_Unsigned
       "vpcmpud $6, %%zmm4, %%zmm5, %%k1 \n\t"
       // res  = X < Min_Unsigned ? Max_Unsigned : Res
       "vpblendmd %%zmm6, %%zmm3, %%zmm4 %{%%k1} \n\t"
       "vmovdqu32 %%zmm4, %0 \n\t"
     : "=m"(res[0])
     : "m"(val1[0]), "m"(val2[0])
     : "%zmm1", "%zmm2", "%zmm3", "%zmm4", "%zmm5", "%zmm6", "%eax"
    );
  }

  return printf("[res] %u\n", res[0]); 
}
