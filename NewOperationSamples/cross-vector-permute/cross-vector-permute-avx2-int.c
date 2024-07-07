
#include <stdio.h>

// Vector.selectFrom(Vector v1, Vector v2)
// Indices
//    -

int main() {
  int arr1[]  = {1,2,3,4,5,6,7,8};
  int arr2[]  = {17,18,19,20,21,22,23,24};
  int permm[] = {2,11,6,7,9,11,3,4};
  asm volatile(
       "vmovdqu %1, %%ymm1  \n\t"
       "vmovdqu %2, %%ymm2  \n\t"
       "vmovdqu %0, %%ymm3  \n\t"
       "vpermd %%ymm1, %%ymm3, %%ymm4 \n\t"   //
       "vpermd %%ymm2, %%ymm3, %%ymm5 \n\t"   // Dispatch in parallel
       "vpslld $28, %%ymm3, %%ymm3    \n\t"
       "vblendvps %%ymm3, %%ymm5, %%ymm4, %%ymm3 \n\t"  // Emulation.
       "vmovdqu %%ymm3, %0  \n\t"
     : "+m"(permm[0])
     : "m"(arr1[0]), "m"(arr2[0])
     : "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%ymm5", "%ymm6"
  );

  for (int i = 0; i < 8; i++) {
     printf("%d \n", permm[i]);
  }
  return 0;
}


