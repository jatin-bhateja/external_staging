
#include "stdio.h"
#include "stdint.h"
#include "string.h"
#include "assert.h"
#include "stdlib.h"
#include "xmmintrin.h"

__attribute__((noinline))
void array_copy_universal( uint8_t *dst , uint8_t * src, int src_length, int dst_length, int bytes) {
   if (dst_length < 0 || src_length < 0 || dst_length < src_length || bytes < 0)
     return;

   // No Overlap OR Front overlap 
   if ( src > dst /* &&  src < dst + dst_length*/)  {
       // Forward copy.
#ifdef _USE_AVX512
       while(bytes > 64) {
         asm volatile (
            "vmovdqu64 %1    , %%zmm0 \n\t" 
            "vmovdqu64 %%zmm0 , %0    \n\t" 
           : "=m"(*dst) : "m"(*src) : "%zmm0" ); 
         dst += 64;
         src += 64;
         bytes -= 64;
       }
#endif
       while(bytes > 32) {
         asm volatile (
            "vmovdqu32 %1    , %%ymm0 \n\t" 
            "vmovdqu32 %%ymm0 , %0    \n\t" 
           : "=m"(*dst) : "m"(*src) : "%ymm0" ); 
         dst += 32;
         src += 32;
         bytes -= 32;
       }
       while(bytes > 16) {
         asm volatile (
            "vmovdqu %1    , %%xmm0 \n\t" 
            "vmovdqu %%xmm0 , %0    \n\t" 
           : "=m"(*dst) : "m"(*src) : "%xmm0" ); 
         dst += 16;
         src += 16;
         bytes -= 16;
       }
       while(bytes > 8) {
         *((uint64_t *)dst) = *((uint64_t*)src);
         dst += 8;
         src += 8;
         bytes -= 8;
       }
       while(bytes > 4) {
         *((uint32_t *)dst) = *((uint32_t*)src);
         dst+=4;
         src+=4;
         bytes -= 4;
       }
       while(bytes) {
         *((uint8_t *)dst++) = *((uint8_t*)src++);
         bytes--;
       }
   } else {
     // Backward copy.
     assert (dst > src /* && dst < src + src_length */ );
     uint8_t * new_dst =  dst + dst_length;
     src =  src + dst_length;
#ifdef _USE_AVX512
     while(bytes > 64) {
       new_dst -= 64;
       src -= 64;
       asm volatile (
         "vmovdqu64 %1    , %%zmm0 \n\t" 
         "vmovdqu64 %%zmm0 , %0    \n\t" 
        : "=m"(*new_dst) : "m"(*src) : "%zmm0" ); 
       bytes -= 64;
     }
#endif
     while(bytes > 32) {
       new_dst -= 32;
       src -= 32;
       asm volatile (
         "vmovdqu32 %1    , %%ymm0 \n\t" 
         "vmovdqu32 %%ymm0 , %0    \n\t" 
        : "=m"(*new_dst) : "m"(*src) : "%ymm0" ); 
       bytes -= 32;
     }
     while(bytes > 16) {
       new_dst -= 16;
       src -= 16;
       asm volatile (
         "vmovdqu %1    , %%xmm0 \n\t" 
         "vmovdqu %%xmm0 , %0    \n\t" 
        : "=m"(*new_dst) : "m"(*src) : "%xmm0" ); 
       bytes -= 16;
     }
     while(bytes > 8) {
       new_dst -= 8;
       src -= 8;
       *((uint64_t *)new_dst) = *((uint64_t *)src);
       bytes -= 8;
     }
     while(bytes > 4) {
       new_dst -= 4;
       src -= 4;
       *((uint32_t *)new_dst) = *((uint32_t *)src);
       bytes -= 4;
     }
     while(bytes) {
       *((uint8_t *)--new_dst) = *((uint8_t *)--src);
       bytes--;
     }
     
     if (dst_length > src_length) {
        memcpy(dst, new_dst, dst_length);
     }
   }
}

#define MEMSIZE 1024*1024*512
#define COPYLEN 8192*512
#define ITERS   1024*1024

int main(int argc, char * argv[]) {
  int * mem = (int*)_mm_malloc(MEMSIZE,64);;
  for(int i = 0; i < MEMSIZE/sizeof(int); i++)
    mem[i] = i + 10; 
  
  int  * src = mem + 128;
  int  * dst = src + 512;

  for (int i = 0 ; i < ITERS ; i++)
     array_copy_universal(((uint8_t*)dst) , ((uint8_t*)src), COPYLEN, COPYLEN, COPYLEN);  

#ifdef _DUMP
  for (int i = 0; i < COPYLEN; i++)
    printf("%d " , dst[i]);
  printf("\n");
#endif

  return dst[20];
}

