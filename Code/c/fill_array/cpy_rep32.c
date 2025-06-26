
#include "stdio.h"
#include "stdint.h"
#include "string.h"
#include "assert.h"
#include "stdlib.h"
#include "xmmintrin.h"


///////////////// BM Params //////////////////
#define type char                           //
#define VEC_SIZE  64                        // 512 bits
#define VEC_LANES (VEC_SIZE / sizeof(type)) // 64
#define MEM_SIZE 1024*32                    // 32kb
#define TRIP_COUNT (MEM_SIZE/sizeof(type))  //
#define ITERS 32*1024*1024                  // 
//////////////////////////////////////////////


__attribute__((noinline))
uint8_t array_copy_512_unmasked( uint8_t *dst, uint8_t * src, long len, int ptype) {
     int ret;
     asm volatile (
       "movq     %2 , %%rsi             \n\t"
       "movq     %0 , %%rdi             \n\t"
       "copy_loop:                      \n\t"
       "vmovdqu64 (%%rsi) , %%zmm0      \n\t"
       "vmovdqu64 64(%%rsi) , %%zmm1    \n\t"
       "vmovdqu64 128(%%rsi) , %%zmm2   \n\t"
       "vmovdqu64 192(%%rsi) , %%zmm3   \n\t"
       "vmovdqu64 %%zmm0 , (%%rdi)      \n\t"
       "vmovdqu64 %%zmm1 , 64(%%rdi)    \n\t"
       "vmovdqu64 %%zmm2 , 128(%%rdi)   \n\t"
       "vmovdqu64 %%zmm3 , 192(%%rdi)   \n\t"
       "subq  $256 , %3                 \n\t"
       "addq  $256 , %%rdi              \n\t"
       "addq  $256 , %%rsi              \n\t"
       "cmpq  $0   , %3                 \n\t"
       "jg    copy_loop                 \n\t"
       "lea      -8(%%rdi),  %%rcx      \n\t"
       "movl     (%%rcx) ,  %1          \n\t"
      : "=m"(dst) , "=r"(ret)
      : "m"(src) , "r"(len)
      : "%zmm0" , "%zmm1", "%zmm2" , "%zmm3",  "%rsi", "%rdi", "%rcx" );
   return ret;
}


__attribute__((noinline))
uint8_t array_copy_256_unmasked( uint8_t *dst, uint8_t * src, long len, int ptype) {
     int ret;
     asm volatile (
       "movq     %2 , %%rsi             \n\t"
       "movq     %0 , %%rdi             \n\t"
       "copy_loop1:                      \n\t"
       "vmovdqu32 (%%rsi) , %%ymm0       \n\t"
       "vmovdqu32 32(%%rsi) , %%ymm1     \n\t"
       "vmovdqu32 64(%%rsi) , %%ymm2     \n\t"
       "vmovdqu32 92(%%rsi) , %%ymm3     \n\t"
       "vmovdqu32 %%ymm0 , (%%rdi)       \n\t"
       "vmovdqu32 %%ymm1 , 32(%%rdi)     \n\t"
       "vmovdqu32 %%ymm2 , 64(%%rdi)     \n\t"
       "vmovdqu32 %%ymm3 , 92(%%rdi)     \n\t"
       "subq  $128 , %3                  \n\t"
       "addq  $128 , %%rdi               \n\t"
       "addq  $128 , %%rsi               \n\t"
       "cmpq  $0  , %3                  \n\t"
       "jg    copy_loop1                 \n\t"
       "lea      -8(%%rdi),  %%rcx      \n\t"
       "movl     (%%rcx) ,  %1          \n\t"
      : "=m"(dst) , "=r"(ret)
      : "m"(src) , "r"(len)
      : "%zmm0" , "%rsi", "%rdi", "%rcx" );
   return ret;
}


__attribute__((noinline))
uint8_t array_clear_rep( uint8_t *dst, uint8_t * src, long len, int ptype) {
   int ret; 
   if (ptype == 1) {
   asm volatile (
     "mov    %0 , %%rdi          \n\t"
     "mov    %3 , %%rsi          \n\t"
     "shrq   $3 , %2             \n\t"
     "mov    %2 , %%rcx          \n\t"
     "rep movsq                  \n\t"
     "mov   -8(%%rdi) , %1       \n\t"
    : "=m"(dst) , "=r"(ret) 
    : "r" (len) , "m"(src)
    : "%rdi", "%rcx", "%rsi");
   } else if (ptype == 2) {


   } else if (ptype == 3) { 

 
   } else if (ptype == 4) { 

   } else {
     assert(0);
   }
   return ret;
 }

void init_mem(uint8_t * mem, char val) {
  for(int i = 0 ; i < TRIP_COUNT; i++)
    mem[i] = val;
}


int main(int argc, char * argv[]) {
  if (argc != 4) {
    fprintf(stderr," ./app <PADDING for 64 byte aligned clear>  <SZ_multiplier> <2/1/0>\n");
    return -1;
  }
  uint8_t* src = (uint8_t*)_mm_malloc(MEM_SIZE, 64);
  uint8_t* dst = (uint8_t*)_mm_malloc(MEM_SIZE, 64);
  uint64_t offset = atol(argv[1]);
  dst += offset;
  src += offset; 
  float sz_mult = atof(argv[2]);
  uint64_t mem_blk_size = (uint64_t)((sz_mult*((MEM_SIZE)-offset)));
  fprintf(stdout,"sz_mult = %f \ninit_offset = %d\n", sz_mult, offset);
  fprintf(stdout,"mem_size = %ld bytes\n", mem_blk_size);

  init_mem(src, 8);

  uint64_t res = 0;
  uint64_t iter_ctr = 0;
  if (atoi(argv[3]) == 2) {
    uint8_t * dst_start = dst;
    for (int i = 0 ; i < ITERS ; i++) {
      dst = dst_start;
      res += array_copy_512_unmasked(dst , src, mem_blk_size, 1);  
      //res += array_clear_vec(dst , val, 1024, 1);  
      iter_ctr++;
    }
  } else if (atoi(argv[3]) == 1) {
    uint8_t * dst_start = dst;
    for (int i = 0 ; i < ITERS ; i++) {
      dst = dst_start;
      res += array_copy_256_unmasked(dst , src, mem_blk_size, 1);  
      //res += array_clear_vec(dst , val, 1024, 1);  
      iter_ctr++;
    }
  } else {
    uint8_t* dst_start = dst;
    for (int i = 0 ; i < ITERS ; i++) {
      dst = dst_start;
      res += array_clear_rep(dst , src, mem_blk_size, 1);  
      //res += array_clear_rep(dst , val, 1024, 1);  
      iter_ctr++;
    }
  }

  return printf("[iters : %ld] Res = %ld\n", iter_ctr, res);
}

