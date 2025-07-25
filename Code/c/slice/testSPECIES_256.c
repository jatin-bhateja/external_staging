
#include <stdio.h>

// slice index := 0 - 16 bytes
void slice_index_le_16B(int* dst, int* src1, int* src2) {
   // Orignal vector
   // VEC1 = {V2, V1};
   //        MSL  LSL , where MSL most significant 128 bit lane and LSL is least significant 128 bit lane.
   // VEC2 = {V4, V3};
   //        MSL  LSL , where MSL most significant 128 bit lane and LSL is least significant 128 bit lane.
   // 
   // Format needed by VPALIGNR
   //  VPALIGNR {V3 V2} {V2 V1} SHIFT<LE 16B>
   // 
   asm volatile(
      "vmovdqu %1, %%ymm1                       \n\t"  // [V2 V1]
      "vmovdqu %2, %%ymm2                       \n\t"  // [V4 V3] 
      "vperm2i128 $0x21, %%ymm2, %%ymm1, %%ymm2 \n\t"  // [V3 V2]
      "vpalignr $12, %%ymm1, %%ymm2, %%ymm2     \n\t" 
      "vmovdqu %%ymm2, %0 \n\t"
     : "=m"(*dst)
     : "m"(*src1), "m"(*src2)
     : "cc", "%ymm1" , "%ymm2"
   ); 
}

// slice index := 0 - 16 bytes
void slice_index_gt_16B(int* dst, int* src1, int* src2) {
   // Orignal vector
   // VEC1 = {V2, V1};
   //        MSL  LSL , where MSL most significant 128 bit lane and LSL is least significant 128 bit lane.
   // VEC2 = {V4, V3};
   //        MSL  LSL , where MSL most significant 128 bit lane and LSL is least significant 128 bit lane.
   // 
   // Format needed by VPALIGNR
   //  VPALIGNR {V4 V3} {V3 V2} SHIFT<GT 16B>
   // 
   asm volatile(
      "vmovdqu %1, %%ymm1                       \n\t"  // [V2 V1]
      "vmovdqu %2, %%ymm2                       \n\t"  // [V4 V3]
      "vperm2i128 $0x21, %%ymm2, %%ymm1, %%ymm1 \n\t"  // [V3 V2]
      "vpalignr $12, %%ymm1, %%ymm2, %%ymm2     \n\t"
      "vmovdqu %%ymm2, %0 \n\t"
     : "=m"(*dst)
     : "m"(*src1), "m"(*src2)
     : "cc", "%ymm1" , "%ymm2"
   ); 
}

int main() {
   int dst[]  = {0, 0, 0, 0, 0, 0, 0, 0};
   int src1[] = {1, 2, 3, 4, 5, 6, 7, 8};
   int src2[] = {10, 20, 30, 40, 50, 60, 70, 80};
   
   slice_index_le_16B(dst, src1, src2); 

   printf("src1 = {%d, %d, %d, %d, %d, %d, %d, %d} \n", src1[0], src1[1], src1[2], src1[3], src1[4], src1[5], src1[6], src1[7]); 
   printf("src2 = {%d, %d, %d, %d, %d, %d, %d, %d} \n", src2[0], src2[1], src2[2], src2[3], src2[4], src2[5], src2[6], src2[7]); 
   printf("dst = {%d, %d, %d, %d, %d, %d, %d, %d} \n", dst[0], dst[1], dst[2], dst[3], dst[4], dst[5], dst[6], dst[7]); 

   slice_index_gt_16B(dst, src1, src2); 

   printf("src1 = {%d, %d, %d, %d, %d, %d, %d, %d} \n", src1[0], src1[1], src1[2], src1[3], src1[4], src1[5], src1[6], src1[7]); 
   printf("src2 = {%d, %d, %d, %d, %d, %d, %d, %d} \n", src2[0], src2[1], src2[2], src2[3], src2[4], src2[5], src2[6], src2[7]); 
   printf("dst = {%d, %d, %d, %d, %d, %d, %d, %d} \n", dst[0], dst[1], dst[2], dst[3], dst[4], dst[5], dst[6], dst[7]); 
   return 0;
}
