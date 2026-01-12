
#include <chrono>
#include <stdio.h>
#include <stdlib.h>


__attribute((noinline))
long micro_imul(long num) {
    long res = 0;
    asm volatile (
        "imulq $0x25, %1, %%rax  \n\t"
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
