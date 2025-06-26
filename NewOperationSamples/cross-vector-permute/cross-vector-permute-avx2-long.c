
#include <stdio.h>

int main() {
  int arr1[]  = {1,2,3,4,5,6,7,8};
  int arr2[]  = {17,18,19,20,21,22,23,24};
  int permm[] = {2,4,6,7,0x12,0x14,0x16,0x17};

  for (int i = 0; i < 100000000; i++) {
    asm volatile(
       "vmovdqu64 %1, %%ymm1  \n\t"
       "vmovdqu64 %2, %%ymm2  \n\t"
       "vmovdqu64 %0, %%ymm3  \n\t"
       "vpermd %%ymm1, %%ymm3, %%ymm4 \n\t"   //
       "vpermd %%ymm2, %%ymm3, %%ymm5 \n\t"   // Dispatch in parallel
       // D = 27
       "vpslld $27, %%ymm3, %%ymm3     \n\t"  // 
       //"vpsrad $31, %%ymm3, %%ymm3   \n\t"    // Dispatch in parallel
       //"vpblendvb %%ymm3, %%ymm5, %%ymm4 , %%ymm3 \n\t" 
       "vblendvps %%ymm3, %%ymm5, %%ymm4, %%ymm3 \n\t"
       "vmovdqu64 %%ymm3, %0  \n\t"
     : "+m"(permm[0])
     : "m"(arr1[0]), "m"(arr2[0])
     : "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%ymm5"
    );
  }

  for (int i = 0; i < 8; i++) {
     printf("%d \n", permm[i]);
  }
  return 0;
}

