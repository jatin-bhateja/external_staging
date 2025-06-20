
#include "stdio.h"

// Constraint AVX512BW.
void rearrange_bytes(char* dst, char* src, char* indexes) {
  asm volatile(
    "vmovdqu64 %1 , %%zmm1 \n\t"
    "vmovdqu64 %2 , %%zmm2 \n\t"

    // Shuffle lanes using permute mask (shuffles are inlane operation
    // and indices are contained in lower 4 bit of each shuffle lane).
    // All shuffle indices are normalized to index range 0-15.
    "movl $16 , %%eax \n\t"
    "vpbroadcastb %%eax , %%zmm3 \n\t"

    // Compute MASK for INDEX >= 0 && INDEX < 16 
    // Broadcast first 128 bit shuffled lane across entire vector and
    // move lanes corresponding to true mask to destination 
    // vector register.
    "vpcmpb $1 , %%zmm3, %%zmm2,  %%k2 \n\t"
    "vpermq $0x44, %%zmm1, %%zmm5 \n\t"              // 3
    "vinserti64x4 $0x1, %%ymm5, %%zmm5, %%zmm5 \n\t" // 3
    "vpshufb   %%zmm2, %%zmm5 , %%zmm5 \n\t"
    "vmovdqu8 %%zmm5, %%zmm6 %{%%k2} %{z} \n\t"

    // Compute MASK for INDEX >= 16 && INDEX < 31 
    // Broadcast second 128 bit shuffled lane across entire vector and
    // move lanes corresponding to true mask to destination 
    // vector register.
    "vpcmpb $5 , %%zmm3, %%zmm2, %%k1 \n\t"
    "vpsllq $1 , %%zmm3, %%zmm4 \n\t"
    "vpcmpb $1 , %%zmm4, %%zmm2,  %%k2 \n\t"
    "kandq %%k1 , %%k2, %%k2 \n\t"
    "vpermq $0xEE, %%zmm1, %%zmm5 \n\t"              // 3
    "vinserti64x4 $0x1, %%ymm5, %%zmm5, %%zmm5 \n\t" // 3
    "vpshufb   %%zmm2, %%zmm5 , %%zmm5 \n\t"
    "vmovdqu8 %%zmm5, %%zmm7 %{%%k2} %{z} \n\t"
    "vporq %%zmm7, %%zmm6, %%zmm6 \n\t"

    // Compute MASK for INDEX >= 32 && INDEX < 47
    // Broadcast third 128 bit shuffled lane across entire vector and
    // move lanes corresponding to true mask to destination 
    //  vector register.
    "vpcmpb $5 , %%zmm4, %%zmm2, %%k1 \n\t"
    "vpaddb %%zmm4, %%zmm3, %%zmm4 \n\t"
    "vpcmpb $1 , %%zmm4, %%zmm2,  %%k2 \n\t"
    "kandq %%k1 , %%k2, %%k2 \n\t"
    "vpermq $0x44, %%zmm1, %%zmm5 \n\t"           // 3  ALTERNATE: VMOVDQU [1:9] ZMM1, [4,5,4,5]
    "vextracti64x4 $0x1, %%zmm5, %%ymm5 \n\t"     // 3             VPERMQ  [3]
    "vinserti64x4 $0x1, %%ymm5, %%zmm5 \n\t"      // 3                  
    "vpshufb   %%zmm2, %%zmm5 , %%zmm5 \n\t"      //============================== 
    "vmovdqu8 %%zmm5, %%zmm7 %{%%k2} %{z} \n\t"   // 9              12 (WORST CASE)
                                                  //                MIN access latency:
                                                  //                StoreForwarded : 1 cycle (not applicable in this case since we load perm mask from memory) thus best case is 4 cycles L1D access latency, worst case is cache miss. Instruction code size gets reduced, but extra permute mask dump in constant table will offset any code size improvement, moving perm_table to constant table before native method code will mostly guarantee L1I access latency. 
    "vporq %%zmm7, %%zmm6, %%zmm6 \n\t"           //                

    // Compute MASK for INDEX >= 48 && INDEX < 63 
    // Broadcast fourth 128 bit lane across entire vector and
    // move lanes corresponding to true mask to destination 
    //  vector register.
    "vpcmpb $5 , %%zmm4, %%zmm2, %%k1 \n\t"
    "vpsllq $2 , %%zmm3, %%zmm4 \n\t"
    "vpcmpb $1 , %%zmm4, %%zmm2,  %%k2 \n\t"
    "kandq %%k1 , %%k2, %%k2 \n\t"
    "vpermq $0xEE, %%zmm1, %%zmm5 \n\t"
    "vextracti64x4 $0x1, %%zmm5, %%ymm5 \n\t"
    "vpshufb   %%zmm2, %%zmm5 , %%zmm5 \n\t"
    "vmovdqu8 %%zmm5, %%zmm7 %{%%k2} %{z} \n\t"
    "vporq %%zmm7, %%zmm6, %%zmm6 \n\t"
    
    "vmovdqu64 %%zmm6, %0 \n\t"
   : "=m"(*dst)
   : "m"(*src), "m"(*indexes)
   : "%k1", "%k2", "%k3", "%eax", "%zmm1", "%zmm2", "%zmm3", "%zmm4" , "%zmm5", "%zmm6", "%zmm7"
  );
}

int main() {
  char dst[64];
  char src[64];
  for(int i = 0; i < 64; i++) {
    src[i] = i;
  }
  char shuffle[64];
  for(int i = 0; i < 64; i++) {
    shuffle[i] = 0;
  }
  shuffle[5] = 12;
  shuffle[17] = 0;
  shuffle[31] = 45;
  
  rearrange_bytes(dst, src, shuffle);
  
  printf("src = ");
  for(int i = 0; i < 64; i++) {
    printf(" %d ",src[i]);
  } 
  printf("\n");
  printf("shuffle = ");
  for(int i = 0; i < 64; i++) {
    printf(" %d ", shuffle[i]);
  } 
  printf("\n");
  printf("dst = ");
  for(int i = 0; i < 64; i++) {
    printf(" %d ", dst[i]);
  } 
  printf("\n");
  return 0;
}
