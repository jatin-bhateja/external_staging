
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
#define ITERS 8*1024*1024                  // 
//////////////////////////////////////////////


// 32 byte vectors and its masked variants. 
// Main aligned to 32 byte boundry, loop does 64 byte copies.

__attribute__((noinline))
uint8_t array_clear_vec(uint8_t* dst, long len, int ptype, uint8_t * init_mem_64) {
     int ret; 
     if ( ptype == 1) {
        asm volatile (
          " vmovdqu32   %3 , %%ymm0         \n\t"
          " start_block:                    \n\t"
          " cmpq        $0 , %2             \n\t"
          " jle         exit                \n\t"       
          "block_32:                        \n\t"
          " cmpq         $32 , %2           \n\t"
          " jg           block_64           \n\t"
          " jl           tail32             \n\t"
          " vmovdqu32    %%ymm0 , (%%rdi)   \n\t"
          " jmp          exit               \n\t"
          " tail32:                         \n\t"
          " mov          $1  , %%rax        \n\t"
          " shlx         %2  , %%rax, %%rax \n\t"
          " decq         %%rax              \n\t"
          " kmovq        %%rax , %%k1       \n\t"
          " vmovdqu8     %%ymm0 , (%%rdi) {{%%k1}}  \n\t"
          " jmp          exit               \n\t"
          "block_64:                        \n\t"
          " cmpq         $64  , %2          \n\t"
          " jg           clear_loop       \n\t"
          " vmovdqu      %%ymm0 , (%%rdi)   \n\t"
          " subq         $32 , %2           \n\t"
          " addq         $32 , %%rdi        \n\t"
          " mov          $1 , %%rax         \n\t"
          " shlx         %2  , %%rax, %%rax \n\t"
          " decq         %%rax              \n\t"
          " kmovq        %%rax , %%k1       \n\t"
          " vmovdqu8     %%ymm0 , (%%rdi) {{%%k1}}  \n\t"
          " jmp          exit               \n\t"
          "clear_loop:                    \n\t"
          " mov          %0  , %%rdi        \n\t"
          " cmpq         $32 , %2          \n\t"
          " jle          tail               \n\t"
          " mainloop:                       \n\t"
          "  vmovdqu32 %%ymm0 , (%%rdi)     \n\t"
          "  vmovdqu32 %%ymm0 , 32(%%rdi)   \n\t"
          "  addq     $64 , %%rdi          \n\t"
          "  subq     $64 , %2             \n\t"
          "  cmpq     $64 , %2             \n\t"
          "  jg       mainloop              \n\t"       
          " tail:                           \n\t"
          "  jmp      start_block           \n\t"
          "exit:                            \n\t"
          "mov    -8(%%rdi) , %1            \n\t"
         : "=m"(dst) , "=r"(ret)
         : "r"(len), "m"(*init_mem_64)
         : "%ymm0" , "%k1" ,"%rdi", "%rax" );
    } else if (ptype == 2) {

    } else if (ptype == 3) {
   
    } else if (ptype == 4) {

    } else {
      assert(0);
    }
   return  ret;
}

__attribute__((noinline))
uint8_t array_clear_array( uint8_t *dst, long val, long len, int ptype) {
   int ret; 
   if (ptype == 1) {
   asm volatile (
     "mov    %2    , %%rax        \n\t"
     "mov    %0    , %%rdi        \n\t"  
     "cmp    $32   , %3           \n\t"
     "jle    tail_16byte          \n\t"   
     "loop32:                     \n\t"
     "mov    %%rax , 0(%%rdi)     \n\t"
     "mov    %%rax , 8(%%rdi)     \n\t"
     "mov    %%rax , 16(%%rdi)    \n\t"
     "mov    %%rax , 24(%%rdi)    \n\t"
     "subq   $32   , %3           \n\t"
     "addq   $32   , %%rdi        \n\t"
     "cmpq   $32   , %3           \n\t"
     "jge    loop32               \n\t"
     "tail_16byte:                \n\t"
     "cmp    $16   , %3           \n\t"
     "jl     tail_8byte           \n\t"
     "mov   %%rax , (%%rdi)       \n\t"
     "mov   %%rax , 8(%%rdi)      \n\t"
     "subq   $16  , %3            \n\t"
     "addq   $16  , %%rdi         \n\t"
     "tail_8byte:                 \n\t"
     "cmp    $8   , %3            \n\t"
     "jl     tail_4byte           \n\t"
     "mov   %%rax , (%%rdi)       \n\t"
     "subq   $8  , %3             \n\t"
     "addq   $8  , %%rdi          \n\t"
     "tail_4byte:                 \n\t"
     "cmp    $4   , %3            \n\t"
     "jl     tail_1byte           \n\t"
     "mov   %%eax , (%%rdi)       \n\t"
     "subq   $4  , %3             \n\t"
     "addq   $4  , %%rdi          \n\t"
     "tail_1byte:                 \n\t"
     "cmp    $0  , %3             \n\t"
     "je     exit1                \n\t"
     "mov    %%al  , (%%rdi)      \n\t"
     "subq   $1  , %3             \n\t"
     "addq   $1  , %%rdi          \n\t"
     "jmp    tail_1byte           \n\t"
     "exit1:                       \n\t"
     "mov   -8(%%rdi) , %1        \n\t"
    : "=m"(dst) , "=r"(ret) 
    : "r"(val) , "r" (len)
    : "%rdi", "%rax");
   } else if (ptype == 2) {


   } else if (ptype == 3) { 

 
   } else if (ptype == 4) { 

   } else {
     assert(0);
   }
   return ret;
 }


__attribute__((noinline))
uint8_t array_clear_rep( uint8_t *dst, long val, long len, int ptype) {
   int ret;
   if (ptype == 1) {
   asm volatile (
     "mov    %0 , %%rdi            \n\t"
     "mov    %3 , %%rcx            \n\t"
     "rep stosb                    \n\t"
     "mov   -8(%%rdi) , %1         \n\t"
    : "=m"(dst) , "=r"(ret)
    : "a"(val) , "r" (len)
    : "%rdi", "%rcx");
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
    fprintf(stderr," ./app <PADDING for 64 byte aligned clear> <blk_size_mult> <1/0>\n");
    return -1;
  }
  uint8_t* dst = (uint8_t*)_mm_malloc(MEM_SIZE, 64);
  uint64_t offset = atol(argv[1]);
  dst += offset; 
  float sz_mult = atof(argv[2]);
  uint64_t mem_blk_size = (uint64_t)((sz_mult*((MEM_SIZE)-offset)));
  fprintf(stdout,"sz_mult = %f \ninit_offset = %d\n", sz_mult, offset);
  fprintf(stdout,"mem_size = %ld bytes\n", mem_blk_size);

  init_mem(dst, 0);

  long val = 1;
  uint8_t init_vec[64];
  for(int i = 0 ; i < 64;  i++) 
    init_vec[i] = val;

  uint64_t res = 0;
  uint64_t iter_ctr = 0;
  if (atoi(argv[3]) == 2) {
    uint8_t * dst_start = dst;
    for (int i = 0 ; i < ITERS ; i++) {
      dst = dst_start;
      res += array_clear_vec(dst , mem_blk_size, 1, init_vec);  
      //res += array_clear_vec(dst , val, 1024, 1);  
      iter_ctr++;
    }
  } else if (atoi(argv[3]) == 1) {
    uint8_t* dst_start = dst;
    for (int i = 0 ; i < ITERS ; i++) {
      dst = dst_start;
      res += array_clear_array(dst , val, mem_blk_size, 1);  
      //res += array_clear_rep(dst , val, 1024, 1);  
      iter_ctr++;
    }
  } else {
    uint8_t* dst_start = dst;
    for (int i = 0 ; i < ITERS ; i++) {
      dst = dst_start;
      res += array_clear_rep(dst , val, mem_blk_size, 1);  
      //res += array_clear_rep(dst , val, 1024, 1);  
      iter_ctr++;
    }
  }

  return printf("[iters : %ld] Res = %ld\n", iter_ctr, res);
}

