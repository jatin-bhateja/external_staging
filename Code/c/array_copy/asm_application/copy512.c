
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
//////////////////////////////////////////////


__attribute__((noinline))
int array_copy_512( uint8_t *dst , uint8_t * src, int src_length, int dst_length, int bytes, long mask) {
   if (dst_length < 0 || src_length < 0 || dst_length < src_length || bytes < 0)
     return -1;
   while(bytes > 64) {
     asm volatile (
       "kmovq    %2   , %%k2            \n\t"
       "vmovdqu8 %1   , %%zmm0 {{%%k2}} \n\t" 
       "vmovdqu8 %%zmm0 , %0 {{%%k2}}   \n\t" 
      : "=m"(*dst) : "m"(*src) , "r"(mask): "%zmm0" , "%k2" ); 
     bytes -= 64;
     dst += 64;
     src += 64;
   }
   return dst[-63];
}

void init_mem(char * mem, char val) {
  for(int i = 0 ; i < TRIP_COUNT; i++)
    mem[i] = val;
}


int main(int argc, char * argv[]) {
  char * src = (char*)_mm_malloc(MEM_SIZE,64);
  char * dst = (char*)_mm_malloc(MEM_SIZE,64);

  if (argc != 3) {
    fprintf(stderr," ./app <PADDING for 64 byte aligned memory> <mask>\n");
    return -1;
  }

  dst += atoi(argv[1]); 
  long mask = atol(argv[2]); 

  init_mem(src, 1);
  init_mem(dst, 0);

  int res = 0;
  long iter_ctr = 0;
  for (int i = 0 ; i < ITERS ; i++) {
    res += array_copy_512(((uint8_t*)dst) , ((uint8_t*)src), MEM_SIZE, MEM_SIZE, MEM_SIZE, mask);  
    iter_ctr++;
  }

  return printf("[iters : %ld] Res = %d\n", iter_ctr, res);
}

