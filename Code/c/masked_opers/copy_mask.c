
#include "stdio.h"
#include "stdint.h"
#include "string.h"
#include "assert.h"
#include "stdlib.h"
#include "xmmintrin.h"


///////////////// BM Params //////////////////
#define type char                           //
#define VEC_SIZE  32                        // 512 bits
#define VEC_LANES (VEC_SIZE / sizeof(type)) // 64
#define MEM_SIZE 1024*32                    // 512B
#define TRIP_COUNT (MEM_SIZE/sizeof(type))  //
#define ITERS 1024*1024*8                  // 8M
//////////////////////////////////////////////


__attribute__((noinline))
long array_copy_512( uint8_t *dst , uint8_t * src, long mask) {
     long res = 0;
     asm volatile (
       "movq     %2 , %%rdx                 \n\t"
       "movq     %0 , %%rsi                 \n\t"
       "kmovq    %3 , %%k2                  \n\t"
       "kmovq    0x0(%3), %%k2                  \n\t"
       "kmovq    0x1234(%3), %%k2                  \n\t"
       "kmovq    0x14(%3), %%k2                  \n\t"
       "vmovdqu8 (%%rdx) , %%ymm0 {{%%k2}} \n\t" 
       "vmovdqu8 %%ymm0 , (%%rsi) {{%%k2}} \n\t" 
       "movq   (%%rsi) , %1                 \n\t"
      : "=m"(dst) , "=r"(res) 
      : "m"(src) , "r"(mask) 
      : "%ymm0" , "%k2" ,"%rsi", "%rdx" ); 
   return res;
}

__attribute__((noinline))
long array_copy_512_unmasked( uint8_t *dst , uint8_t * src, long mask) {
     long res = 0;
     asm volatile (
       "movq     %2 , %%rdx             \n\t"
       "movq     %0 , %%rsi             \n\t"
       "kmovq    %3   , %%k2            \n\t"
       "vmovdqu8 (%%rdx) , %%ymm0 \n\t" 
       "vmovdqu8 %%ymm0 , (%%rsi) \n\t" 
       "movq   (%%rsi) , %1                 \n\t"
      : "=m"(dst) , "=r"(res)
      : "m"(src) , "r"(mask)
      : "%ymm0" , "%k2" ,"%rsi", "%rdx" ); 
   return res;
}


//__attribute__((noinline))
//long array_copy_512_unmasked( uint8_t *dst , uint8_t * src, long mask) {
//  return array_copy_512_unmasked_leaf(dst,src,mask);
//}

void init_mem(char * mem, char val) {
  for(int i = 0 ; i < TRIP_COUNT; i++)
    mem[i] += (val + i);
}


int main(int argc, char * argv[]) {
  char * src = (char*)_mm_malloc(MEM_SIZE,64);
  char * dst = (char*)_mm_malloc(MEM_SIZE,64);

  if (argc != 4) {
    fprintf(stderr," ./app <PADDING for 64 byte aligned memory> <mask> <1/0>\n");
    return -1;
  }

  src += atoi(argv[1]); 
  dst += atoi(argv[1]); 
  long mask = atol(argv[2]); 

  assert(atoi(argv[1]) < 64);

  init_mem(src, 1);
  init_mem(dst, 0);

  long res = 0;
  long iter_ctr = 0;
  char * src_orig = src; 
  char * dst_orig = src; 
  if (atoi(argv[3]) == 1) {
    for (int i = 0 ; i < ITERS ; i++) {
      src  = src_orig; 
      dst  = dst_orig; 
      for(int j = 0 ; j < MEM_SIZE ; j+= VEC_SIZE) {
         res += array_copy_512(((uint8_t*)dst) , ((uint8_t*)src), mask);  
         src += VEC_SIZE;
         dst += VEC_SIZE;
      }
      iter_ctr++;
    }
  } else {
    for (int i = 0 ; i < ITERS ; i++) {
      src  = src_orig; 
      dst  = dst_orig; 
      for(int j = 0 ; j < MEM_SIZE ; j+= VEC_SIZE) {
         res += array_copy_512_unmasked(((uint8_t*)dst) , ((uint8_t*)src), mask);  
         src += VEC_SIZE;
         dst += VEC_SIZE;
      }

      iter_ctr++;
    }
  }

  return printf("[iters : %ld] Res = %ld\n", iter_ctr, res);
}

