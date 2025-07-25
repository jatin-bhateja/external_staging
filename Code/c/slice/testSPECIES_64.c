
#include <stdio.h>

int main() {
   int dst[2] = {0, 0};
   int src1[] = {1, 2};
   int src2[] = {10, 20};
   
   asm volatile(
      "movq %1, %%xmm1 \n\t"
      "movq %2, %%xmm2 \n\t"
      "movq %%xmm2, %%rax \n\t"
      "vpinsrq $1, %%rax, %%xmm1, %%xmm1 \n\t"
      "vpsrldq $4, %%xmm1, %%xmm1         \n\t"
      "movq %%xmm1, %0 \n\t"
     : "=m"(dst)
     : "m"(src1), "m"(src2)
     : "cc", "%xmm1" , "%xmm2", "%rax"
   ); 

   printf("src1 = {%d, %d} \n", src1[0], src1[1]); 
   printf("src2 = {%d, %d} \n", src2[0], src2[1]); 
   printf("dst = {%d, %d} \n", dst[0], dst[1]); 
   return 0;
}
