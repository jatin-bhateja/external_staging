
#include <stdio.h>

// unslice index := 16 - 32 bytes
// [v1]                     [v2]
// [1, 2, 3, 4, 5, 6, 7, 8] [10, 20, 30, 40, 50, 60, 70, 80]
// v1.unslice(5, v2, 0) // part 0
// [10, 20, 30, 40, 50, 1, 2, 3]
void unslice_index_gt_16B(int* dst, int* src1, int* src2) {
   // Orignal vector
   // VEC1 = {V2, V1};
   //        MSL  LSL , where MSL most significant 128 bit lane and LSL is least significant 128 bit lane.
   // VEC2 = {V4, V3};
   //        MSL  LSL , where MSL most significant 128 bit lane and LSL is least significant 128 bit lane.
   // 
   // Format needed by VPALIGNR
   //  VPALIGNR {V3 V2} {V2 V1} SHIFT<LE 16B>
   // 
   long mask = (((1L << (8 - 3)) - 1));
   asm volatile(
      "vmovdqu %1, %%ymm1                       \n\t"  // [V2 V1]
      "vmovdqu %2, %%ymm2                       \n\t"  // [V4 V3] 
      "vperm2i128 $0x21, %%ymm2, %%ymm1, %%ymm3 \n\t"  // [V3 V2]
      "vpalignr $12, %%ymm1, %%ymm3, %%ymm3     \n\t" 
      "movq  %3, %%rax                          \n\t"
      "kmovq %%rax, %%k1                        \n\t" 
      "vpblendmd %%ymm1, %%ymm3, %%ymm2 %{%%k1} \n\t"
      "vmovdqu %%ymm2, %0 \n\t"
     : "=m"(*dst)
     : "m"(*src2), "m"(*src1), "r"(mask)
     : "cc", "%ymm1" , "%ymm2", "%k1", "%ymm3", "%rax"
   ); 
}

// unslice index := 0 - 16 bytes
// [part 0]
void unslice_index_le_16B(int* dst, int* src1, int* src2) {
   // Orignal vector
   // VEC1 = {V2, V1};
   //        MSL  LSL , where MSL most significant 128 bit lane and LSL is least significant 128 bit lane.
   // VEC2 = {V4, V3};
   //        MSL  LSL , where MSL most significant 128 bit lane and LSL is least significant 128 bit lane.
   // 
   // Format needed by VPALIGNR
   //  VPALIGNR {V4 V3} {V3 V2} SHIFT<GT 16B>
   // 
   long mask = (((1L << (8 - 3)) - 1) << 3);
   asm volatile(
      "vmovdqu %1, %%ymm1                       \n\t"  // [V2 V1]
      "vmovdqu %2, %%ymm2                       \n\t"  // [V4 V3]
      "vperm2i128 $0x21, %%ymm2, %%ymm1, %%ymm3 \n\t"  // [V3 V2]
      "vpalignr $4, %%ymm3, %%ymm2, %%ymm3      \n\t"
      "movq  %3, %%rax                          \n\t"
      "kmovq %%rax, %%k1                        \n\t" 
      "vpblendmd %%ymm3, %%ymm1, %%ymm2 %{%%k1} \n\t"
      "vmovdqu %%ymm2, %0 \n\t"
     : "=m"(*dst)
     : "m"(*src2), "m"(*src1), "r"(mask)
     : "cc", "%ymm1" , "%ymm2", "%ymm3", "%rax", "%k1"
   ); 
}

int main() {
   int dst[]  = {0, 0, 0, 0, 0, 0, 0, 0};
   int src1[] = {1, 2, 3, 4, 5, 6, 7, 8};
   int src2[] = {10, 20, 30, 40, 50, 60, 70, 80};
   
   unslice_index_gt_16B(dst, src1, src2); 

   printf("src1 = {%d, %d, %d, %d, %d, %d, %d, %d} \n", src1[0], src1[1], src1[2], src1[3], src1[4], src1[5], src1[6], src1[7]); 
   printf("src2 = {%d, %d, %d, %d, %d, %d, %d, %d} \n", src2[0], src2[1], src2[2], src2[3], src2[4], src2[5], src2[6], src2[7]); 
   printf("dst = {%d, %d, %d, %d, %d, %d, %d, %d} \n", dst[0], dst[1], dst[2], dst[3], dst[4], dst[5], dst[6], dst[7]); 

   unslice_index_le_16B(dst, src1, src2); 

   printf("src1 = {%d, %d, %d, %d, %d, %d, %d, %d} \n", src1[0], src1[1], src1[2], src1[3], src1[4], src1[5], src1[6], src1[7]); 
   printf("src2 = {%d, %d, %d, %d, %d, %d, %d, %d} \n", src2[0], src2[1], src2[2], src2[3], src2[4], src2[5], src2[6], src2[7]); 
   printf("dst = {%d, %d, %d, %d, %d, %d, %d, %d} \n", dst[0], dst[1], dst[2], dst[3], dst[4], dst[5], dst[6], dst[7]); 
   return 0;
}

/*
src1 = {1, 2, 3, 4, 5, 6, 7, 8}
src2 = {10, 20, 30, 40, 50, 60, 70, 80}
dst = {10, 20, 30, 40, 50, 1, 2, 3}
src1 = {1, 2, 3, 4, 5, 6, 7, 8}
src2 = {10, 20, 30, 40, 50, 60, 70, 80}
dst = {10, 20, 30, 1, 2, 3, 4, 5}

PROMPT>jshell --add-modules=jdk.incubator.vector
|  Welcome to JShell -- Version 26-internal
|  For an introduction type: /help intro

jshell> import jdk.incubator.vector.*

jshell> int [] src1 =  {1, 2, 3, 4, 5, 6, 7, 8}
src1 ==> int[8] { 1, 2, 3, 4, 5, 6, 7, 8 }

jshell> int [] src2 = {10, 20, 30, 40, 50, 60, 70, 80}
src2 ==> int[8] { 10, 20, 30, 40, 50, 60, 70, 80 }

jshell> var vsrc1 = IntVector.fromArray(IntVector.SPECIES_256, src1, 0)
vsrc1 ==> [1, 2, 3, 4, 5, 6, 7, 8]

jshell> var vsrc2 = IntVector.fromArray(IntVector.SPECIES_256, src2, 0)
vsrc2 ==> [10, 20, 30, 40, 50, 60, 70, 80]

jshell> vsrc1.unslice(5, vsrc2, 0)
$6 ==> [10, 20, 30, 40, 50, 1, 2, 3]

jshell> vsrc1.unslice(3, vsrc2, 0)
$7 ==> [10, 20, 30, 1, 2, 3, 4, 5]
*/
