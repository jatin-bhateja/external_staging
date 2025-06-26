
#include "stdio.h"
#include "stdlib.h"
#define ITERS 1000000

//
//
// A) 
// LOAD_VECT
// LOOP:
//   EXTR 
//   OPER
//   INSTR
//   JMP LOOP
// STORE_VECT
//
//  VS
//
// B)
//  LOOP:
//     LOADI
//     OPER
//     STOREI
//  
// Compare INSTR(MORE in A) , CYCLES (also more in A), MEMORY OPS (more in B, CAP on 2LD + 1ST per cycles, can it be a bottleneck?).
// Cache hit behaviour should be same as entire line is loaded on first access.
//
// A will need explicit 128bit lane extraction beyond 4 elements, since vpextr/vpinsr operate over XMM.
// B can have high unrolling factor.
//
void compress_bits_A(int * res, int * arr, int * mask, int len) {
  for(int i = 0 ; i < len; i+=4) {
     asm volatile(
       "vpxor %%xmm2, %%xmm3, %%xmm3 \n\t"
       "vmovdqu64 %1 , %%xmm1 \n\t"
       "vmovdqu64 %2 , %%xmm2 \n\t"

       "vpextrd  $0 , %%xmm1 , %%eax \n\t"
       "vpextrd  $0 , %%xmm2 , %%ebx \n\t"
       "pext %%ebx , %%eax, %%eax \n\t"
       "vpinsrd $0, %%eax, %%xmm3, %%xmm3 \n\t"

       "vpextrd  $1 , %%xmm1 , %%eax \n\t"
       "vpextrd  $1 , %%xmm2 , %%ebx \n\t"
       "pext %%ebx , %%eax, %%eax \n\t"
       "vpinsrd $1, %%eax, %%xmm3, %%xmm3 \n\t"

       "vpextrd  $2 , %%xmm2 , %%eax \n\t"
       "vpextrd  $2 , %%xmm2 , %%ebx \n\t"
       "pext %%ebx , %%eax, %%eax \n\t"
       "vpinsrd $2, %%eax, %%xmm3, %%xmm3 \n\t"

       "vpextrd  $3 , %%xmm2 , %%eax \n\t"
       "vpextrd  $3 , %%xmm2 , %%ebx \n\t"
       "pext %%ebx , %%eax, %%eax \n\t"
       "vpinsrd $3, %%eax, %%xmm3, %%xmm3 \n\t"

       "vmovdqu64 %%xmm3, %0 \n\t" 
       : "=m"(res[i])
       : "m"(arr[i]), "m"(mask[i])
       : "%eax" , "%ebx", "%xmm1" , "%xmm2" , "%xmm3"
     );
  }
}

void compress_bits_B(int * res, int * arr, int * mask, int len) {
  for(int i = 0 ; i < len; i+=4) {
     asm volatile(
       "movq %1, %%rax \n\t"
       "movq %2, %%rcx \n\t"
       "movq %0, %%r8  \n\t"

       "movl (%%rax, %3, 4) , %%ebx \n\t"
       "pextl (%%rcx, %3, 4), %%ebx, %%ebx \n\t"
       "movl %%ebx , (%%r8, %3, 4) \n\t"

       "movl 0x4(%%rax, %3, 4) , %%ebx \n\t"
       "pextl 0x4(%%rcx, %3, 4), %%ebx, %%ebx \n\t"
       "movl %%ebx , 0x4(%%r8, %3, 4) \n\t"

       "movl 0x8(%%rax, %3, 4) , %%ebx \n\t"
       "pextl 0x8(%%rcx, %3, 4), %%ebx, %%ebx \n\t"
       "movl %%ebx , 0x8(%%r8, %3, 4) \n\t"

       "movl 0xc(%%rax, %3, 4) , %%ebx \n\t"
       "pextl 0xc(%%rcx, %3, 4), %%ebx, %%ebx \n\t"
       "movl %%ebx , 0xc(%%r8, %3, 4) \n\t"

       : "+r"(res)
       : "r"(arr), "r"(mask), "r"((long)i)
       : "%rax" , "%rbx", "%rcx" , "%rdx" , "%r8", "%r9"
     );
  }
}

//
// compress_bits_C
//
/*
   public static int compressBits(int a, int mask) {
        a = a & mask; // Clear irrelevant bits
        int maskCount = ~mask << 1; // Count 0's to right
        int iters = 5;
                  // Expected latency per OPER is ~20 cycles * 5 iter = 100 cycles vs 3-8 cycles using PEXT
                  _______
                 / 
                 |     for (int j = 0; j < iters; j++) {
                 |
                 |       // Parallel prefix
                 |       // maskPrefix identifies bits of the mask that have odd number of 0's to the right
                 |       int maskPrefix = maskCount  ^ (maskCount  << 1);
                 |       maskPrefix = maskPrefix ^ (maskPrefix << 2);
                 |       maskPrefix = maskPrefix ^ (maskPrefix << 4);
                 |       maskPrefix = maskPrefix ^ (maskPrefix << 8);
                 |       maskPrefix = maskPrefix ^ (maskPrefix << 16);
          PEXT___|       // Bits to move
                 |       int maskMove = maskPrefix & mask;
                 |       // Compress mask
                 |       mask = (mask ^ maskMove) | (maskMove >>> (1 << j));
                 |       // Bits of a to be moved
                 |       int t = a & maskMove;
                 |       // Compress a
                 |       a = (a ^ t) | (t >>> (1 << j));
                 |       // Adjust the countMask by identifying the bits that have 0 to the right
                 |       maskCount = maskCount & ~maskPrefix;
                 |     }
                 \______
        return a;
    }
    
    // a) ~102 cycles per OP, 1632 cycles for 16 OPs.
    // b) With vectorized code latency is approximately 102 cycles for 16 packed integers (512 bit vector) + vector load (3) and store(3), thus per lane OP latency is  ~6.75 cycles.
    // c) With scalar PEXT instruction 3 cycles per scalar OP + memory load(2) and store(2), thus ~7 cycles per op and for 16 elements = 48 + 64 = 112 cycles.
    // d) Scalar JIT sequence will have more code size compared to vector code.
*/

int main(int argc, char * argv[]) {
  if (argc != 3) {
    fprintf(stderr, "Incorrect args!\n");
    exit(-1);
  }
  int LEN = atoi(argv[1]);
  int ALGO = atoi(argv[2]);

  int arr [LEN]; 
  int mask[LEN]; 
  int res [LEN]; 

  for(int i = 0 ; i < LEN; i++) {
    arr[i] = 1 << (i&31);
    mask[i] = arr[i];
  }

  if (ALGO == 1) {  
    for (int i = 0; i < ITERS; i++) {
      compress_bits_A(res, arr, mask, LEN);
    }
  } else {
    for (int i = 0; i < ITERS; i++) {
      compress_bits_B(res, arr, mask, LEN);
    }
  }

  int ret = 0;
  for(int i = 0 ; i < LEN ;i++) {
    ret += res[i];
  }

  printf("[RES] : %d\n", ret);
  for(int i = 0 ; i < 8 ;i++) {
    printf("res[%d] : %d\n",i, res[i]);
  }
  return 0; 
}
