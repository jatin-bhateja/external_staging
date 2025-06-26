
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


// 32 byte vectors and its masked variants. 
// Main aligned to 32 byte boundry, loop does 128 byte copies.
__attribute__((noinline))
uint8_t array_copy_vec(uint8_t* dst, uint8_t* src, long len, int ptype) {
     int ret; 
     if ( ptype == 1) {
        asm volatile (
          "movq %0   ,  %%rdi               \n\t"
          "movq %2   ,  %%rsi               \n\t"
          "small_blocks:                    \n\t"
          " cmpq     $0 , %3                \n\t"
          " je exit                         \n\t"
          "block_32:                        \n\t"
          " cmpq         $32 , %3           \n\t"
          " jg           block_64           \n\t"
          " mov          $1  , %%rax        \n\t"
          " shlx         %3  , %%rax, %%rax \n\t"
          " decq         %%rax              \n\t"
          " kmovq        %%rax , %%k1       \n\t"
          " vmovdqu8     (%%rsi) , %%ymm0  {{%%k1}}  \n\t"
          " vmovdqu8     %%ymm0 , (%%rdi) {{%%k1}}  \n\t"
          " jmp          exit               \n\t"
          "block_64:                        \n\t"
          " cmpq         $64  , %3          \n\t"
          " jg           block_96           \n\t"
          " negq         %3                 \n\t"
          " addq         $64 , %%rax         \n\t"
          " mov          $-1 , %%rax        \n\t"
          " shrx         %3  , %%rax, %%rax \n\t"
          " kmovq        %%rax , %%k1       \n\t"
          " vmovdqu8     32(%%rsi) , %%zmm0  {{%%k1}}  \n\t"
          " vmovdqu8     %%zmm0 , 32(%%rdi) {{%%k1}}  \n\t"
          " jmp          exit               \n\t"
          "block_96:                        \n\t"
          " cmpq         $96  , %3          \n\t"
          " jg           block_128          \n\t"
          " vmovdqu64    (%%rsi) , %%zmm0   \n\t"
          " vmovdqu64    %%zmm0 , (%%rdi)   \n\t"
          " subq         $64  , %3          \n\t"
          " mov          $1  , %%rax        \n\t"
          " shlx         %3  , %%rax, %%rax \n\t"
          " decq         %%rax              \n\t"
          " kmovq        %%rax , %%k1       \n\t"
          " vmovdqu8     64(%%rsi) , %%ymm0  {{%%k1}}  \n\t"
          " vmovdqu8     %%ymm0 , 64(%%rdi) {{%%k1}}  \n\t"
          " jmp          exit               \n\t"
          "block_128:                       \n\t"
          " cmpq         $128  , %3          \n\t"
          " jg           block_160          \n\t"
          " vmovdqu64    (%%rsi) , %%zmm0   \n\t"
          " vmovdqu64    %%zmm0 , (%%rdi)   \n\t"
          " vmovdqu32    64(%%rsi) , %%ymm0  \n\t"
          " vmovdqu32    %%ymm0 , 64(%%rdi)  \n\t"
          " subq         $96  , %3          \n\t"
          " mov          $1  , %%rax        \n\t"
          " shlx         %3  , %%rax, %%rax \n\t"
          " decq         %%rax              \n\t"
          " kmovq        %%rax , %%k1       \n\t"
          " vmovdqu8     96(%%rsi) , %%ymm0  {{%%k1}}  \n\t"
          " vmovdqu8     %%ymm0 , 96(%%rdi) {{%%k1}}  \n\t"
          " jmp          exit               \n\t"
          "block_160:                       \n\t"
          " cmpq         $160  , %3         \n\t"
          " jg           block_192          \n\t"
          " vmovdqu64    (%%rsi) , %%zmm0   \n\t"
          " vmovdqu64    %%zmm0 , (%%rdi)   \n\t"
          " vmovdqu64    64(%%rsi) , %%zmm0   \n\t"
          " vmovdqu64    %%zmm0 , 64(%%rdi)   \n\t"
          " subq         $128  , %3          \n\t"
          " mov          $1  , %%rax        \n\t"
          " shlx         %3  , %%rax, %%rax \n\t"
          " decq         %%rax              \n\t"
          " kmovq        %%rax , %%k1       \n\t"
          " vmovdqu8     128(%%rsi) , %%ymm0  {{%%k1}}  \n\t"
          " vmovdqu8     %%ymm0 , 128(%%rdi) {{%%k1}}  \n\t"
          " jmp          exit               \n\t"
          "block_192:                       \n\t"
          " cmpq         $192  , %3         \n\t"
          " jg           aligned_loop       \n\t"
          " vmovdqu64    (%%rsi) , %%zmm0   \n\t"
          " vmovdqu64    %%zmm0 , (%%rdi)   \n\t"
          " vmovdqu64    64(%%rsi) , %%zmm0   \n\t"
          " vmovdqu64    %%zmm0 , 64(%%rdi)   \n\t"
          " vmovdqu32    128(%%rsi) , %%ymm0  \n\t"
          " vmovdqu32    %%ymm0 , 128(%%rdi)  \n\t"
          " subq         $160  , %3          \n\t"
          " mov          $1  , %%rax        \n\t"
          " shlx         %3  , %%rax, %%rax \n\t"
          " decq         %%rax              \n\t"
          " kmovq        %%rax , %%k1       \n\t"
          " vmovdqu8     160(%%rsi) , %%ymm0  {{%%k1}}  \n\t"
          " vmovdqu8     %%ymm0 , 160(%%rdi) {{%%k1}}  \n\t"
          " jmp          exit               \n\t"
          "aligned_loop:                    \n\t"
          " mov          %0  , %%rcx        \n\t"
          " andq         $63 , %%rcx        \n\t"
          " negq         %%rcx              \n\t"
          " addq         $64 , %%rcx        \n\t"
          " mov          $-1  ,  %%rax       \n\t"
          " shrx         %%rcx , %%rax, %%rax \n\t"
          " kmovq        %%rax , %%k1       \n\t"
          " vmovdqu8     (%%rsi) , %%zmm0  {{%%k1}}  \n\t"
          " vmovdqu8     %%zmm0 , (%%rdi) {{%%k1}}  \n\t"
          " addq         %%rcx , %%rdi      \n\t"
          " addq         %%rcx , %%rsi      \n\t"
          " subq         %%rcx , %3         \n\t"
          " cmpq         $192 , %3          \n\t"
          " jl           small_blocks       \n\t"
          // 64 byte aligned loop.
          " subq         $192 , %3           \n\t"
          " mainloop:                        \n\t"
          "  vmovdqu64    (%%rsi) , %%zmm0   \n\t"
          "  vmovdqu64    %%zmm0 , (%%rdi)   \n\t"
          "  vmovdqu64    64(%%rsi) , %%zmm0 \n\t"
          "  vmovdqu64    %%zmm0 , 64(%%rdi) \n\t"
          "  vmovdqu64    128(%%rsi) , %%zmm0\n\t"
          "  vmovdqu64    %%zmm0 , 128(%%rdi)\n\t"
          // Shared iteration incrementation.
          "  addq     $192 , %%rdi          \n\t"
          "  addq     $192 , %%rsi          \n\t"
          "  subq     $192 , %3             \n\t"
          "  ja       mainloop              \n\t"       
          " tail:                           \n\t"
          "  jmp  small_blocks              \n\t"
          "exit:                            \n\t"
          "mov    -8(%%rdi) , %1            \n\t"
         : "=m"(dst) , "=r"(ret)
         : "m"(src) , "r"(len)
         :  "%ymm0" , "%k1" ,"%rdi", "%rcx", "%rax" ,"%r8");
    } else if (ptype == 2) {

    } else if (ptype == 3) {
   
    } else if (ptype == 4) {

    } else {
      assert(0);
    }
   return  ret;
}

__attribute__((noinline))
uint8_t array_copy_rep( uint8_t *dst, uint8_t *src, long len, int ptype) {
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
    fprintf(stderr," ./app <PADDING for 64 byte aligned copy> <blk_size_mult> <1/0>\n");
    return -1;
  }
  uint8_t* dst = (uint8_t*)_mm_malloc(MEM_SIZE, 64);
  uint8_t* src = (uint8_t*)_mm_malloc(MEM_SIZE, 64);
  uint64_t offset = atol(argv[1]);
  dst += offset; 
  src += offset; 

  float sz_mult = atof(argv[2]);
  uint64_t mem_blk_size = (uint64_t)((sz_mult*((MEM_SIZE)-offset)));
  fprintf(stdout,"sz_mult = %f \ninit_offset = %ld\n", sz_mult, offset);
  fprintf(stdout,"mem_size = %ld bytes\n", mem_blk_size);

  init_mem(src, 1);

  uint64_t res = 0;
  uint64_t iter_ctr = 0;
  if (atoi(argv[3]) == 1) {
    uint8_t * dst_start = dst;
    for (int i = 0 ; i < ITERS ; i++) {
      dst = dst_start;
      res += array_copy_vec(dst , src, mem_blk_size, 1);  
      iter_ctr++;
    }
  } else {
    uint8_t* dst_start = dst;
    for (int i = 0 ; i < ITERS ; i++) {
      dst = dst_start;
      res += array_copy_rep(dst , src, mem_blk_size, 1);  
      iter_ctr++;
    }
  }

  printf("[iters : %ld] Res = %ld\n", iter_ctr, res);
  return 0;
}

