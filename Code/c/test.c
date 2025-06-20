#include "stdio.h"

int main() {
  int res = 0;
  asm volatile (
    "movl $-1, %%eax \n\t"
    "kmovw %%eax, %%k2  \n\t"
    "kmovw %%k2, %0 \n\t"
    //"kshiftrw $15, %%k2 , %%k1 \n\t"
    //"kshiftrw $15, %%k0 , %%k1 \n\t"
   : "=r"(res) :: "%k1", "%eax", "%k2"); 
  return printf("%d\n", res);
}
