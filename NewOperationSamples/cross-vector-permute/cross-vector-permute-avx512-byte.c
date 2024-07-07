
#include <stdio.h>
// AVX512BW
// AVX512_VBMI

int main() {
  char arr1[64];
  char arr2[64];
  long mask = 0xF0F0F0F0F0F0F0F0L;
  // SRC is overwritten, TEMP
  char permm[64] = {
    2,4,6,8,2,4,6,8,
    10,12,14,16,10,12,14,16,
    19,21,23,27,19,21,23,27,
    25,29,30,31,25,29,30,31,
    2,4,6,8,2,4,6,8,
    10,12,14,16,10,12,14,16,
    19,21,23,27,19,21,23,27,
    25,29,30,31,25,29,30,31
  };
  for (int i = 0; i < 64; i++) {
     arr1[i] = i + 1;
  }
  for (int i = 0; i < 64; i++) {
     arr2[i] = i + 64;
  }
  
  //for (int i = 0; i < 100000000; i++) {
    asm volatile(
       "vmovdqu64 %1, %%zmm1    \n\t"
       "vmovdqu64 %2, %%zmm2    \n\t"
       "kmovq     %3, %%k1      \n\t"
       "vpmovm2b  %%k1 , %%zmm3 \n\t"
       "movq $0x4040404040404040L, %%rax \n\t"
       "vpbroadcastq %%rax, %%zmm4       \n\t"
       "vpandq %%zmm4, %%zmm3, %%zmm3    \n\t"
       "vporq %0 , %%zmm3, %%zmm3        \n\t" 
       "vpermi2b %%zmm2, %%zmm1, %%zmm3  \n\t"
       "vmovdqu64 %%zmm3, %0    \n\t"
     : "+m"(permm[0])
     : "m"(arr1[0]), "m"(arr2[0]), "r"(mask)
     : "%zmm1", "%zmm2", "%zmm3", "%k1", "%zmm4"
    );
  //}

  for (int i = 0; i < 64; i++) {
     printf("%d \n", permm[i]);
  }
  return 0;
}

