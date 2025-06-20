#include <stdio.h>
#include <alloca.h>
#include <stdlib.h>
#include <string.h>
#include <chrono>

__attribute__((noinline))
long gather_byte(char* src, int* index, int length) {
  long res = 0;
  char* temp = (char*)malloc(length);  // To mimic allocation in Java implimentation.
  memset(temp, 0, length);
  asm volatile(
    "movq %1, %%rsi \n\t"
    "movq %2, %%rdi \n\t"
    "movq %3, %%rbx \n\t"
    "movl %4, %%ecx \n\t"
    "xorq %%rdx, %%rdx \n\t"
    "loop:          \n\t"
    "  movl (%%rbx, %%rdx, 4), %%eax \n\t"
    "  movb (%%rsi, %%rax, 1), %%al  \n\t"
    "  movb %%al, (%%rdi, %%rdx, 1)  \n\t"
    "  incl %%edx                    \n\t"
    "  decl %%ecx                    \n\t"
    "  jnz loop                      \n\t"
    "vmovdqu64  (%%rdi), %%zmm0        \n\t"
    "movq %%xmm0, %0  \n\t"
    : "=r"(res)
    : "r"(src), "r"(temp), "r"(index), "r"(length)
    : "%rax", "%rsi", "%xmm0", "%ecx", "%rdi", "%rdx", "%rbx"
  );
  free(temp);
  return res;
}

int perm_table [16] = {1, 2, 3, 4, 5 ,6 ,7 ,8, 9, 10, 11, 12, 13, 14, 15, 16};
int round_table [16] = {1, 1, 1, 1, 1 ,1 ,1 ,1, 1, 1, 1, 1, 1, 1, 1, 1};

__attribute__((noinline))
long gather_move_byte_avx2(char* src, int* index, int length) {
  long res = 0;
  asm volatile(
    "movq %1, %%rsi \n\t"
    "movq %2, %%rdi \n\t"
    "movq %3, %%r11 \n\t"
    "movq %4, %%r9  \n\t"
    "movl %5, %%ecx \n\t"
    "vpxorq  %%zmm2, %%zmm2, %%zmm2              \n\t"
    "vmovdqu64 (%%r11), %%zmm3                    \n\t"
    "vpaddd  %%zmm3, %%zmm3, %%zmm5             \n\t"
    "vmovdqu64 (%%r9), %%zmm4                     \n\t"
    "loop1:                                     \n\t"
    "    vpxorq  %%zmm0, %%zmm0, %%zmm0         \n\t"
    "    movl (%%rdi), %%eax                    \n\t"
    "    pinsrb $0x0, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    movl 0x4(%%rdi), %%eax                 \n\t"
    "    pinsrb $0x1, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    movl 0x8(%%rdi), %%eax                 \n\t"
    "    pinsrb $0x2, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    movl 0xc(%%rdi), %%eax                 \n\t"
    "    pinsrb $0x3, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    movl 0x10(%%rdi), %%eax                \n\t"
    "    pinsrb $0x4, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    movl 0x14(%%rdi), %%eax                \n\t"
    "    pinsrb $0x5, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    movl 0x18(%%rdi), %%eax                \n\t"
    "    pinsrb $0x6, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    movl 0x1C(%%rdi), %%eax                \n\t"
    "    pinsrb $0x7, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    movl 0x20(%%rdi), %%eax                \n\t"
    "    pinsrb $0x8, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    vpsubd  %%zmm4, %%zmm3, %%zmm1         \n\t"
    "    vpermd  %%zmm0, %%zmm1, %%zmm0 \n\t"
    "    vpaddd  %%zmm5, %%zmm4, %%zmm4 \n\t"
    "    vporq   %%zmm0, %%zmm2, %%zmm2 \n\t"  
    "    addq $0x20, %%rdi \n\t"
    "    subl $0x4, %%ecx  \n\t"
    "    jnz  loop1        \n\t" 
    "movd %%xmm2, %0       \n\t"
    : "=r"(res)
    : "r"(src), "r"(index), "r"(perm_table), "r"(round_table), "r"(length)
    : "%r9", "%rax", "%rsi", "%zmm0", "%ecx", "%rdi", "%zmm1", "%zmm2", "%zmm3", "%zmm4", "%zmm5"
  );
  return res;
}

#define SIZE 4096
#define ISIZE 64

int main() {
  long res = 0L;
  char* source = (char*)malloc(SIZE);
  int* index = (int*)malloc(ISIZE*sizeof(int));
  for (int i = 0; i < SIZE; i++) {
      source[i] = (char)i;
  } 
  for (int i = 0; i < ISIZE; i++) {
      index[i] = i * 64;
  } 
  for (int i = 0; i < 90000000; i++) {
      res += gather_byte(source, index, 64);
  }
  auto start = std::chrono::steady_clock::now();
  for (int i = 0; i < 90000000; i++) {
      res += gather_byte(source, index, 64);
  }
  auto end = std::chrono::steady_clock::now();
  std::chrono::duration<double> diff = end - start;
  printf("[time] %lf   [res]  %ld\n", diff.count(), res );

  res = 0;
  for (int i = 0; i < 90000000; i++) {
      res += gather_move_byte_avx2(source, index, 32);
  }
  start = std::chrono::steady_clock::now();
  for (int i = 0; i < 90000000; i++) {
      res += gather_move_byte_avx2(source, index, 32);
  }
  end = std::chrono::steady_clock::now();
  diff = end - start;
  printf("[time] %lf   [res]  %ld\n", diff.count(), res);

  free(source);
  free(index);
  return 0;
}
