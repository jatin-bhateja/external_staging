 
#include "iacaMarks.h"
#include "stdio.h"

int minus_1 = -1;

__attribute__((noinline))
void compute(int * r, int * a, int * b, int * c) {
  int * neg = &minus_1;
  __asm__ volatile(
         "vmovdqu32 %1 , %%zmm0    \n\t"
         "vmovdqu32 %2 , %%zmm1    \n\t" 
         "vmovdqu32 %3 , %%zmm2    \n\t" 
         "movl $111, %%ebx         \n\t"
         " .byte 0x64, 0x67, 0x90  \n\t"
         "vpxord %4 {{1to16}}, %%zmm0,%%zmm3 \n\t"
         "vpord  %%zmm1,%%zmm2,%%zmm4 \n\t"
         "vpandd %%zmm2,%%zmm3,%%zmm3 \n\t" 
         "vpxord %4 {{1to16}},%%zmm2,%%zmm2 \n\t"
         "vpord  %%zmm3,%%zmm4,%%zmm3 \n\t"
         "vpxord %4 {{1to16}},%%zmm1,%%zmm1 \n\t"
         "vpord  %%zmm1,%%zmm2,%%zmm1 \n\t"
         "vpandd %%zmm0,%%zmm1,%%zmm0 \n\t"
         "vpxord %%zmm3,%%zmm0,%%zmm0 \n\t"
         "movl $222, %%ebx         \n\t"
         " .byte 0x64, 0x67, 0x90  \n\t"
         "vmovdqu32 %%zmm0, %0      \n\t"
      : "=m"(*r)
      : "m"(*a) , "m"(*b), "m"(*c) , "m"(*neg)
      : "%ebx", "%zmm0", "%zmm1", "%zmm2" ,"%zmm3" , "%zmm4", "%zmm6"
 );
}

int main() {
  int a[] = {
    1,2,3,4,5,6,7,8,
    1,2,3,4,5,6,7,8
  };
  int b[] = {
    1,2,3,4,5,6,7,8,
    1,2,3,4,5,6,7,8
  };
  int c[] = {
    1,2,3,4,5,6,7,8,
    1,2,3,4,5,6,7,8
  };
  int r[16];
  for(int i = 0 ; i < 1000000000;  i++)
     compute(r,a,b,c);
  int res  =0;
  for (int i = 0 ; i < 16; i++)
     res += r[i];
  return res ;
}
                                                            

