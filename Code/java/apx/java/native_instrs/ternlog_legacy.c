
#include <stdio.h>

//BSS
long arr[32];
long res[8];

void func() {
   long index = 4;
   asm volatile (
      "movq %1, %%r15                  \n\t"
      "movq %2, %%r14                  \n\t"
      "vpxorq %%zmm23, %%zmm23, %%zmm23 \n\t"
      "vpxorq %%zmm24, %%zmm24, %%zmm24 \n\t"
      "vpternlogq $0xFF, 0x10(%%r15, %%r14, 8), %%zmm23, %%zmm24 \n\t"
      "vmovdqu64 %%zmm24, %0           \n\t"
     : "=m"(res) : "r"(arr), "r"(index) : "%r15", "%r14", "%zmm23", "%zmm24"
   );
}

int main() {
 func();
 return printf("res = %ld\n", res[0]);
}
