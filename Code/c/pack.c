#include "stdio.h"

int main() {
  char dst[4];
  __attribute__((aligned(8)))
  char src[] = {0,-1,0,-1};
  asm volatile(
     "movd %1 , %%xmm0 \n\t"
     "pmovsxbd %%xmm0 , %%xmm0 \n\t"
     "vpxor %%xmm1, %%xmm1 , %%xmm1 \n\t"
     "packssdw  %%xmm1, %%xmm0 \n\t"
     "packsswb  %%xmm1, %%xmm0 \n\t"
     "vmovdqu %%xmm0 , %0 \n\t"
    : "=m"(*dst)
    : "m"(*src) 
    : "%xmm0"
  );
  for(int i = 0 ; i < sizeof(dst)/sizeof(short); i++) {
    printf("%d\n", (int)(((char*)dst)[i]));
  }
  return 0;
}
