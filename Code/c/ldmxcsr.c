

#include "stdio.h"

int main () {
  int mxcsr=0x5f80;
  double res = 0;
  double val = 0.49999999999999994;
  printf("MXCSR = %x\n" , mxcsr);
  asm volatile (
    "ldmxcsr %1 \n"
    "movq %2 , %%xmm1 \n\t"
    "roundsd $4 , %%xmm1, %%xmm2 \n"
    "movq %%xmm2 , %0 \n\t"
  : "=r"(res)
  : "m"(mxcsr) , "r"(val + 0.5)
  : "%xmm1" , "%xmm2" 
  );
  printf("SRC = %lf\n" , val);
  printf("DST = %lf\n" , res);
  val = 0.4999;
  printf("MXCSR = %x\n" , mxcsr);
  asm volatile (
    "ldmxcsr %1 \n"
    "movq %2 , %%xmm1 \n\t"
    "roundsd $4 , %%xmm1, %%xmm2 \n"
    "movq %%xmm2 , %0 \n\t"
  : "=r"(res)
  : "m"(mxcsr) , "r"(val + 0.5)
  : "%xmm1" , "%xmm2" 
  );
  printf("SRC = %lf\n" , val);
  return printf("DST = %lf\n" , res);
}
