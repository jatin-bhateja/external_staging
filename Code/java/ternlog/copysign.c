 
#include "stdio.h"

__attribute__((noinline))
void mycopysign(double &dst, double src) {
  double temp;
  __asm__ volatile(
       "movq $0x7FFFFFFFFFFFFFFF , %1 \n\t"
       "vmovd %1         , %%xmm1    \n\t"
       "vmovd %0         , %%xmm2    \n\t"
       "vmovd %2         , %%xmm3    \n\t"
       "vpternlogd  $0xE4, %%xmm1 , %%xmm3 , %%xmm2 \n\t"
       "vmovd %%xmm2     , %0        \n\t"
      : "+r"(dst) , "=r"(temp)
      : "r"(src)
      : "%xmm1", "%xmm2", "%xmm3"
 );
}

int main() {
  double src = -0.0;
  double dst = 0.0;
  printf("SRC = %lf\n", src);
  printf("DST = %lf\n", dst);
  mycopysign(dst, src);
  return printf("NEW DST = %lf\n", dst);
}
                                                            

                                                            

