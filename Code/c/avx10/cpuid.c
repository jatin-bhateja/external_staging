#include <stdio.h>

#define TEST_BIT(X, POS) \
  (((X) & (1 << POS)) != 0)

#define GET_BITS(X, POS, NUM) \
  (((X) & (((1 << NUM) - 1) << POS)) >> POS)

int main() {
   int eax = 0,
       ebx = 0,
       ecx = 0,
       edx = 0;
   asm volatile (
      "movl $0x7, %%eax \n\t"
      "movl $0x1, %%ecx \n\t"
      "cpuid           \n\t"
      "movl %%eax, %0  \n\t"
      "movl %%ebx, %1  \n\t"
      "movl %%ecx, %2  \n\t"
      "movl %%edx, %3  \n\t"
    : "=r"(eax), "=r"(ebx), "=r"(ecx), "=r"(edx)
    :
    : "%eax", "%ebx", "%ecx", "%edx"
   );
   if (TEST_BIT(edx, 19)) {
     printf("AVX10 supported\n");
     eax = 0;
     ebx = 0;
     ecx = 0;
     edx = 0;
     asm volatile (
        "movl $0x24, %%eax \n\t"
        "movl $0x0, %%ecx \n\t"
        "cpuid           \n\t"
        "movl %%eax, %0  \n\t"
        "movl %%ebx, %1  \n\t"
        "movl %%ecx, %2  \n\t"
        "movl %%edx, %3  \n\t"
      : "=r"(eax), "=r"(ebx), "=r"(ecx), "=r"(edx)
      :
      : "%eax", "%ebx", "%ecx", "%edx"
     );
     printf("AVX10 converged ISA version : %d \n\t", GET_BITS(ebx, 0, 8));
     printf("AVX10 512 bit vector ISA supported : %d \n\t", TEST_BIT(ebx, 16));
     printf("AVX10 256 bit vector ISA supported : %d \n\t", TEST_BIT(ebx, 17));
     printf("AVX10 128 bit vector ISA supported : %d \n", TEST_BIT(ebx, 18));
   } else {
     printf("AVX10 not supported\n");
     printf("edx = %x\n", edx);
   }
}
