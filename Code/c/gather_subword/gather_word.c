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
    "vmovdqu64  (%%rdi), %%zmm0      \n\t"
    "movq %%xmm0, %0  \n\t"
    : "=r"(res)
    : "r"(src), "r"(temp), "r"(index), "r"(length)
    : "%rax", "%rsi", "%xmm0", "%ecx", "%rdi", "%rdx", "%rbx"
  );
  free(temp);
  return res;
}

long perm_table [8] = {1, 2, 3, 4, 5, 6, 7, 8};

__attribute__((noinline))
long gather_word_avx3(short* src, int* index, int length) {
  long res = 0;
  asm volatile(
    "movq %1, %%rsi \n\t"
    "movq %2, %%rdi \n\t"
    "movq %3, %%r11 \n\t"
    "movl %4, %%ecx \n\t"
    "xorq %%rbx, %%rbx \n\t"
    "vpxorq  %%zmm2, %%zmm2, %%zmm2             \n\t"
    "vpternlogq $0xff, %%zmm2 , %%zmm2, %%zmm3  \n\t"
    "vpsubq %%zmm3, %%zmm2, %%zmm3              \n\t"
    "vmovdqu64 (%%r11), %%zmm4                  \n\t"
    "loop1:                                     \n\t"
    "    vpxorq  %%zmm0, %%zmm0, %%zmm0         \n\t"
    "    movl (%%rdi), %%eax                    \n\t"
    "    pinsrw $0x0, (%%rsi, %%rax, 2), %%xmm0 \n\t"
    "    movl 0x4(%%rdi), %%eax                 \n\t"
    "    pinsrw $0x1, (%%rsi, %%rax, 2), %%xmm0 \n\t"
    "    movl 0x8(%%rdi), %%eax                 \n\t"
    "    pinsrw $0x2, (%%rsi, %%rax, 2), %%xmm0 \n\t"
    "    movl 0xc(%%rdi), %%eax                 \n\t"
    "    pinsrw $0x3, (%%rsi, %%rax, 2), %%xmm0 \n\t"
    "    vpsubq %%zmm3, %%zmm4, %%zmm4          \n\t"
    "    vpermq  %%zmm0, %%zmm4, %%zmm0 \n\t"
    "    vporq   %%zmm0, %%zmm2, %%zmm2 \n\t"  
    "    addq $0x8, %%rbx  \n\t"
    "    addq $0x10, %%rdi \n\t"
    "    subl $0x4, %%ecx  \n\t"
    "    jnz  loop1        \n\t" 
    "movd %%xmm2, %0       \n\t"
    : "=r"(res)
    : "r"(src), "r"(index), "r"(perm_table), "r"(length)
    : "%rax", "%rsi", "%zmm0", "%ecx", "%rdi", "%zmm1", "%zmm2"
  );
  return res;
}

#define SIZE 1024
#define ISIZE 32

int main() {
  long res = 0L;
  short* source = (short*)malloc(SIZE*sizeof(short));
  int* index = (int*)malloc(ISIZE*sizeof(int));
  for (int i = 0; i < SIZE; i++) {
      source[i] = (short)i;
  } 
  for (int i = 0; i < ISIZE; i++) {
      index[i] = i * 32;
  } 
  for (int i = 0; i < 90000000; i++) {
      res += gather_word(source, index, 32);
  }
  auto start = std::chrono::steady_clock::now();
  for (int i = 0; i < 90000000; i++) {
      res += gather_word(source, index, 32);
  }
  auto end = std::chrono::steady_clock::now();
  std::chrono::duration<double> diff = end - start;
  printf("[time] %lf   [res]  %ld\n", diff.count(), res );

  res = 0;
  for (int i = 0; i < 90000000; i++) {
      res += gather_word_avx3(source, index, 32);
  }
  start = std::chrono::steady_clock::now();
  for (int i = 0; i < 90000000; i++) {
      res += gather_word_avx3(source, index, 32);
  }
  end = std::chrono::steady_clock::now();
  diff = end - start;
  printf("[time] %lf   [res]  %ld\n", diff.count(), res );

  free(source);
  free(index);
  return 0;
}
