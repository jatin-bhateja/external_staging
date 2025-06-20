#include "stdio.h"

__attribute__((aligned(64))) int a[] = {
     1,2,3,4,
     5,6,7,8,
     9,10,11,12,
     13,14,15,16
 };
__attribute__((aligned(64))) int b[] = {
     1,2,3,4,
     5,6,7,8,
     9,10,11,12,
     13,14,15,16
 };

__attribute__((aligned(64))) int res[16];

int loadVec() {
   __asm__ volatile (
      "movl $111, %%ebx               \n\t"
      ".byte 0x64, 0x67, 0x90         \n\t"
      "vmovdqu %1, %%ymm0             \n\t"
      "vmovdqu %2, %%ymm1             \n\t"
      "vpaddd  %%ymm1, %%ymm0, %%ymm0 \n\t"
      "vmovdqu %%ymm0, %0             \n\t"
      "movl $222,  %%ebx              \n\t"
      ".byte 0x64, 0x67, 0x90         \n\t"
    : "=m"(*res)
    : "m"(*a), "m"(*b)
    : "%ymm0" , "%ymm1", "%ebx"
   );
   return res[7];
}

int main() {
 return printf("%d\n",loadVec());
}
