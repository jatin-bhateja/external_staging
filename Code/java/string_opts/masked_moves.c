
#include <stdio.h>
#include <chrono>
#include <string>

unsigned char mask[24] = { 
   0x0, 0x0, 0x0, 0x80, 0x0, 0x0, 0x0, 0x80,
   0x0, 0x0, 0x0, 0x80, 0x0, 0x0, 0x0, 0x80,
   0x0, 0x0, 0x0, 0x80, 0x0, 0x0, 0x0, 0x80,
};

void micro1(char* dst, char *src) {
  asm volatile (
     "vmovdqu    %2, %%ymm2  \n\t"
     "vmaskmovps %1, %%ymm2, %%ymm1  \n\t"
     "vmaskmovps %%ymm1, %%ymm2, %0  \n\t"
    : "=m"(*dst)
    : "m"(*src) , "m"(*mask)
    : "%ymm1", "%ymm2"
  );
}

void micro2(char* dst, char *src) {
  asm volatile (
     "movq %0, %%rdi  \n\t"
     "movq %1, %%rsi  \n\t"
     "movdqu 0x0(%%rsi), %%xmm1 \n\t"
     "movdqu %%xmm1, 0x0(%%rdi) \n\t"
     "movq 0xF(%%rsi), %%rax \n\t"
     "movq %%rax, 0xF(%%rdi) \n\t"
    : "+r"(dst)
    : "r"(src)
    : "%rdi", "%rsi", "%ymm1", "%rax"
  );
}

void micro3(char* dst, char *src) {
  asm volatile (
     "movq %0, %%rdi  \n\t"
     "movq %1, %%rsi  \n\t"
     "movq 0x0(%%rsi), %%rax \n\t"
     "movq %%rax, 0x0(%%rdi) \n\t"
     "movq 0x8(%%rsi), %%rax \n\t"
     "movq %%rax, 0x8(%%rdi) \n\t"
     "movq 0xF(%%rsi), %%rax \n\t"
     "movq %%rax, 0xF(%%rdi) \n\t"
    : "+r"(dst)
    : "r"(src)
    : "%rdi", "%rsi", "%rax"
  );
}
char src[24] = {
     '1', '1', '1', '1', '1', '1', '1', '1',
     '1', '1', '1', '1', '1', '1', '1', '1',
     '1', '1', '1', '1', '1', '1', '1', '1',
};
char dst[24] = {0};

int main (int argc, char* argv[]) {
   int algo = atoi(argv[1]);

   if (algo == 0 || algo == 3) {
     auto start = std::chrono::steady_clock::now();
     for (int i = 0; i < 200; i++) {
       for (int j = 0; j < 10000000; j++) {
          micro1(dst, src);
       }
     }
     auto end = std::chrono::steady_clock::now();
     std::chrono::duration<double> diff = end - start;
     printf("[simd time] %lf\n", diff.count());
     for (int i = 0; i < 24; i++) {
        printf("%c ", dst[i]);
     }
     fflush(stdout);
   }
   if (algo == 1 || algo == 3) {
     auto start = std::chrono::steady_clock::now();
     for (int i = 0; i < 200; i++) {
       for (int j = 0; j < 10000000; j++) {
          micro2(dst, src);
       }
     }
     auto end = std::chrono::steady_clock::now();
     std::chrono::duration<double> diff = end - start;
     printf("\n[simd + scalar time] %lf\n", diff.count());
     for (int i = 0; i < 24; i++) {
        printf("%c ", dst[i]);
     }
     fflush(stdout);
   }
   if (algo == 2 || algo == 3) {
     auto start = std::chrono::steady_clock::now();
     for (int i = 0; i < 200; i++) {
       for (int j = 0; j < 10000000; j++) {
          micro3(dst, src);
       }
     }
     auto end = std::chrono::steady_clock::now();
     std::chrono::duration<double> diff = end - start;
     printf("\n[scalar time] %lf\n", diff.count());
     for (int i = 0; i < 24; i++) {
        printf("%c ", dst[i]);
     }
   }
   printf("\n");
   return 0;
}
