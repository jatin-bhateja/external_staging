
#include "stdio.h"
#include "stdint.h"
#include "string.h"
#include "assert.h"
#include "stdlib.h"
#include "xmmintrin.h"

///////////////// BM Params //////////////////
#define VEC_SIZE  64                        // 512 bits
#define VEC_LANES (VEC_SIZE / sizeof(char)) // 64
#define MEM_SIZE 1024*32                    // 512B
#define TRIP_COUNT (MEM_SIZE/sizeof(char))  // 32768
#define ITERS 1024*1024*8                   // 8M
//////////////////////////////////////////////////


__attribute__((noinline))
int array_copy_256(uint8_t *dst , uint8_t * src, int src_length, int dst_length, int bytes) {
   if (dst_length < 0 || src_length < 0 || dst_length < src_length || bytes < 0)
     return -1;

   while(bytes > 32) {
     asm volatile (
       "vmovdqu8 %1    , %%ymm0 \n\t" 
       "vmovdqu8 %%ymm0 , %0    \n\t" 
      : "=m"(*dst) : "m"(*src) : "%ymm0" ); 
     bytes -= 32;
     dst += 32;
     src += 32;
   }
   return dst[-31];
}

void init_mem(char * mem, char val) {
  for(int i = 0 ; i < TRIP_COUNT; i++)
    mem[i] = val;
}


int main(int argc, char * argv[]) {
  char * src = (char*)_mm_malloc(MEM_SIZE,64);
  char * dst = (char*)_mm_malloc(MEM_SIZE,64);

  init_mem(src, 1);
  init_mem(dst, 0);

  
  int res = 0;
  long iter_ctr = 0;
  for (int i = 0 ; i < ITERS ; i++) {
    res += array_copy_256(((uint8_t*)dst) , ((uint8_t*)src), MEM_SIZE, MEM_SIZE, MEM_SIZE);  
    iter_ctr++;
  }

  return printf("[iters : %ld] Res = %d\n", iter_ctr, res);
}

