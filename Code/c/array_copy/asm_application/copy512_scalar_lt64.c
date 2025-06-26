

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
#define ITERS 1024*1024                  // 32M
//////////////////////////////////////////////


void init_mem(char * mem, char val) {
  for(int i = 0 ; i < TRIP_COUNT; i++)
    mem[i] = val;
}

__attribute__((noinline))
int scalar_copy(char * dst, char * src , int len) {
  for(int i = 0; i < len/8; i++)
    ((long*)(dst))[i] = ((long*)src)[i];
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
#if 0
  int fraction = 64 - atoi(argv[1]);
  for (int loop = 0 ; loop < ITERS  ; loop++) {
    int skip =  64*loop & ((1<<14)-1);   
    res += scalar_copy(dst + skip, src + skip, fraction);
    iter_ctr += 1;
  }
#else
  for (int loop = 0 ; loop < ITERS  ; loop++) {
    res += scalar_copy(dst, src, MEM_SIZE);
    iter_ctr += 1;
  }
#endif

  return printf("[iters : %ld] Res = %d\n", iter_ctr, res);
}


