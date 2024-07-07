
#include <stdio.h>

int main() {
  unsigned int val1[] =  {
     0xFFFFFFF0, 15, 0xFFFFFFFF, 0xFFFFFFFF,
     0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
     0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
     0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF,
  };
  unsigned int val2[] =  {
     17,17,1,1,
     1,1,1,1,
     1,1,1,1,
     1,1,1,1,
  };

  // Unsigned values ranges comprise of only +ve numbers, thus there exist only an upper bound saturation.
  unsigned int res[16];
  for (int i = 0; i < 9000000; i++) {
    asm volatile (
       // Read unsigned inputs INP1, INP2.
       "vmovdqu64 %1, %%zmm1 \n\t"
       "vmovdqu64 %2, %%zmm2 \n\t"
       // Res = Signed INP1 - INP2 (non-commutative and non-associative)
       "vpsubd %%zmm2, %%zmm1, %%zmm3 \n\t"
       // Res = Inp1 < Inp2 ? 0 : RES
       "vpcmpud $0x5, %%zmm2, %%zmm1, %%k1 \n\t"
       // Zero out the masked result lanes.
       "vmovdqu32 %%zmm3, %%zmm3 %{%%k1} %{z} \n\t"
       // unmasked ld_blocks.store_forward agnostic move to memory.
       "vmovdqu32 %%zmm3, %0 \n\t"
     : "=m"(res[0])
     : "m"(val1[0]), "m"(val2[0])
     : "%zmm1", "%zmm2", "%zmm3", "%zmm4", "%k1"
    );
  }

  return printf("{res[0], res[1]}  = {%u,%u}\n", res[0], res[1]); 
}
