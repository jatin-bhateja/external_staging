

#include "stdio.h"
#include "iacaMarks.h"
#include "xmmintrin.h"
#include "string.h"
#include "stdlib.h"
#include "assert.h"

///////////////// BM Params //////////////////
#define VEC_SIZE  64                        // 512 bits
#define VEC_LANES (VEC_SIZE / sizeof(char)) // 64
#define MEM_SIZE 512                        // 512B
#define TRIP_COUNT (MEM_SIZE/sizeof(char))  // 32768
#define ITERS 1024*1024                     // 1M
//////////////////////////////////////////////

/*
        andq      $63, %rdx                                     #15.32
        movl      $1, %r15d                                     #16.42
        movslq    %esi, %r8                                     #12.33
        negq      %rdx                                          #15.32
        addq      $64, %rdx                                     #15.32
*/

__attribute__((noinline))
int vector_masked_load(char * dst, char * src, long elem_cnt) {
  assert(elem_cnt > 64);
  IACA_START;
  long pad   = (64 - (((long)dst) & 63)) & 63;
  long kreg1 = (1 << pad) - 1;
  long kreg2 = (1 << ((((long)dst) + elem_cnt) & 63)) - 1;
  __asm__ volatile(
     "kmovq      %3  , %%k2             \n\t"
     "kmovq      %4  , %%k3             \n\t"
     "movq       %5  , %%rcx            \n\t"
     "movq       %1  , %%r9             \n\t"   // R9 = SRC
     "movq       %0  , %%r12            \n\t"   // R11 = DST
     "vmovdqu8  (%%r9) , %%zmm1 {{%%k2}} \n\t"  // Un-aligned masked copy
     "vmovdqu8  %%zmm1 , (%%r12) {{%%k2}} \n\t"  
     "addq  %%rcx , %%r9                \n\t"
     "addq  %%rcx , %%r12               \n\t"
     "main_loop:                        \n\t"   // Aligned block (512 bits) copy
     " vmovdqu8  (%%r9) , %%zmm1       \n\t"
     " vmovdqu8  %%zmm1 , (%%r12)      \n\t"
     " addq  $64 , %%r9                 \n\t"
     " addq  $64 , %%r12                \n\t"
     " cmpq  %%r11 , %%r12              \n\t"
     " jl    main_loop                  \n\t"
     "vmovdqu8  (%%r9) , %%zmm1 {{%%k3}}   \n\t" // Tail  masked copy
     "vmovdqu8  %%zmm1 , (%%r12) {{%%k3}}   \n\t"  
    : "=r"(dst)
    : "r"(src) , "r"(elem_cnt), "r"(kreg1), "r"(kreg2), "r"(pad)
    : "%zmm1", "%k2" , "%k1" , "%rax", "%rcx" , "%r9", "%r10", "%r11" , "%r12"
  );
  IACA_END;
  return dst[VEC_LANES-1];
}

void init_mem(char * mem, char val) {
  for(int i = 0 ; i < TRIP_COUNT; i++)
    mem[i] = val;
}

int main(int argc, char * argv[]) {
  int res = 0;
  long iter_ctr = 0;
  if (argc != 3) {
    fprintf(stderr," ./app <PADDING for 64 byte aligned memory> <MASK> \n");
    return -1;
  }
  char * src = (char*)_mm_malloc(MEM_SIZE, VEC_SIZE);
  char * dst = (char*)_mm_malloc(MEM_SIZE, VEC_SIZE);

  init_mem(src, 1);
  init_mem(dst, 0);

  //src = ((char*)src) + atoi(argv[1]);
  dst = ((char*)dst) + atoi(argv[1]);

  int mask = atoi(argv[2]);

  for (int loop = 0 ; loop < ITERS  ; loop++) {
    res += vector_masked_load(dst, src, MEM_SIZE);
    iter_ctr += 1;
  }

  return printf("[iters : %ld] Res = %d\n", iter_ctr, res);
}


