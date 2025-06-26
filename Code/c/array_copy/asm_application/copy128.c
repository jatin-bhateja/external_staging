
#include "stdio.h"
#include "stdint.h"
#include "string.h"
#include "assert.h"
#include "stdlib.h"
#include "xmmintrin.h"

__attribute__((noinline))
void array_copy_128(uint8_t *dst , uint8_t * src, int src_length, int dst_length, int bytes) {
   if (dst_length < 0 || src_length < 0 || dst_length < src_length || bytes < 0)
     return;

   // Backward copy.
   assert (dst > src /* && dst < src + src_length */ );
   uint8_t * new_dst =  dst + dst_length;
   src =  src + dst_length;
   while(bytes > 16) {
     new_dst -= 16;
     src -= 16;
     asm volatile (
       "vmovdqu16 %1    , %%xmm0 \n\t" 
       "vmovdqu16 %%xmm0 , %0    \n\t" 
      : "=m"(*new_dst) : "m"(*src) : "%xmm0" ); 
     bytes -= 16;
   }
}

#define MEMSIZE 1024*1024*512
#define COPYLEN 8192*512
#define ITERS   1024*1024

int main(int argc, char * argv[]) {
  int * mem = (int*)_mm_malloc(MEMSIZE,64);
  for(int i = 0; i < MEMSIZE/sizeof(int); i++)
    mem[i] = i + 10; 
  
  int  * src = mem + 128;
  int  * dst = src + 512;

  for (int i = 0 ; i < ITERS ; i++)
    array_copy_128(((uint8_t*)dst) , ((uint8_t*)src), COPYLEN, COPYLEN, COPYLEN);  

#ifdef _DUMP
  for (int i = 0; i < COPYLEN; i++)
    printf("%d " , dst[i]);
  printf("\n");
#endif

  return dst[20];
}

