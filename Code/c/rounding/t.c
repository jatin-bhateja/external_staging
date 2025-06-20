
#include "stdio.h"

__attribute__((noinline))
double round_func(double src) {
 int mxcsr=0x3f80;
 long dst = 0;
 fprintf(stdout, "SRC = %lf\n", src);
 __asm__ volatile (
      "ldmxcsr %2 \n"
      "cvtsd2si  %1, %0 \n\t"
    : "=r"(dst)
    : "x"(src), "m"(mxcsr)
    : "cc" 
 );
 double dst1 = 0.0;
 fprintf(stdout, "DST = %ld\n", dst);
 __asm__ volatile (
      "ldmxcsr %2 \n"
      "roundsd  $4, %1, %0 \n\t"
    : "=x"(dst1)
    : "x"(src), "m"(mxcsr)
    : "cc" 
 );
 fprintf(stdout, "DST = %lf\n", dst1);
 return dst;
}

int main() {
  return (int)round_func(-12.3);
} 
