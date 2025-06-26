
#include "stdio.h"

void xorargs(double * src1 , double * src2 , double * dst) {
   __asm__ volatile (
       "vmovdqu64  %1 , %%zmm1          \n\t"
       "vpxorq     %2 , %%zmm1 , %%zmm0 \n\t"
       "vmovdqu64  %%zmm0 , %0          \n\t"
     : "=m"(dst)
     : "m"(src1), "m"(src2)
     : "%zmm0", "%zmm1"
   );
}

int main() {
   double dst[8];
   double src1 [] = {1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0};
   double src2 [] = {1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0};
   xorargs(src1, src2, dst);
   for(int i = 0 ; i  < 8 ; i++) {
     fprintf(stdout, "Res [%d] : %lf\n", i, dst[i]);
   }
   return 0;
}
