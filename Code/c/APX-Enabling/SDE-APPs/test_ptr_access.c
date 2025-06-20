
#include <stdio.h>

void micro(long* res, long src1, long src2) {
   asm volatile (
      "movq %1, %%r16    \n\t"
      "movq %2, %%r17    \n\t"
      "addq %%r16, %%r17 \n\t"
      "movq %%r17, %0    \n\t"
     : "=m"(*res)
     : "r"(src1), "r"(src2)
   );
}


int main() {
   long res = 0;
   //long* pres = &res;
   long* pres = (long*)0x3;
   micro(pres, 10, 20);
   return printf("[res] %ld\n", res);
}
