
#include <stdio.h>
// AVX512BW

int main() {
  short arr1[32];
  short arr2[32];
  int mask = 0xF0F0F0F0;
  // SRC is overwritten, TEMP
  short permm[32] = {
    2,4,6,8,2,4,6,8,
    10,12,14,16,10,12,14,16,
    19,21,23,27,19,21,23,27,
    25,29,30,31,25,29,30,31
  };
  for (int i = 0; i < 32; i++) {
     arr1[i] = i + 1;
  }
  for (int i = 0; i < 32; i++) {
     arr2[i] = i + 32;
  }
  
  //for (int i = 0; i < 100000000; i++) {
    asm volatile(
       "vmovdqu64 %1, %%zmm1  \n\t"
       "vmovdqu64 %2, %%zmm2  \n\t"
       "kmovd     %3, %%k1    \n\t"
       "vpmovm2w  %%k1 , %%zmm3 \n\t"
       "vpsrlw    $15, %%zmm3, %%zmm3 \n\t"
       "vpsllw    $5, %%zmm3, %%zmm3 \n\t"
       "vporq     %0, %%zmm3, %%zmm3 \n\t"
       "vpermi2w %%zmm2, %%zmm1, %%zmm3 \n\t"
       "vmovdqu64 %%zmm3, %0  \n\t"
     : "+m"(permm[0])
     : "m"(arr1[0]), "m"(arr2[0]), "r"(mask)
     : "%zmm1", "%zmm2", "%zmm3", "%k1", "%zmm4"
    );
  //}

  for (int i = 0; i < 32; i++) {
     printf("%d \n", permm[i]);
  }
  return 0;
}

