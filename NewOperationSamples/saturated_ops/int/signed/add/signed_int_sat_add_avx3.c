#include <stdio.h>

int main (int argc, char* argv[]) {
   int res[16];
  int arr1[] =  {
     // MIN_VAL   MAX_VAL
     0x80000000, 0x7FFFFFFF, 0x80000000, 0x7FFFFFFF,
     0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF,
     0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF,
     0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF,
  };

  int arr2[] =  {
     //MIN-2    MAX+(2)     MIN + 1      MAX + 1
     -2,           2,           1,           1,
     1,1,1,1,
     1,1,1,1,
     1,1,1,1,
  };
   for (int i = 0; i < 900000000; i++) {
   asm volatile (
      "vmovdqu32 %1, %%zmm1           \n\t"
      "vmovdqu32 %2, %%zmm2           \n\t"
      "vpmovsxdq %%ymm1, %%zmm3       \n\t"
      "vpmovsxdq %%ymm2, %%zmm4       \n\t"
      "vpaddq %%zmm3, %%zmm4, %%zmm4  \n\t"
      "vpmovsqd %%zmm4, %%ymm4        \n\t"
      "vextracti64x4 $0x1, %%zmm1, %%ymm5   \n\t"
      "vextracti64x4 $0x1, %%zmm2, %%ymm6   \n\t"
      "vpmovsxdq %%ymm5, %%zmm5       \n\t"
      "vpmovsxdq %%ymm6, %%zmm6       \n\t"
      "vpaddq %%zmm5, %%zmm6, %%zmm6  \n\t"
      "vpmovsqd %%zmm6, %%ymm6        \n\t"
      "vinserti64x4 $0x1, %%ymm6, %%zmm4, %%zmm4 \n\t"
      "vmovdqu64 %%zmm4, %0           \n\t"
     : "=m"(res[0])
     : "m"(arr1[0]), "m"(arr2[0])
     : "%zmm1", "%zmm2", "%zmm3", "%zmm4", "%zmm5", "%zmm6"
   );
   }
   return printf("{%d, %d, %d, %d ...}\n", res[0], res[1], res[2], res[3]);
}

