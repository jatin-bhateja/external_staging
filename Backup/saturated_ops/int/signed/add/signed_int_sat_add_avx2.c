#include <stdio.h>

int main (int argc, char* argv[]) {
   int res[16];
   int arr1[16] = {0x7FFFFFFF, 0x80000000};
   int arr2[16] = {0x1, 0xFFFFFFFF};
   asm volatile (
      "vmovdqu32 %1, %%ymm1           \n\t"
      "vmovdqu32 %2, %%ymm2           \n\t"
      "vpmovsxdq %%xmm1, %%ymm3       \n\t"
      "vpmovsxdq %%xmm2, %%ymm4       \n\t"
      "vpaddq %%ymm3, %%ymm4, %%ymm4  \n\t"
      "vpmovsqd %%ymm4, %%xmm4        \n\t"
      "vextracti128 $0x1, %%ymm1, %%xmm5   \n\t"
      "vextracti128 $0x1, %%ymm2, %%xmm6   \n\t"
      "vpmovsxdq %%xmm5, %%ymm5       \n\t"
      "vpmovsxdq %%xmm6, %%ymm6       \n\t"
      "vpaddq %%ymm5, %%ymm6, %%ymm6  \n\t"
      "vpmovsqd %%ymm6, %%xmm6        \n\t"
      "vinserti128 $0x1, %%xmm6, %%ymm4, %%ymm4 \n\t"
      "vmovdqu64 %%ymm4, %0           \n\t"
     : "=m"(res[0])
     : "m"(arr1[0]), "m"(arr2[0])
     : "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%ymm5", "%ymm6"
   );
   return printf("{%d, %d, ...}\n", res[0], res[1]);
}

