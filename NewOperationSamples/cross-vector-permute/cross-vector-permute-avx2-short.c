
#include <stdio.h>

////
//// Vector.selectFrom(Vector<E> v1, Vector<E> v2, VectorMask<E> selection_mask);
////  API : ARG1 INDEX_VECTOR
////      : ARG2 VECTOR
////      : ARG3 VECTOR
////      : ARG4 MASK (0:ARG2, 1:ARG3)        
////  IR Level BreakDown:  
////      VectorBlend (VectorRearrange this, v1) (VectorRearrange this v2) selection_mask
////  VectorBlend::Idealization
////      Match pattern
////      if (TargetSupportCrossVectorPermute) {
////          VectorCrossVectorPermute
////      }
////      Return nullptr.
////
int main() {
  short arr1[16];
  short arr2[16];
  // SRC is overwritten, TEMP
  short permm[16] = {
    2,4,6,8,2,4,6,8,
    10,12,14,16,10,12,14,16,
  };
  for (int i = 0; i < 16; i++) {
     arr1[i] = i + 1;
  }
  for (int i = 0; i < 16; i++) {
     arr2[i] = i + 16;
  }

  int mask[] = {
     0, -1, 0, -1, 0, -1, 0, -1,
     0, -1, 0, -1, 0, -1, 0, -1,
  };

  //for (int i = 0; i < 100000000; i++) {
    asm volatile(
       "vmovdqu %1, %%ymm1  \n\t"
       "vmovdqu %2, %%ymm2  \n\t"
       "vmovdqu %0, %%ymm3  \n\t"
       "vmovdqu %3, %%ymm8  \n\t"

       "vpcmpeqd %%ymm4, %%ymm4, %%ymm4 \n\t"
       "vpxor  %%ymm6, %%ymm6, %%ymm6 \n\t"
       "vpsubw %%ymm5, %%ymm6, %%ymm6 \n\t"
       "vpaddw %%ymm6, %%ymm3, %%ymm5 \n\t"
       "vpsllw $8, %%ymm5, %%ymm5 \n\t"
       "vpor %%ymm5, %%ymm3, %%ymm5 \n\t"

       "vperm2i128 $0x1, %%ymm1, %%ymm1, %%ymm9 \n\t"
       "vpshufb %%ymm5, %%ymm1, %%ymm1 \n\t"
       "vpshufb %%ymm5, %%ymm9, %%ymm9 \n\t"
       "vpsrlw $29, %%ymm4, %%ymm6      \n\t"
       "vpcmpgtw %%ymm6, %%ymm5, %%ymm6 \n\t"
       "vpblendvb %%ymm6, %%ymm9, %%ymm1, %%ymm1 \n\t"

       "vperm2i128 $0x1, %%ymm2, %%ymm1, %%ymm9 \n\t"
       "vpshufb %%ymm5, %%ymm2, %%ymm2 \n\t"
       "vpshufb %%ymm5, %%ymm9, %%ymm9 \n\t"
       "vpblendvb %%ymm6, %%ymm9, %%ymm2, %%ymm2 \n\t"

       "vpblendvb %%ymm8, %%ymm2, %%ymm1, %%ymm3 \n\t"
       "vmovdqu64 %%ymm3, %0  \n\t"
     : "+m"(permm[0])
     : "m"(arr1[0]), "m"(arr2[0]), "m"(mask[0])
     : "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%ymm5", "%ymm6", "%ymm7", "%ymm8", "%ymm9"
    );
  //}

  for (int i = 0; i < 16; i++) {
     printf("%d \n", permm[i]);
  }
  return 0;
}

