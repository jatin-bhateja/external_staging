#include <stdio.h>

int main (int argc, char* argv[]) {
   int res[8];
  int arr1[] =  {
     // MIN_VAL   MAX_VAL
     0x80000000, 0x7FFFFFFF, 0x80000000, 0x7FFFFFFF,
     0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF,
  };

  int arr2[] =  {
     //MIN-2    MAX+(2)     MIN + 1      MAX + 1
     -2,           2,           1,           1,
     1,1,1,1,
  };
  for (int i = 0; i < 900000000; i++) {
   asm volatile (
      "vmovdqu %1, %%ymm1           \n\t"
      "vmovdqu %2, %%ymm2           \n\t"
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
      "vmovdqu %%ymm4, %0           \n\t"
     : "=m"(res[0])
     : "m"(arr1[0]), "m"(arr2[0])
     : "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%ymm5", "%ymm6"
   );
   }
   return printf("{%d, %d, %d, %d...}\n", res[0], res[1], res[2], res[3]);
}

