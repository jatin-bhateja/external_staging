
// (1 << length) - 1
#include "stdio.h"
#include "stdlib.h"

__attribute__((noinline))
long genmask(long length) {
  long mask  = 0;
  long *stack = &mask;
  asm volatile(
    "mov  $-1 , %0        \n\t" 
    "bzhi %2  , %0 , %0   \n\t"
    "kmovq %%k1 , (%%rsp)      \n\t" 
   : "+r"(mask) , "=m"(stack)  : "r"(length) : "cc" , "%rax"
  );
  return mask;
}

int main(int argc, char * argv[]) {
  return printf("%lx\n", genmask(atol(argv[1])));
}
