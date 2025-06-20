
#include <stdio.h>

void micro(long* res, long src1, long src2) {
   asm volatile (
      "movq %1, %%r16        \n\t"
      "movq %2, %%r17        \n\t"
      "addq %%r16, %%r17     \n\t"
      "movd %%r17, %%xmm0    \n\t"
      "vmovdqa %%ymm0, %0    \n\t"
     : "=m"(*res)
     : "r"(src1), "r"(src2)
     : "%r16", "%r17", "%xmm0"
   );
}

int main() {
   long res[4] = {0, 0, 0, 0};
   int dummy = 10;
   long* pres = (long*)&res;
   //long* pres = (long*)0x3;
   micro(pres, dummy, 20);
   return printf("[res] %ld\n", res);
}
