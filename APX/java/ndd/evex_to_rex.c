#include <stdio.h>

long micro1() {
   long res = 0;
   asm volatile (
      "movq $10, %%rax          \n\t"
      "movq $20, %%rbx          \n\t"
      "addq %%rax, %%rbx, %%rbx \n\t"
      "movq %%rbx , %0          \n\t"
     : "=r"(res)
     :
     : "cc"
   );
   return res;
}

long micro2() {
   long res = 0;
   asm volatile (
      "movq $10, %%rax          \n\t"
      "movq $20, %%rbx          \n\t"
      "addq %%rax, %%rbx        \n\t"
      "movq %%rbx , %0          \n\t"
     : "=r"(res)
     :
     : "cc"
   );
   return res;
}

long micro3() {
   long res = 0;
   asm volatile (
      "movq $10, %%rax          \n\t"
      "movq $20, %%rbx          \n\t"
      "addq %%rbx, %%rax, %%rbx \n\t"
      "movq %%rbx , %0          \n\t"
     : "=r"(res)
     :
     : "cc"
   );
   return res;
}

int main() {
  printf("micro1 = %ld\n", micro1());
  printf("micro2 = %ld\n", micro2());
  printf("micro3 = %ld\n", micro3());
  return 0;
}
