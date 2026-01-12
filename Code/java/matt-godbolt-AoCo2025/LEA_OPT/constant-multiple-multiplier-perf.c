
#include <chrono>
#include <stdio.h>
#include <stdlib.h>


__attribute((noinline))
long micro_imul(long num) {
    long res = 0;
    asm volatile (
        "imulq $0x25, %1, %%rax  \n\t"
        "imulq $0xb,  %1, %%rbx  \n\t"
        "imulq $0xd,  %1, %%rcx  \n\t"
        "imulq $0x13, %1, %%r9   \n\t"
        "imulq $0x1b, %1, %%r10  \n\t"
        "imulq $0x19, %1, %%r11  \n\t"
        "addq %%rbx, %%rax       \n\t"
        "addq %%rcx, %%rax       \n\t"
        "addq %%r9,  %%rax       \n\t"
        "addq %%r10, %%rax       \n\t"
        "addq %%r11, %%rax       \n\t"
        "movq %%rax, %0          \n\t"
       : "=r"(res)
       : "r"(num)
       : "cc" , "%rax", "%rbx", "%rcx", "%r9", "%r10", "%r11"
    );
    return res;
}


__attribute((noinline))
long micro_lea(long num) {
    long res = 0;
    asm volatile (
        "leaq (%1, %1, 0x8), %%rax      \n\t"
        "leaq (%1, %%rax, 0x4), %%rax   \n\t"
        "leaq (%1, %1, 0x4), %%rbx      \n\t"
        "leaq (%1, %%rbx, 0x2), %%rbx   \n\t"
        "leaq (%1, %1, 0x2), %%rcx      \n\t"
        "leaq (%1, %%rcx, 0x4), %%rcx   \n\t"
        "leaq (%1, %1, 0x8), %%r9       \n\t"
        "leaq (%1, %%r9, 0x2), %%r9     \n\t"
        "leaq (%1, %1, 0x2), %%r10      \n\t"
        "leaq (%%r10, %%r10, 0x8), %%r10 \n\t"
        "leaq (%1, %1, 0x4), %%r11       \n\t"
        "leaq (%%r11, %%r11, 0x4), %%r11 \n\t"
        "addq %%rbx, %%rax       \n\t"
        "addq %%rcx, %%rax       \n\t"
        "addq %%r9,  %%rax       \n\t"
        "addq %%r10, %%rax       \n\t"
        "addq %%r11, %%rax       \n\t"
        "movq %%rax, %0          \n\t"
       : "=r"(res)
       : "r"(num)
       : "cc" , "%rax", "%rbx", "%rcx", "%r9", "%r10", "%r11"
    );
    return res;
}

typedef long (*micro)(long);

int main(int argc, char* argv[]) {
  if (argc != 2) {
    return fprintf(stderr, "<micro> <algo=0,1> \n");
  }

  int algo = atoi(argv[1]);
  micro bm = algo == 0 ? micro_imul : micro_lea;

  long res = 0;
  for (long i = 0; i < 2000000000; i++) {
    res += bm(i);
  }
  res = 0;
  auto start = std::chrono::high_resolution_clock::now();
  for (long i = 0; i < 2000000000; i++) {
    res += bm(i);
  }
  auto stop = std::chrono::high_resolution_clock::now();
  auto duration = std::chrono::duration<double>(stop - start);
  return fprintf(stdout, "[time] %lfs  [res]  %ld\n", duration.count(), res);
}
