
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char * argv[]) {
  if (argc != 2) {
    return printf("Unexpected input <app> <mask>! \n");
  }  
  long cnt = 0;
  long mask = atol(argv[1]);
  printf("mask = %ld \n", mask);

  long res_hi = 0x7FFFFFFFFFFFFFFFL;
  long res_lo = 0x8000000000000000L;

  asm volatile ("popcntq %1, %0 \n\t" : "=r"(cnt) : "r"(mask) : "cc" );
  res_hi = cnt == 64 ? res_hi : (1UL << cnt) - 1;
  res_lo = cnt == 64 ? 0x8000000000000000L : 0;

  printf("cnt = %ld \n", cnt);

  printf("res_hi = %ld \n", res_hi);
  printf("res_lo = %ld \n", res_lo);
}
