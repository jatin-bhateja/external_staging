
#include "stdio.h"

int mem[] = {
  0x1, 0x1, 0x1, 0x1,
  0x1, 0x1, 0x1, 0x1,
  0x1, 0x1, 0x1, 0x1,
  0x1, 0x1, 0x1, 0x1
};
  

long micro(char * mask) {
  long out;
  __asm__ volatile(
   "vmovdqu %1 , %%xmm1 \n\t"
   "vpmovsxbd %%xmm1 , %%zmm2 \n\t"
   "vpcmpeqd  %2  , %%zmm2 , %%k1 \n\t" 
   "kmovq %%k1 , %0  \n\t"
   : "=r"(out)
   : "m"(*mask) , "m"(*mem)
   : "%xmm0", "%xmm1" , "%zmm2" , "%k1"
  );
  return out; 
}

int main() {
  char mask[] = {0x1,0x1,0x1,0x1,0x1,0,0,0,0,0,0,0,0,0,0,0};
  return printf("%ld \n", micro(mask));
}
