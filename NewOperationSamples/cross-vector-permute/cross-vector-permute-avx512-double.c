
#include <stdio.h>

int main() {
  double arr1[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
  double arr2[] = {17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32};
  long permm[] = {2,4,6,7,0x2,0x4,0x6,0x7,10,12,14,15,0xA,0xC,0xE,0xF};
  int mask = 0xF0;

  //for (int i = 0; i < 100000000; i++) {
    asm volatile(
       "vmovdqu64 %1, %%zmm1  \n\t"
       "vmovdqu64 %2, %%zmm2  \n\t"
       "kmovw     %3, %%k1    \n\t"
       "vpmovm2q  %%k1 , %%zmm3 \n\t"
       "vpsrlq    $63, %%zmm3, %%zmm3 \n\t"
       "vpsllq    $3, %%zmm3, %%zmm3 \n\t"
       "vporq     %0, %%zmm3, %%zmm3 \n\t"
       "vpermi2pd %%zmm2, %%zmm1, %%zmm3 \n\t"
       "vmovdqu64 %%zmm3, %0  \n\t"
     : "+m"(permm[0])
     : "m"(arr1[0]), "m"(arr2[0]), "r"(mask)
     : "%zmm1", "%zmm2", "%zmm3", "%k1", "%zmm4"
    );
  //}

  for (int i = 0; i < 8; i++) {
     printf("%f \n", ((double*)&permm[i])[0]);
  }
  return 0;
}

