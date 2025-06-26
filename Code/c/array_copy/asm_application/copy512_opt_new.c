

#include "stdio.h"
#include "iacaMarks.h"
#include "xmmintrin.h"
#include "string.h"
#include "stdlib.h"
#include "assert.h"

///////////////// BM Params //////////////////
#define VEC_SIZE  64                        // 512 bits
#define VEC_LANES (VEC_SIZE / sizeof(char)) // 64
#define MEM_SIZE 300                        // 32K 
#define TRIP_COUNT (MEM_SIZE/sizeof(char))  // 32K
#define ITERS 1024*1024                  // 32M
//////////////////////////////////////////////

__attribute__((noinline))
int vector_masked_load(char * dst, char * src, long elem_cnt) {
  IACA_START;
  __asm__ volatile(
       "movq  %1 , %%rax    \n\t"
       "movq  %0 , %%rdx    \n\t"

       "cmpq  $0, %2        \n\t"
       "jle   L_exit        \n\t"

       "xorq %%r11, %%r11   \n\t"
       "decq %%r11          \n\t"

       "cmpq  $64 , %2      \n\t" 
       "jg L_entry          \n\t"

       "negq %2             \n\t"
       "addq  $64,  %2      \n\t"
       "shrx %2, %%r11, %%r11 \n\t"
       "kmovq   %%r11 , %%k2  \n\t"
       "vmovdqu8  (%%rax) , %%zmm1 {{%%k2}}   \n\t"
       "vmovdqu8  %%zmm1  , (%%rdx) {{%%k2}}  \n\t"
       "jmp L_exit           \n\t"

       "L_entry:             \n\t"
       "movq %%rdx ,%%r8     \n\t"
       "andq $63 , %%r8      \n\t" 
       "movq %%r8, %%r10     \n\t"
       "negq %%r10           \n\t"
       "addq $64 , %%r10     \n\t"
       "movq %%r11 , %%r9    \n\t"
       "shrx %%r8, %%r9, %%r9 \n\t"
       "kmovq %%r9 , %%k2     \n\t" 
       "vmovdqu8 (%%rax) , %%zmm1 {{%%k2}}   \n\t" 
       "vmovdqu8 %%zmm1  , (%%rdx) {{%%k2}}  \n\t" 
       "addq %%r10 , %%rax   \n\t"
       "addq %%r10 , %%rdx   \n\t"
       "subq %%r10 , %2      \n\t"
       "cmpq $64 , %2        \n\t"
       "jle   L_tail          \n\t"

       "L_main_loop:         \n\t"   // Aligned block (64 bytes) copy
       "   vmovdqu8  (%%rax) , %%zmm1  \n\t"
       "   vmovdqu8  %%zmm1  , (%%rdx) \n\t"
       "   addq  $64, %%rax  \n\t"
       "   addq  $64, %%rdx  \n\t"
       "   subq  $64, %2     \n\t"
       "   cmpq  $64, %2     \n\t"
       "   jg  L_main_loop   \n\t"

       "L_tail:              \n\t"
       "negq %2              \n\t"
       "addq $64  , %2       \n\t"
       "shrx %2, %%r11,  %%r11 \n\t"
       "kmovq %%r11 , %%k2    \n\t"
       "vmovdqu8 (%%rax) , %%zmm1 {{%%k2}}   \n\t" 
       "vmovdqu8 %%zmm1  , (%%rdx) {{%%k2}}  \n\t" 
       "L_exit:              \n\t"

    : "=m"(dst)
    : "m"(src) , "r"(elem_cnt) 
    : "%zmm1", "%k2" , "%rax", "%rcx" , "%r8", "%r9", "%r10", "%r11" , "%rdx" 
  );
  IACA_END;
  return dst[elem_cnt-1];
}

void init_mem(char * mem, char val) {
  for(int i = 0 ; i < TRIP_COUNT; i++)
    mem[i] = val;
}

int main(int argc, char * argv[]) {
  int res = 0;
  long iter_ctr = 0;
#if 1
  if (argc != 3) {
    fprintf(stderr," ./app <PADDING for 64 byte aligned memory> <copy_length>\n");
    return -1;
  }
#else
  if (argc != 2) {
    fprintf(stderr," ./app <PADDING for 64 byte aligned memory>\n");
    return -1;
  }
#endif
  char * src = (char*)_mm_malloc(MEM_SIZE, VEC_SIZE);
  char * dst = (char*)_mm_malloc(MEM_SIZE, VEC_SIZE);
  //strcpy(src,"com/sun/tools/javac/util/AbstractDiagnosticFormatter\\$SimpleConfiguration.class");

  init_mem(src, 1);
  init_mem(dst, 2);

  //src = ((char*)src) + atoi(argv[1]);
  dst = ((char*)dst) + atoi(argv[1]);

#if 0
  dst = ((char*)dst) + atoi(argv[1]);
  int fraction = 64 - atoi(argv[1]);
  for (int loop = 0 ; loop < ITERS  ; loop++) {
    int skip =  64*loop & ((1<<14)-1);
    res += vector_masked_load(dst + skip, src + skip, fraction);
    iter_ctr += 1;
  }
#else
  for (int loop = 0 ; loop < ITERS  ; loop++) {
    res += vector_masked_load(dst, src, atol(argv[2]));
    //res += vector_masked_load(dst, src, MEM_SIZE);
    iter_ctr += 1;
  }
#endif

#ifdef _DEBUG
  printf("\nDST MEM  = [ ");
  dst = ((char*)dst) - atoi(argv[1]);
  for (int i = 0; i < MEM_SIZE ; i++) 
     printf(" %d[%d] " , ((int)dst[i]),i);
 
  printf(" ] \n");
#endif

  return printf("[iters : %ld] Res = %d\n", iter_ctr, res);
}


