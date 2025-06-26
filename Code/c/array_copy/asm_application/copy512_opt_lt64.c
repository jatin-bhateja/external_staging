

#include "stdio.h"
#include "iacaMarks.h"
#include "xmmintrin.h"
#include "string.h"
#include "stdlib.h"
#include "assert.h"

///////////////// BM Params //////////////////
#define VEC_SIZE  64                        // 512 bits
#define VEC_LANES (VEC_SIZE / sizeof(char)) // 64
#define MEM_SIZE 1024*32                    // 32KB
#define TRIP_COUNT (MEM_SIZE/sizeof(char))  // 32768
#define ITERS 1024*1024*32                  // 32M
//////////////////////////////////////////////

/*
        andq      $63, %rdx                                     #15.32
        movl      $1, %r15d                                     #16.42
        movslq    %esi, %r8                                     #12.33
        negq      %rdx                                          #15.32
        addq      $64, %rdx                                     #15.32
*/

__attribute__((noinline))
int vector_masked_copy(char * dst, char * src, long elem_cnt) {
  assert(elem_cnt < 64);
  IACA_START;
  __asm__ volatile(
     "movq       %1  , %%r9             \n\t"   // R9 =  SRC
     "movq       %0  , %%r11            \n\t"   // R11 = DST
     "movq       %0  , %%rax            \n\t"   // RAX = DST
     "mov        $64 , %%rcx            \n\t"   // RCX = 64
     "andq       $63 , %%rax            \n\t"   // RAX = DST & 63 
     "subq       %%rax, %%rcx           \n\t"   // RCX =  64 - RAX (fraction in CacheLine)
     "andq       $63  , %%rcx           \n\t"   // RCX = RCX & 63
     "mov        $-1  , %%r10           \n\t"  // R10 = 1 
     "shrx       %%rcx , %%r10 , %%rax  \n\t"   // RAX =  1  << RCX
     "kmovq      %%rax, %%k2            \n\t"   // K2 = RCX
     "vmovdqu8  (%%r9) , %%zmm1 {{%%k2}} \n\t"  // Un-aligned masked copy
     "vmovdqu8  %%zmm1 , (%%r11) {{%%k2}} \n\t"  
    : "=m"(dst)
    : "m"(src) , "r"(elem_cnt) 
    : "%zmm1", "%k2" , "%rax", "%rcx" , "%r9", "%r10", "%r11" 
  );
  IACA_END;
  return dst[0];
}

void init_mem(char * mem, char val) {
  for(int i = 0 ; i < TRIP_COUNT; i++)
    mem[i] = val;
}

__attribute__((noinline))
int scalar_copy(char * dst, char * src , int len) {
  for(int i = 0; i < len; i++)
    dst[i] = src[i];
  return dst[0];
}

int main(int argc, char * argv[]) {
  int res = 0;
  long iter_ctr = 0;
  if (argc != 2) {
    fprintf(stderr," ./app <PADDING for 64 byte aligned memory>\n");
    return -1;
  }
  char * src = (char*)_mm_malloc(MEM_SIZE, VEC_SIZE);
  char * dst = (char*)_mm_malloc(MEM_SIZE, VEC_SIZE);

  init_mem(src, 1);
  init_mem(dst, 0);

  dst = ((char*)dst) + atoi(argv[1]);
  int fraction = 64 - atoi(argv[1]);
  for (int loop = 0 ; loop < ITERS  ; loop++) {
    int skip =  64*loop & ((1<<14)-1);   
    res += vector_masked_copy(dst + skip, src + skip, fraction);
    iter_ctr += 1;
  }

  return printf("[iters : %ld] Res = %d\n", iter_ctr, res);
}


