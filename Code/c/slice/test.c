#include <stdio.h>

int src1[] = {
  1,2,3,4,5,6,7,8,
  9,10,11,12,13,14,15,16
};
  
int src2[] = {
  10,20,30,40,50,60,70,80,
  90,100,110,120,130,140,150,160
};
 
int src3[] = {
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
};

//
// AVX2 : 32 byte vectors.
//
//   SLICE_SHIFT <= 16
//   SLICE := [V1_256:LO][V1_256:HI]  [V1_256:HI][V2_256:LO]
//                1          2            3          4
//   DST:L0 =     3 : 1 >> SLICE_SHIFT
//   DST:HI =     4 : 2 >> SLICE_SHIFT
//
//   Higher 128bit lane of source2 will not impact result, which will be
//   sliced from lower and higher 128 bit lane of source1 and lower 128 bit lanes
//   of source2.
// 
//   VPALIGNR has 1 cycles latency.
void micro_le16B(int* dst, int* src1, int* src2) {
   asm volatile(
      "vmovdqu %1, %%ymm1                       \n\t"
      "vmovdqu %2, %%ymm3                       \n\t"
      "vextracti128 $0x1, %%ymm1, %%xmm2        \n\t"
      "vpalignr $12, %%xmm1, %%xmm2, %%xmm0     \n\t" 
      "vpalignr $12, %%xmm2, %%xmm3, %%xmm2     \n\t" 
      "vinserti128 $0x1, %%xmm2, %%ymm0, %%ymm0 \n\t"
      "vmovdqu %%ymm0 , %0                      \n\t"
    : "=m"(*dst)
    : "m"(*src1), "m"(*src2)
    : "%ymm0" , "%ymm1", "%ymm2" , "%ymm3"
   );
}

// Saves one vpalignr
void micro_le16B_alt(int* dst, int* src1, int* src2) {
   asm volatile(
      "vmovdqu %1, %%ymm1                       \n\t" // ymm1 = [V1:LO,V1:HI]
      "vmovdqu %2, %%ymm3                       \n\t"
      "vextracti128 $0x1, %%ymm1, %%xmm4        \n\t" // ymm3 = [V1:HI,V2:LO]
      "vinserti128 $0x1, %%xmm3, %%ymm4, %%ymm4 \n\t" 
      "vpalignr $8, %%ymm1, %%ymm4, %%ymm0      \n\t" 
      "vmovdqu %%ymm0 , %0                      \n\t"
    : "=m"(*dst)
    : "m"(*src1), "m"(*src2)
    : "%ymm0" , "%ymm1", "%ymm2" , "%ymm3", "%ymm4"
   );
}

//   SLICE_SHIFT > 16 
//   Lower 128bit lane of source1 will not impact result, which will be
//   sliced from higher 128 bit lane of source1 and lower and upper 128 bit
//   lanes of source2.
//
//   SLICE := [V1_256:HI][V2_256:L0]  [V2_256:L0][V2_256:HI]
//                1          2            3          4
//   DST:L0 =     3 : 1 >> SLICE_SHIFT
//   DST:HI =     4 : 2 >> SLICE_SHIFT
//   EFFECTIVE_ORIGIN = ORIGIN - 16
void micro_gt16B(int* dst, int* src1, int* src2) {
   asm volatile(
      "vmovdqu %1, %%ymm1                       \n\t"
      "vmovdqu %2, %%ymm3                       \n\t"
      "vextracti128 $0x1, %%ymm1, %%xmm4        \n\t"
      "vinserti128 $0x1, %%xmm3, %%ymm4, %%ymm4 \n\t"
      "vpalignr $12, %%ymm4, %%ymm3, %%ymm0     \n\t" 
      "vmovdqu %%ymm0 , %0                      \n\t"
    : "=m"(*dst)
    : "m"(*src1), "m"(*src2)
    : "%ymm0" , "%ymm1", "%ymm2" , "%ymm3"
   );
}

//
//                               VEC1         VEC2
// AVX512 : 64 byte vectors [V1 V2 V3 V4] [V5 V6 V7 V8] each segment of 128 bit.
//                                                             
//                                                           |-------------|
// SHIFT <= 16                                         |-----|--------|    |
// SLICE :=  [V1][V2][V2][V3] [V3][V4][V4][V5] -> [V1 V2 V3 V4] [V2 V3 V4 V5]
//                                                  |_____|________|    |
//
void micro_64B_LE16(int* dst, int* src1, int* src2) {
   asm volatile(
      "vmovdqu64 %1,  %%zmm1 \n\t"
      "vmovdqu64 %2,  %%zmm2 \n\t"
      "valignd  $4, %%zmm1, %%zmm2, %%zmm3 \n\t"
      "vpalignr $16, %%zmm1, %%zmm3, %%zmm3 \n\t"
      "vmovdqu64 %%zmm3, %0 \n\t"
     : "=m"(*dst)
     : "m"(*src1), "m"(*src2)
     : "%zmm1" ,"%zmm2", "%zmm3"
   );
}

// SHIFT > 16 AND SHIFT <= 32                             |_____________|
// SLICE :=  [V2][V3][V3][V4] [V4][V5][V5][V6] -> [V2 V3 V4 V5] [V3 V4 V5 V6] 
void micro_64B_GT16_LE32(int* dst, int* src1, int* src2) {
   asm volatile(
      "vmovdqu64 %1,  %%zmm1 \n\t"
      "vmovdqu64 %2,  %%zmm2 \n\t"
      "valignd  $4, %%zmm1, %%zmm2, %%zmm3 \n\t"
      "valignd  $8, %%zmm1, %%zmm2, %%zmm4 \n\t"
      "vpalignr $12, %%zmm3, %%zmm4, %%zmm3 \n\t"
      "vmovdqu64 %%zmm3, %0 \n\t"
     : "=m"(*dst)
     : "m"(*src1), "m"(*src2)
     : "%zmm1" ,"%zmm2", "%zmm3", "%zmm4"
   );
}

// SHIFT SHIFT > 32 AND SHIFT <= 48
// SLICE :=  [V3][V4][V4][V5] [V5][V6][V6][V7] -> [V3 V4 V5 V6] [V4 V5 V6 V7]
void micro_64B_GT32_LE48(int* dst, int* src1, int* src2) {
   asm volatile(
      "vmovdqu64 %1,  %%zmm1 \n\t"
      "vmovdqu64 %2,  %%zmm2 \n\t"
      "valignd  $8, %%zmm1, %%zmm2, %%zmm3 \n\t"
      "valignd  $12, %%zmm1, %%zmm2, %%zmm4 \n\t"
      "vpalignr $12, %%zmm3, %%zmm4, %%zmm3 \n\t"
      "vmovdqu64 %%zmm3, %0 \n\t"
     : "=m"(*dst)
     : "m"(*src1), "m"(*src2)
     : "%zmm1" ,"%zmm2", "%zmm3", "%zmm4"
   );
}

// SHIFT SHIFT > 48 AND SHIFT <= 64
// SLICE :=  [V4][V5][V5][V6] [V6][V7][V7][V8] -> [V4 V5 V6 V7] [V5 V6 V7 V8]
void micro_64B_GT48(int* dst, int* src1, int* src2) {
   asm volatile(
      "vmovdqu64 %1,  %%zmm1 \n\t"
      "vmovdqu64 %2,  %%zmm2 \n\t"
      "valignd  $12, %%zmm1, %%zmm2, %%zmm3 \n\t"
      "vpalignr $8, %%zmm3, %%zmm2, %%zmm3 \n\t"
      "vmovdqu64 %%zmm3, %0 \n\t"
     : "=m"(*dst)
     : "m"(*src1), "m"(*src2)
     : "%zmm1" ,"%zmm2", "%zmm3", "%zmm4"
   );
}

// slice from two 128 bit vectors
void micro_16b(int* dst, int* src1, int* src2) {
   asm volatile(
      "vmovdqu %1,  %%xmm1 \n\t"
      "vmovdqu %2,  %%xmm2 \n\t"
      "vpalignr $8, %%xmm1, %%xmm2, %%xmm3 \n\t"
      "vmovdqu %%xmm3, %0 \n\t"
     : "=m"(*dst)
     : "m"(*src1), "m"(*src2)
     : "%xmm1" ,"%xmm2", "%xmm3", "%xmm4"
   );
}

void print_arr(const char* msg, int* src, int len) {
   printf("%s : [", msg);
   for (int i = 0;i < len; i++) {
      printf("%d ", src[i]);
   }
   printf(" ]\n");
}

int main() {
  int dst[16];
  //micro_gt16B(dst, src1, src2);
  micro_16b(dst, src1, src2);
  print_arr("src1 = ", src1, sizeof(src1)/sizeof(int)); 
  print_arr("src2 = ", src2, sizeof(src2)/sizeof(int)); 
  printf("origin = 7\n");
  print_arr("dst = ", dst, sizeof(dst)/sizeof(int)); 
  return 0;
}
