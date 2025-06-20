
#include "stdio.h"
#include "stdlib.h"

long shift_r(long val, long count) {
  long res;
  asm volatile("shrx %2 , %1 , %0 \n\t"
               :"+r"(res) : "r"(val), "r"(count) : "%rcx", "cc" );
  return res;
}

int main(int argc, char * argv[]) {
  return  printf("%p\n", shift_r(-1L, atol(argv[1])));
}
