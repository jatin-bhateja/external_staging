
#include <stdio.h>

int main() {
   int dst[]  = {0, 0, 0, 0};
   int src1[] = {1, 2, 3, 4};
   int src2[] = {10, 20, 30, 40};
   
   asm volatile(
      "movdqu %1, %%xmm1 \n\t"
      "movdqu %2, %%xmm2 \n\t"
      "vpalignr $16, %%xmm1, %%xmm2, %%xmm2 \n\t"
      "movdqu %%xmm1, %0 \n\t"
     : "=m"(dst)
     : "m"(src1), "m"(src2)
     : "cc", "%xmm1" , "%xmm2", "%rax"
   ); 

   printf("src1 = {%d, %d, %d, %d} \n", src1[0], src1[1], src1[2], src1[3]); 
   printf("src2 = {%d, %d, %d, %d} \n", src2[0], src2[1], src2[2], src2[3]); 
   printf("dst = {%d, %d, %d, %d} \n", dst[0], dst[1], dst[2], dst[3]); 
   return 0;
}
