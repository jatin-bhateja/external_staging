
#include <stdio.h>

// AVX512DQ

int main() {
  int arr1[]  = {1,2,3,4,5,6,7,8};
  int arr2[]  = {17,18,19,20,21,22,23,24};
  int permm[] = {2,11,6,7,9,11,3,4};

  for (int i = 0; i < 1000000; i++) {
  asm volatile(
       "vmovdqu %1, %%ymm1  \n\t"
       "vmovdqu %2, %%ymm2  \n\t"
       "vmovdqu %0, %%ymm3  \n\t"
       "vpermi2d %%ymm2, %%ymm1, %%ymm3 \n\t"
       "vmovdqu64 %%ymm3, %0  \n\t"
     : "+m"(permm[0])
     : "m"(arr1[0]), "m"(arr2[0])
     : "%ymm1", "%ymm2", "%ymm3", "%ymm4"
  );
  }

  for (int i = 0; i < 8; i++) {
     printf("%d \n", permm[i]);
  }
  return 0;
}

