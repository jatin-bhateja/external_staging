
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
#define ITERS 1024*1024                     // 8M
//////////////////////////////////////////////


__attribute__((noinline))
int array_copy_512( uint8_t *dst , uint8_t * src, long mask) {
     int ret; 
     asm volatile (
       "movq     %2 , %%rdx                   \n\t"
       "movq     %0 , %%rsi                   \n\t"
       "kmovq    %3 , %%k2                    \n\t"
       "vmovdqu8 (%%rdx) , %%zmm0 {{%%k2}}   \n\t" 
       "vmovdqu8 %%zmm0 , (%%rsi) {{%%k2}}   \n\t" 
       "lea      0(%%rsi),  %%rcx             \n\t"
       "movl     (%%rcx) ,  %1                \n\t"
      : "=m"(dst) , "=r"(ret) 
      : "m"(src) , "r"(mask)
      : "%ymm0" , "%k2" ,"%rsi", "%rdx", "%rcx" ); 
   return  ret;
}

__attribute__((noinline))
int array_copy_512_unmasked( uint8_t *dst , uint8_t * src, long mask) {
     int ret; 
     asm volatile (
       "movq     %2 , %%rdx             \n\t"
       "movq     %0 , %%rsi             \n\t"
       "kmovq    %3   , %%k2            \n\t"
       "vmovdqu8 (%%rdx) , %%zmm0 \n\t" 
       "vmovdqu8 %%zmm0 , (%%rsi) \n\t" 
       "lea      0(%%rsi),  %%rcx             \n\t"
       "movl     (%%rcx) ,  %1                \n\t"
      : "=m"(dst) , "=r"(ret) 
      : "m"(src) , "r"(mask)
      : "%ymm0" , "%k2" ,"%rsi", "%rdx", "%rcx" ); 
   return ret;
}

void init_mem(char * mem, char val) {
  for(int i = 0 ; i < TRIP_COUNT; i++)
    mem[i] = val;
}


int main(int argc, char * argv[]) {
  char * src = (char*)_mm_malloc(MEM_SIZE,64);
  char * dst = (char*)_mm_malloc(MEM_SIZE,64);
  char * end_dst = dst  + MEM_SIZE; 

  if (argc != 4) {
    fprintf(stderr," ./app <PADDING for 64 byte aligned memory> <copy_len> <1/0>\n");
    return -1;
  }

  dst += atoi(argv[1]); 
  src += atoi(argv[1]); 
  long mask = (-1 >> (64-atol(argv[2]))); 

  assert(atoi(argv[1]) < 64);

  init_mem(src, 1);
  init_mem(dst, 0);

  int res = 0;
  long iter_ctr = 0;
  if (atoi(argv[3]) == 1) {
    char * src_start = src;
    char * dst_start = dst;
    for (int i = 0 ; i < ITERS ; i++) {
      dst = dst_start;
      src = src_start;
      while (dst < end_dst) { 
        res += array_copy_512(((uint8_t*)dst) , ((uint8_t*)src), mask);  
        iter_ctr++;
        dst += 64;
        src += 64;
      }
    }
  } else {
    char * src_start = src;
    char * dst_start = dst;
    for (int i = 0 ; i < ITERS ; i++) {
      dst = dst_start;
      src = src_start;
      while (dst < end_dst) { 
        res += array_copy_512_unmasked(((uint8_t*)dst) , ((uint8_t*)src), mask);  
        iter_ctr++;
        dst += 64;
        src += 64;
      }
    }
  }

  return printf("[iters : %ld] Res = %d\n", iter_ctr, res);
}

