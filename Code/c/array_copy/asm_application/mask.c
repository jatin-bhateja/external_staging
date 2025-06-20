
#include "stdio.h"
#include "xmmintrin.h"
#include "stdlib.h"
#include "string.h"

// { BYTE, SHORT, INT, LONG }; 
int type_shifta [] = {0,1,2,3};
const char * type_string[] = {"byte", "short", "int", "long"};

__attribute__((noinline))
long mask(char * ptr, int type) {
  int type_shift = type_shifta[type];
  // ASM_BEGIN
  long pad = 64 - ((long)ptr & 63);
  long kreg = (1 << (pad >> type_shift))-1;
  // ASM_END
  int setcnt = _mm_popcnt_u64(kreg);
  printf("%d bits set for %d bytes (%s) pad.\n", setcnt, pad, type_string[type]);
  return kreg;
}

int main(int argc, char * argv[]) {
  if (argc != 3) {
    fprintf(stderr, "./app <PAD> <TYPE> \n");
    return -1;
  }
  char * mem = (char*) _mm_malloc(1024, 64);
  long pad = atol(argv[1]);
  int type = atoi(argv[2]);

  mem =  mem + pad;
  long kreg = mask(mem, type);

  return printf("KREG = 0x%lx\n",kreg); 
}
