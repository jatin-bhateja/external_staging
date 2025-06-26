
#include "stdio.h"
#include "stdlib.h"
#include "iacaMarks.h"

char all_ones[] = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}; 

__attribute__((noinline))
void maskedUnOpInt(int * dst, int * src1) {
  long mask_mask = 0x0F;
  IACA_START
  asm volatile(
     "kmovq       %2 , %%k1           \n\t"   // VectorMaskLoad (UseAVX > 2 && vec_len == 64)
     "vmovdqu32   %1 , %%ymm0         \n\t"   // VectorMaskLoad (UseAVX > 2 && vec_len == 64)
     "vpabsd      %%ymm0, %%ymm1 {{%%k1}} \n\t"
     "vmovdqu32   %%ymm1 , %0         \n\t"
   :  "=m"(*dst)
   :  "m"(*src1), "r"(mask_mask)
   : "%k1" , "%ymm0", "%ymm1"
  );
  IACA_END
}

int main() {
  int  isrc1[] = {-10,-10,-10,-10,-10,-10,-10,-10};
  int  idst[8]  = {0,0,0,0,0,0,0,0};
  
  maskedUnOpInt(idst, isrc1);

  for(int i = 0 ; i < sizeof(idst)/sizeof(int); i++) {
    printf("dst[%d] = %d\n", i , idst[i]);
  }
  return 0;
}
