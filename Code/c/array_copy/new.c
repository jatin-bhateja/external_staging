
#include "stdio.h"
#include "stdlib.h"

long shift(long val, long count) {
  long res;
  asm volatile(
                "shlx %2 , %1 , %0 \n\t"
                "dec %0 \n\t"
               :"+r"(res) : "r"(val), "r"(count) : "%rcx", "cc" );
  return res;
}

int main(int argc, char * argv[]) {
  return  printf("%p\n", shift(1L, atol(argv[1])));
}
