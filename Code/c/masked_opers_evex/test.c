
#include "stdio.h"
#include "stdlib.h"

char all_ones[] = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}; 

__attribute__((noinline))
void maskedBinOpInt(char * mask , int * dst, int * src1, int * src2) {
  long mask_mask = 0xFF;
  asm volatile(
     "vmovdqu8 %1  , %%ymm0                      \n\t"   // LoadVector - loads boolean array into vector. Max 64 bytes.
     "kmovq  %5 , %%k1                           \n\t"   // VectorMaskLoad (UseAVX > 2 && vec_len == 64)
     "vpcmpb  $0  ,  %4 , %%ymm0, %%k2 {{%%k1}}  \n\t"   //   
     "vmovdqu32 %2  , %%ymm0                     \n\t"
     "vpaddd   %3   , %%ymm0 , %%ymm0 {{%%k2}}   \n\t"
     "vmovdqu32 %%ymm0 , %0                      \n\t"
   :  "=m"(*dst)
   :  "m"(*mask) , "m"(*src1), "m"(*src2) , "m"(*all_ones) , "r"(mask_mask)
   : "%k2" , "%ymm0"
  );
}

void maskedBinOpChar(char * mask , char * dst, char * src1, char * src2) {
  long mask_mask = 0xFFFF;
  asm volatile(
     "vmovdqu8 %1  , %%xmm0                      \n\t"   // LoadVector - loads boolean arrax into vector. Max 64 bxtes.
     "kmovq  %5 , %%k1                           \n\t"   // VectorMaskLoad (UseAVX > 2 && vec_len == 64)
     "vpcmpb  $0  ,  %4 , %%xmm0, %%k2 {{%%k1}}  \n\t"   //   
     "vmovdqu8 %2  , %%xmm0                     \n\t"
     "vpaddb   %3   , %%xmm0 , %%xmm0 {{%%k2}}   \n\t"
     "vmovdqu8 %%xmm0 , %0                      \n\t"
   :  "=m"(*dst)
   :  "m"(*mask) , "m"(*src1), "m"(*src2) , "m"(*all_ones) , "r"(mask_mask)
   : "%k2" , "%xmm0"
  );
}

int main() {
  char imask[] = {0,1,0,1,0,1,0,1};
  int  isrc1[] = {10,10,10,10,10,10,10,10};
  int  isrc2[] = {20,20,20,20,20,20,20,20};
  int  idst[8]  = {0,0,0,0,0,0,0,0};
  
  maskedBinOpInt(imask, idst, isrc1, isrc2);

  char cmask[] = {0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1};
  char csrc1[] = {10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10};
  char csrc2[] = {20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20};
  char cdst[16]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
  maskedBinOpChar(cmask, cdst, csrc1, csrc2);

  for(int i = 0 ; i < sizeof(cdst)/sizeof(char); i++) {
    printf("dst[%d] = %d\n", i , cdst[i]);
  }
  return 0;
}
