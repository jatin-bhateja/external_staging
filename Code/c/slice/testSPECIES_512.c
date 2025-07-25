
#include <stdio.h>

// VEC1 = {V4, V3, V2, V1}
//        511...........0
// VEC2 = {V8, V7, V6, V5}
//        511...........0
// 4 cases
// 1. Slice index : LT 16 bytes.
// Formatted indices = (V1 V2 V3 V4  V2 V3 V4 V5}
//  
// 2. Slice index : GE 16 bytes and LT 32.
// Formatted indices = (V2 V3 V4 V5  V3 V4 V5 V6}
//  



// slice index := 0 - 16 bytes
void slice_index_le_16B(int* dst, int* src1, int* src2) {
   asm volatile(
      "vmovdqu64 %1, %%zmm1                       \n\t"  // [V2 V1]
      "vmovdqu64 %2, %%zmm2                       \n\t"  // [V4 V3] 
      "valignd $4, %%zmm1, %%zmm2, %%zmm3         \n\t"
      "vpalignr $12, %%zmm1, %%zmm3, %%zmm2     \n\t" 
      "vmovdqu64 %%zmm2, %0 \n\t"
     : "=m"(*dst)
     : "m"(*src1), "m"(*src2)
     : "cc", "%ymm1" , "%ymm2"
   ); 
}

// slice index := 16 - 31 bytes
void slice_index_ge_16B_lt_32B(int* dst, int* src1, int* src2) {
   asm volatile(
      "vmovdqu64 %1, %%zmm1                       \n\t"  // [V2 V1]
      "vmovdqu64 %2, %%zmm2                       \n\t"  // [V4 V3] 
      "valignd $4, %%zmm1, %%zmm2, %%zmm3         \n\t"
      "valignd $8, %%zmm1, %%zmm2, %%zmm1         \n\t"
      "vpalignr $12, %%zmm3, %%zmm1, %%zmm3     \n\t" 
      "vmovdqu64 %%zmm3, %0 \n\t"
     : "=m"(*dst)
     : "m"(*src1), "m"(*src2)
     : "cc", "%ymm1" , "%ymm2"
   ); 
}

int main() {
   int dst[]  = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
   int src1[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
   int src2[] = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160};
   
   slice_index_le_16B(dst, src1, src2); 

   printf("src1 = {%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d} \n",
                   src1[0], src1[1], src1[2], src1[3], src1[4], src1[5], src1[6], src1[7], 
                   src1[8], src1[9], src1[10], src1[11], src1[12], src1[13], src1[14], src1[15]); 
   printf("src2 = {%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d} \n",
                   src2[0], src2[1], src2[2], src2[3], src2[4], src2[5], src2[6], src2[7], 
                   src2[8], src2[9], src2[10], src2[11], src2[12], src2[13], src2[14], src2[15]); 
   printf("dst = {%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d} \n",
                   dst[0], dst[1], dst[2], dst[3], dst[4], dst[5], dst[6], dst[7], 
                   dst[8], dst[9], dst[10], dst[11], dst[12], dst[13], dst[14], dst[15]); 

   slice_index_ge_16B_lt_32B(dst, src1, src2); 

   printf("src1 = {%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d} \n",
                   src1[0], src1[1], src1[2], src1[3], src1[4], src1[5], src1[6], src1[7], 
                   src1[8], src1[9], src1[10], src1[11], src1[12], src1[13], src1[14], src1[15]); 
   printf("src2 = {%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d} \n",
                   src2[0], src2[1], src2[2], src2[3], src2[4], src2[5], src2[6], src2[7], 
                   src2[8], src2[9], src2[10], src2[11], src2[12], src2[13], src2[14], src2[15]); 
   printf("dst = {%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d} \n",
                   dst[0], dst[1], dst[2], dst[3], dst[4], dst[5], dst[6], dst[7], 
                   dst[8], dst[9], dst[10], dst[11], dst[12], dst[13], dst[14], dst[15]); 
   //slice_index_gt_16B(dst, src1, src2); 

   return 0;
}
