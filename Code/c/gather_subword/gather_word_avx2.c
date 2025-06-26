#include <stdio.h>
#include <alloca.h>
#include <stdlib.h>
#include <string.h>
#include <chrono>

__attribute__((noinline))
long gather_word(short* src, int* index, int length) {
  long res = 0;
  short* temp = (short*)malloc(length * sizeof(short));  // To mimic allocation in Java implimentation.
  memset(temp, 0, length*sizeof(short));
  asm volatile(
    "movq %1, %%rsi \n\t"
    "movq %2, %%rdi \n\t"
    "movq %3, %%rbx \n\t"
    "movl %4, %%ecx \n\t"
    "xorq %%rdx, %%rdx \n\t"
    "loop:          \n\t"
    "  movl (%%rbx, %%rdx, 4), %%eax \n\t"
    "  movw (%%rsi, %%rax, 2), %%ax  \n\t"
    "  movw %%ax, (%%rdi, %%rdx, 2)  \n\t"
    "  incl %%edx                    \n\t"
    "  decl %%ecx                    \n\t"
    "  jnz loop                      \n\t"
    "vmovdqu64  (%%rdi), %%ymm0      \n\t"
    "movq %%xmm0, %0  \n\t"
    : "=r"(res)
    : "r"(src), "r"(temp), "r"(index), "r"(length)
    : "%rax", "%rsi", "%xmm0", "%ecx", "%rdi", "%rdx", "%rbx"
  );
  free(temp);
  return res;
}

int perm_table [16] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
int round_table [16] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};

// I0 -> 1 2 3 4 5 6 7 8 - 1 1 1 1 1 1 1 1  = 0 1 2 3 4 5 6 7 
// I1 -> 1 2 3 4 5 6 7 8 - 3 3 3 3 3 3 3 3  = -2 -1 0 1 2 3 4 5
// I2 -> 1 2 3 4 5 6 7 8 - 5 5 5 5 5 5 5 5  = -4 -3 -2 -1 0 1 2 3
// I3 -> 1 2 3 4 5 6 7 8 - 7 7 7 7 7 7 7 7  = -6 -5 -4 -3 -2 -1 0 1

__attribute__((noinline))
long gather_word_avx2(short* src, int* index, int length) {
  long res = 0;
  asm volatile(
    "movq %1, %%rsi \n\t"
    "movq %2, %%rdi \n\t"
    "movq %3, %%r11 \n\t"
    "movq %4, %%r9 \n\t"
    "movl %5, %%ecx \n\t"
    "vpxorq  %%ymm2, %%ymm2, %%ymm2             \n\t"
    "vmovdqu (%%r11),  %%ymm4                   \n\t"
    "vmovdqu (%%r9),  %%ymm3                    \n\t"
    "vpaddd  %%ymm3 , %%ymm3, %%ymm5            \n\t"
    "loop1:                                     \n\t"
    "    vpxorq  %%ymm0, %%ymm0, %%ymm0         \n\t"
    "    movl (%%rdi), %%eax                    \n\t"
    "    pinsrw $0x0, (%%rsi, %%rax, 2), %%xmm0 \n\t"
    "    movl 0x4(%%rdi), %%eax                 \n\t"
    "    pinsrw $0x1, (%%rsi, %%rax, 2), %%xmm0 \n\t"
    "    movl 0x8(%%rdi), %%eax                 \n\t"
    "    pinsrw $0x2, (%%rsi, %%rax, 2), %%xmm0 \n\t"
    "    movl 0xc(%%rdi), %%eax                 \n\t"
    "    pinsrw $0x3, (%%rsi, %%rax, 2), %%xmm0 \n\t"
    "    vpsubd %%ymm3, %%ymm4, %%ymm1          \n\t"
    "    vpermd %%ymm0, %%ymm1, %%ymm0          \n\t"
    "    vporq  %%ymm0, %%ymm2, %%ymm2          \n\t"  
    "    vpaddd %%ymm5, %%ymm3, %%ymm3          \n\t"
    "    addq $0x10, %%rdi \n\t"
    "    subl $0x4, %%ecx  \n\t"
    "    jnz  loop1        \n\t" 
    "movd %%xmm2, %0       \n\t"
    : "=r"(res)
    : "r"(src), "r"(index), "r"(perm_table), "r"(round_table), "r"(length)
    : "%r9", "%r11", "%rax", "%rsi", "%ymm0", "%ecx", "%rdi", "%ymm1", "%ymm2", "%ymm3", "%ymm4"
  );
  return res;
}

#define SIZE 1024
#define ISIZE 16

int main() {
  long res = 0L;
  short* source = (short*)malloc(SIZE*sizeof(short));
  int* index = (int*)malloc(ISIZE*sizeof(int));
  for (int i = 0; i < SIZE; i++) {
      source[i] = (short)i;
  } 
  for (int i = 0; i < ISIZE; i++) {
      index[i] = i * 16;
  } 
  for (int i = 0; i < 90000000; i++) {
      res += gather_word(source, index, 16);
  }
  auto start = std::chrono::steady_clock::now();
  for (int i = 0; i < 90000000; i++) {
      res += gather_word(source, index, 16);
  }
  auto end = std::chrono::steady_clock::now();
  std::chrono::duration<double> diff = end - start;
  printf("[time] %lf   [res]  %ld\n", diff.count(), res );

  res = 0;
  for (int i = 0; i < 90000000; i++) {
      res += gather_word_avx2(source, index, 16);
  }
  start = std::chrono::steady_clock::now();
  for (int i = 0; i < 90000000; i++) {
      res += gather_word_avx2(source, index, 16);
  }
  end = std::chrono::steady_clock::now();
  diff = end - start;
  printf("[time] %lf   [res]  %ld\n", diff.count(), res );

  free(source);
  free(index);
  return 0;
}
