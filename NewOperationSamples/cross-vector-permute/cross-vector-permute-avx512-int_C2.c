
#include <stdio.h>

// AVX512DQ
int main() {
  int arr1[]  = {1,2,3,4,5,6,7,8};
  int arr2[]  = {17,18,19,20,21,22,23,24};
  //int permm[] = {2,11,6,7,9,11,3,4} //= wrapped_indices + mask;
  int permm_wrapped[] = {2,3,6,7,1,3,3,4};
  int mask = 0x32;
 
  // LOADS + VPERMD + VPERMD + VBLENDMD = 3 + 3 + 1 = 7 + LOADS
  // LOADS + VPERMI2D + VPMOVM2D + VPSLLD + VPSRLD + VPOR = 3 + 3 + 1 + 1 + 1  = 9 + LOADS
  // LOADS + VPERMI2D = 3 + LOADS
  for (int i = 0; i < 1000000; i++) {
  asm volatile(
       "vmovdqu %1, %%ymm1  \n\t"
       "vmovdqu %2, %%ymm2  \n\t"
       "vmovdqu %0, %%ymm3  \n\t"
       "kmovw %3 , %%k1     \n\t"
       "vpmovm2d %%k1, %%ymm4 \n\t"
       "vpsrld $31, %%ymm4, %%ymm4 \n\t" 
       "vpslld $3, %%ymm4, %%ymm4 \n\t" 
       "vpord %%ymm4, %%ymm3, %%ymm3 \n\t"
       "vpermi2d %%ymm2, %%ymm1, %%ymm3 \n\t"
       "vmovdqu64 %%ymm3, %0  \n\t"
     : "+m"(permm_wrapped[0])
     : "m"(arr1[0]), "m"(arr2[0]), "r"(mask)
     : "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%k1"
  );
  }

  for (int i = 0; i < 8; i++) {
     printf("%d \n", permm_wrapped[i]);
  }
  return 0;
}

