
#include "stdio.h"
#include "iacaMarks.h"
#include "xmmintrin.h"
#include "string.h"
#include "stdlib.h"


///////////////// BM Params /////////////////
#define VEC_SIZE  64                       // 512 bits
#define VEC_LANES (VEC_SIZE / sizeof(int)) // 16
#define MEM_SIZE 32768                     // 32KB
#define TRIP_COUNT (MEM_SIZE/sizeof(int))  // 8192
#define ITERS 1024*1024                    // 1M
/////////////////////////////////////////////

__attribute__((noinline))
int vector_masked_load(int * dst, int * src, int mask) {
  IACA_START;
  __asm__ volatile(
     "kmovd      %2, %%k2              \n\t"
     "vmovdqu32  %1 , %%zmm1 {{%%k2}}  \n\t"
     "vmovdqu32  %%zmm1 , %0 {{%%k2}}  \n\t"
    : "=m"(*dst)
    : "m"(*src) , "r"(mask)
    : "%zmm1", "%k2" 
  );
  IACA_END;
  return dst[VEC_LANES-1];
}

void init_mem(int * mem, int val) {
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
  int * src = (int*)_mm_malloc(MEM_SIZE, VEC_SIZE);
  int * dst = (int*)_mm_malloc(MEM_SIZE, VEC_SIZE);

  init_mem(src, 1);
  init_mem(dst, 0);

  //src = (int*)(((char*)src) + atoi(argv[1]));
  src = (int*)(((char*)src));
  dst = (int*)(((char*)dst) + atoi(argv[1]));

  int mask = atoi(argv[2]);

  for (int loop = 0 ; loop < ITERS  ; loop++) {
    for (int i = 0 ; i < TRIP_COUNT; i+=VEC_SIZE/sizeof(int)) {
      res += vector_masked_load(dst + i, src + i, mask);
      iter_ctr += 1;
    }
  }

  return printf("[iters : %ld] Res = %d\n", iter_ctr, res);
}


