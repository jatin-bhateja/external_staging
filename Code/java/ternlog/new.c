 
#include "iacaMarks.h"
#include "stdio.h"

__attribute__((noinline))
void compute(int * r, int * a, int * b, int * c) {
  __asm__ volatile(
         "vmovdqu32 %1, %%zmm0  \n\t"
         "vmovdqu32 %2, %%zmm1  \n\t"
         "vmovdqu32 %3, %%zmm2  \n\t"
         "movl $111, %%ebx         \n\t"
         " .byte 0x64, 0x67, 0x90  \n\t"
         "vpternlogd $0xD8,%%zmm2,%%zmm1, %%zmm0 \n\t"
         "movl $222, %%ebx         \n\t"
         " .byte 0x64, 0x67, 0x90  \n\t"
         "vmovdqu32 %%zmm0, %0   \n\t" 
      : "=m"(*r)
      : "m"(*a) , "m"(*b), "m"(*c)
      : "%ebx", "%zmm0", "%zmm1", "%zmm2"
 );
}

int main() {
  //  a[i] = 4; b[i] = 9; c[i] = -1
  int a[] = {
    4,4,4,4,4,4,4,4,
    4,4,4,4,4,4,4,4
  };
  int b[] = {
    9,9,9,9,9,9,9,9,
    9,9,9,9,9,9,9,9
  };
  int c[] = {
    0,-1,0,-1,0,-1,0,-1,
    0,-1,0,-1,0,-1,0,-1
  };
  int r[16];
  for(int i = 0 ; i < 1000000000;  i++)
     compute(r,a,b,c);
  int res  =0;
  for (int i = 0 ; i < 16; i++) {
     printf("%d\n",r[i]);
     res += r[i];
  }
  return res ;
}
                                                            

                                                            

