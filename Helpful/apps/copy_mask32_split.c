
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
uint8_t array_copy_512( uint8_t *dst , uint8_t * src, uint64_t mask1, uint64_t mask2) {
     int ret; 
     asm volatile (
       "movq     %2 , %%rdx                   \n\t"
       "movq     %0 , %%rsi                   \n\t"
       "kmovq    %3 , %%k2                    \n\t"
       "kmovq    %4 , %%k3                    \n\t"
       "vmovdqu8 (%%rdx) , %%ymm0 {{%%k2}}   \n\t" 
       "vmovdqu8 %%ymm0 , (%%rsi) {{%%k2}}   \n\t" 
       //"vmovdqu8 (%%rdx) , %%ymm0    \n\t" 
       //"vmovdqu8 %%ymm0 , (%%rsi)    \n\t" 
       "vmovdqu8 32(%%rdx) , %%ymm0 {{%%k3}}   \n\t" 
       "vmovdqu8 %%ymm0 , 32(%%rsi) {{%%k3}}   \n\t" 
       "lea      0(%%rsi),  %%rcx             \n\t"
       "movl     (%%rcx) ,  %1                 \n\t"
       "vpxord   %%ymm0, %%ymm0 , %%ymm0       \n\t"
      : "=m"(dst) , "=r"(ret) 
      : "m"(src) , "r"(mask1) , "r"(mask2)
      : "%ymm0" , "%k2" ,"%rsi", "%rdx", "%rcx" ); 
   return  ret;
}

uint8_t array_copy_512_unmasked( uint8_t *dst , uint8_t * src) {
     int ret; 
     asm volatile (
       "movq     %2 , %%rdx             \n\t"
       "movq     %0 , %%rsi             \n\t"
       "vmovdqu8 (%%rdx) , %%ymm0   \n\t" 
       "vmovdqu8 %%ymm0 , (%%rsi)   \n\t" 
       "vmovdqu8 32(%%rdx) , %%ymm0 \n\t" 
       "vmovdqu8 %%ymm0 , 32(%%rsi) \n\t" 
       "lea      32(%%rsi),  %%rcx        \n\t"
       "movl     (%%rcx) ,  %1            \n\t"
       "vpxord   %%ymm0, %%ymm0 , %%ymm0  \n\t"
      : "=m"(dst) , "=r"(ret) 
      : "m"(src) 
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
  uint64_t len = atol(argv[2]); 

  uint64_t len1 = len > 32 ? 32 : len;
  uint64_t len2 = len - len1;
  uint64_t mask1 = (1UL << len1) - 1;
  uint64_t mask2 = (1UL << len2) - 1;

  assert(len <= 64);
  fprintf(stdout, "len = %d , mask1 = %x , mask2 = %x\n",len, mask1, mask2);

  init_mem(src, 1);
  init_mem(dst, 0);

  uint64_t res = 0;
  uint64_t iter_ctr = 0;
  if (atoi(argv[3]) == 1) {
    char * src_start = src;
    char * dst_start = dst;
    for (int i = 0 ; i < ITERS ; i++) {
      dst = dst_start;
      src = src_start;
      while (dst < end_dst) { 
        res += array_copy_512(((uint8_t*)dst) , ((uint8_t*)src), mask1, mask2);  
        iter_ctr++;
        dst += 64;
        src += 64;
      }
    }
  } else {
    char * src_start = src;
    char * dst_start = dst;
    assert(len == 64);
    for (int i = 0 ; i < ITERS ; i++) {
      dst = dst_start;
      src = src_start;
      while (dst < end_dst) { 
        res += array_copy_512_unmasked(((uint8_t*)dst) , ((uint8_t*)src));  
        iter_ctr++;
        dst += 64;
        src += 64;
      }
    }
  }

  return printf("[iters : %ld] Res = %ld\n", iter_ctr, res);
}

