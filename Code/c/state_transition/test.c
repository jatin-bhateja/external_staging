
#include "stdio.h"
#include "stdint.h"
#include "string.h"
#include "assert.h"
#include "stdlib.h"
#include "xmmintrin.h"


///////////////// BM Params //////////////////
#define VEC_SIZE  64                        // 512 bits
#define VEC_LANES (VEC_SIZE / sizeof(uint8_t)) // 64
#define MEM_SIZE 1024*32                    // 512B
#define TRIP_COUNT (MEM_SIZE/sizeof(uint8_t))  // 32768
#define ITERS 1024*1024*8                  // 8M
//////////////////////////////////////////////

__attribute__((noinline))
uint64_t mixed_mode_routine(uint8_t *dst , uint8_t * src1, uint8_t* src2, int index) {
     asm volatile (
       "movl $111, %%ebx         \n\t"
       ".byte 0x64, 0x67, 0x90   \n\t"
       "vmovdqu %1, %%ymm1 \n\t" 
       "vmovdqu %2, %%ymm2 \n\t" 
       //"vpaddd  %%zmm1, %%zmm2, %%zmm2 \n\t" 
       "vzeroupper           \n\t"
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "paddd  %%xmm1, %%xmm2 \n\t" 
       "vmovdqu64 %%ymm2, %0 \n\t" 
       "movl $222, %%ebx         \n\t"
       ".byte 0x64, 0x67, 0x90   \n\t"
      : "=m"(*dst) 
      : "m"(*src1), "m"(*src2) 
      : "%ymm1" , "%ymm2", "%ebx"); 
   return dst[index];
}

void init_mem(uint8_t * mem, uint8_t val) {
  for(int i = 0 ; i < TRIP_COUNT; i++)
    mem[i] = val;
}


int main(int argc, char * argv[]) {
  uint8_t * src1 = (uint8_t*)_mm_malloc(MEM_SIZE,64);
  uint8_t * src2 = (uint8_t*)_mm_malloc(MEM_SIZE,64);
  uint8_t * dst = (uint8_t*)_mm_malloc(MEM_SIZE,64);
  uint8_t * end_dst = dst + MEM_SIZE;

  if (argc != 2) {
    fprintf(stderr," ./app <PADDING for 64 byte aligned memory>\n");
    return -1;
  }

  dst += atoi(argv[1]); 
  src1 += atoi(argv[1]); 
  src2 += atoi(argv[1]); 
  uint8_t * start_dst = dst;
  uint8_t * start_src1 = src1;
  uint8_t * start_src2 = src2;

  init_mem(src1, 1);
  init_mem(src2, 1);
  init_mem(dst, 0);

  uint64_t res = 0;
  long iter_ctr = 0;
  for (int i = 0 ; i < ITERS ; i++) {
    dst = start_dst;
    src1 = start_src1;
    src2 = start_src2;
    while( dst < end_dst) { 
      res += mixed_mode_routine(dst , src1, src2, i & 15);  
      dst += VEC_SIZE;
      src1 += VEC_SIZE;
      src2 += VEC_SIZE;
    }
    iter_ctr++;
  }

  return printf("[iters : %ld] Res = %ld\n", iter_ctr, res);
}

