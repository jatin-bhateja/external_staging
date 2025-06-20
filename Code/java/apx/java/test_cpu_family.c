
#include <stdio.h>

int main() {
   int eax = 0x1;
   asm volatile (
     "movl %0,  %%eax \n\t"
     "cpuid           \n\t"
     "movl %%eax, %0  \n\t"
    : "+r"(eax)
    : 
    : "cc"
   );
   printf("eax = %x \n", eax);
   printf("Family = %d\n", (eax >> 8) & 0xF);
   printf("Model = %d\n", (eax & 0xF0) >> 4);
   printf("Stepping = %d\n", eax & 0xF);
   printf("Extended_Family = %d\n", (eax & 0xFF00000)  >> 20);
   return 0;
}
