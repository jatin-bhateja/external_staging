
#include "stdio.h"

__attribute__((noinline))
int compareU(int a, int b){
  int r = 0;
  asm volatile(
    "movl $0, %%eax \n\t"
    "cmpl %2, %1 \n\t"
    "seta %%al    \n\t"
    "movl %%eax, %0 \n\t"
  : "=r"(r)
  : "r"(a), "r"(b)
  : "cc" , "%eax"
  );
  return r;
}

__attribute__((noinline))
int compare(int a, int b){
  int r = 0;
  asm volatile(
    "movl $0, %%eax \n\t"
    "cmpl %2, %1 \n\t"
    "setg %%al    \n\t"
    "movl %%eax, %0 \n\t"
  : "=r"(r)
  : "r"(a), "r"(b)
  : "cc", "%eax"
  );
  return r;
}


int main() {
  printf("%d\n" , compareU(-1 , 0));
  printf("%d\n" , compare(-1 , 0));
  return 0;
}
