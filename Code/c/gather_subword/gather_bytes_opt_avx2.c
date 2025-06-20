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
    "vmovdqu  (%%rdi), %%ymm0        \n\t"
    "movq %%xmm0, %0  \n\t"
    : "=r"(res)
    : "r"(src), "r"(temp), "r"(index), "r"(length)
    : "%rax", "%rsi", "%xmm0", "%ecx", "%rdi", "%rdx", "%rbx"
  );
  free(temp);
  return res;
}

int perm_table [16] = {0, 1, 2, 3, 4 ,5 ,6 ,7, 8, 9, 10, 11, 12, 13, 14, 15};
int round_table [16] = {2, 2, 2, 2, 2 ,2 ,2 ,2, 2, 2, 2, 2, 2, 2, 2, 2};

__attribute__((noinline))
long gather_move_byte_avx2(char* src, int* index, int length) {
  long res = 0;
  asm volatile(
    "movq %1, %%rsi \n\t"
    "movq %2, %%rdi \n\t"
    "movq %3, %%r11 \n\t"
    "movq %4, %%r9  \n\t"
    "movl %5, %%ecx \n\t"
    "vpxor  %%ymm2, %%ymm2, %%ymm2              \n\t"
    "vmovdqu (%%r11), %%ymm3                    \n\t"
    "vmovdqu (%%r9), %%ymm4                     \n\t"
    "loop1:                                     \n\t"
    "    vpxorq  %%ymm0, %%ymm0, %%ymm0         \n\t"
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
    "    vpsubd  %%ymm4, %%ymm3, %%ymm1         \n\t"
    "    vpermd  %%ymm0, %%ymm1, %%ymm0 \n\t"
    "    vporq   %%ymm0, %%ymm2, %%ymm2 \n\t"  
    "    addq $0x20, %%rdi \n\t"
    "    subl $0x4, %%ecx  \n\t"
    "    jnz  loop1        \n\t" 
    "movd %%xmm2, %0       \n\t"
    : "=r"(res)
    : "r"(src), "r"(index), "r"(perm_table), "r"(round_table), "r"(length)
    : "%r9", "%rax", "%rsi", "%ymm0", "%ecx", "%rdi", "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%ymm5"
  );
  return res;
}


__attribute__((noinline))
long gather_byte_alt(char* src, int* index, int length) {
  long res = 0;
  asm volatile(
    "movq %1, %%rsi \n\t"
    "movq %2, %%rdi \n\t"
    "movq %3, %%r11 \n\t"
    "movq %4, %%r9  \n\t"
    "movl %5, %%ecx \n\t"
    "vpxor  %%ymm2, %%ymm2, %%ymm2              \n\t"
    "vpxor  %%ymm8, %%ymm8, %%ymm8              \n\t"
    "vmovdqu (%%r11), %%ymm6                    \n\t"
    "vmovdqu (%%r9), %%ymm7                     \n\t"
    "vpcmpeqd  %%ymm1, %%ymm1, %%ymm1           \n\t"
    "loop2:                                     \n\t"
    "    vpxorq   %%ymm0, %%ymm0, %%ymm0        \n\t"
    "    vmovdqu  %%ymm1, %%ymm5                \n\t"
    "    vmovdqu  (%%rdi), %%ymm0               \n\t"
    "    vpsrld   $2,     %%ymm0, %%ymm0        \n\t"
    "    vpgatherdd %%ymm5, (%%rsi, %%ymm0), %%ymm2 \n\t" 
    "    vpsrld    $30,    %%ymm1, %%ymm4 \n\t"
    "    vpandd    %%ymm4, %%ymm0, %%ymm0 \n\t"
    "    vpsrlvd    %%ymm0, %%ymm2, %%ymm2 \n\t"
    "    vpsrld    $24,    %%ymm1, %%ymm4 \n\t"
    "    vpandd    %%ymm4, %%ymm2, %%ymm2 \n\t"
    "    vextracti128  $1, %%ymm2, %%xmm0 \n\t"
    "    vpackusdw %%ymm0, %%ymm2, %%ymm4 \n\t"     
    "    vpackuswb %%ymm0, %%ymm4, %%ymm3 \n\t"
    "    vpermd  %%ymm3, %%ymm6, %%ymm0 \n\t"
    "    vpsubd  %%ymm7, %%ymm6, %%ymm6 \n\t"
    "    vporq   %%ymm0, %%ymm8, %%ymm8 \n\t"  
    "    addq $0x20, %%rdi \n\t"
    "    subl $0x4, %%ecx  \n\t"
    "    jnz  loop2        \n\t" 
    "movd %%xmm2, %0       \n\t"
    : "=r"(res)
    : "r"(src), "r"(index), "r"(perm_table), "r"(round_table), "r"(length)
    : "%r9", "%rax", "%rsi", "%ymm0", "%ecx", "%rdi", "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%ymm5", "%ymm6", "%ymm7"
  );
  return res;
}

#if 0
long gather_byte_alt(char* src, int* index, int length) {
  long res = 0;
   asm volatile(
      "movq      %1,     %%rsi          \n\t"
      "movq      %2,     %%rax          \n\t"
      "vpcmpeqd  %%ymm1, %%ymm1, %%ymm1 \n\t"
      "vmovdqu   %%ymm1, %%ymm5         \n\t"
      "vmovdqu   (%%rax), %%ymm0        \n\t"
      "vpsrld    $2,     %%ymm0, %%ymm0 \n\t"
      "vpgatherdd %%ymm5, (%%rsi, %%ymm0), %%ymm2 \n\t" 
      "vpsrld    $30,    %%ymm1, %%ymm4 \n\t"
      "vpandd    %%ymm4, %%ymm0, %%ymm0 \n\t"
      "vpsrlvd    %%ymm0, %%ymm2, %%ymm2 \n\t"
      "vpsrld    $24,    %%ymm1, %%ymm4 \n\t"
      "vpandd    %%ymm4, %%ymm2, %%ymm2 \n\t"
      "vextracti128  $1, %%ymm2, %%xmm0 \n\t"
      "vpackusdw %%ymm0, %%ymm2, %%ymm4 \n\t"     
      "vpackuswb %%ymm0, %%ymm4, %%ymm3 \n\t"
      "addq      $32,    %%rax          \n\t"
      "vmovdqu   %%ymm1, %%ymm5         \n\t"
      "vmovdqu   (%%rax), %%ymm0        \n\t"
      "vpsrld    $2,     %%ymm0, %%ymm0 \n\t"
      "vpgatherdd %%ymm5, (%%rsi, %%ymm0), %%ymm2 \n\t" 
      "vpsrld    $30,    %%ymm1, %%ymm4 \n\t"
      "vpandd    %%ymm4, %%ymm0, %%ymm0 \n\t"
      "vpsrlvd    %%ymm0, %%ymm2, %%ymm2 \n\t"
      "vpsrld    $24,    %%ymm1, %%ymm4 \n\t"
      "vpandd    %%ymm4, %%ymm2, %%ymm2 \n\t"
      "vextracti128  $1, %%ymm2, %%xmm0 \n\t"
      "vpackusdw %%ymm0, %%ymm2, %%ymm4 \n\t"     
      "vpackuswb %%ymm0, %%ymm4, %%ymm1 \n\t"
      "movq      %%xmm1, %0             \n\t"
      "vpinsrq   $1, %0, %%xmm3, %%xmm3 \n\t"
      "movq %%xmm3 , %0                 \n\t"
    : "+r"(res)
    : "r"(src), "r"(index), "r"(length)
    : "%rsi", "%ymm0", "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%ymm5"
  );
  return res;
}
#endif

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
      res += gather_byte(source, index, 16);
  }
  auto start = std::chrono::steady_clock::now();
  for (int i = 0; i < 90000000; i++) {
      res += gather_byte(source, index, 16);
  }
  auto end = std::chrono::steady_clock::now();
  std::chrono::duration<double> diff = end - start;
  printf("[time scalar] %lf   [res]  %ld\n", diff.count(), res );

  res = 0;
  for (int i = 0; i < 90000000; i++) {
      res += gather_byte_alt(source, index, 16);
  }
  start = std::chrono::steady_clock::now();
  for (int i = 0; i < 90000000; i++) {
      res += gather_byte_alt(source, index, 16);
  }
  end = std::chrono::steady_clock::now();
  diff = end - start;
  printf("[time gather alt] %lf   [res]  %ld\n", diff.count(), res);

  res = 0;
  for (int i = 0; i < 90000000; i++) {
      res += gather_move_byte_avx2(source, index, 16);
  }
  start = std::chrono::steady_clock::now();
  for (int i = 0; i < 90000000; i++) {
      res += gather_move_byte_avx2(source, index, 16);
  }
  end = std::chrono::steady_clock::now();
  diff = end - start;
  printf("[time gather] %lf   [res]  %ld\n", diff.count(), res);

  free(source);
  free(index);
  return 0;
}
