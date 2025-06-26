#include <stdio.h>
#include <alloca.h>
#include <stdlib.h>
#include <string.h>
#include <chrono>

__attribute__((noinline))
long gather_byte_masked(char* src, int* index, int length, int mask) {
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
    "  bt   %%edx, %5                \n\t"
    "  jnb  loop_incr                \n\t"
    "  movl (%%rbx, %%rdx, 4), %%eax \n\t"
    "  movb (%%rsi, %%rax, 1), %%al  \n\t"
    "  movb %%al, (%%rdi, %%rdx, 1)  \n\t"
    "  loop_incr:                    \n\t"
    "  incl %%edx                    \n\t"
    "  decl %%ecx                    \n\t"
    "  jnz loop                      \n\t"
    "vmovdqu64  (%%rdi), %%zmm0        \n\t"
    "movq %%xmm0, %0  \n\t"
    : "=r"(res)
    : "r"(src), "r"(temp), "r"(index), "r"(length), "r"(mask)
    : "%rax", "%rsi", "%xmm0", "%ecx", "%rdi", "%rdx", "%rbx"
  );
  free(temp);
  return res;
}

int perm_table [16] = {0, 1, 2, 3, 4 ,5 ,6 ,7, 8, 9, 10, 11, 12, 13, 14, 15};
int round_table [16] = {1, 1, 1, 1, 1 ,1 ,1 ,1, 1, 1, 1, 1, 1, 1, 1, 1};

__attribute__((noinline))
long gather_move_byte_avx2_masked(char* src, int* index, int length, int mask) {
  long res = 0;
  asm volatile(
    "movq %1, %%rsi \n\t"
    "movq %2, %%rdi \n\t"
    "movq %3, %%r11 \n\t"
    "movq %4, %%r9  \n\t"
    "movl %5, %%ecx \n\t"
    "xorq %%rdx, %%rdx \n\t"
    "vpxorq  %%zmm2, %%zmm2, %%zmm2             \n\t"
    "vmovdqu64 (%%r11), %%zmm1                  \n\t"
    "vmovdqu64 (%%r9), %%zmm4                   \n\t"
    "vpaddb  %%zmm4, %%zmm4, %%zmm4             \n\t"
    "loop1:                                     \n\t"
    "    vpxorq  %%zmm0, %%zmm0, %%zmm0         \n\t"
    "    bt %%edx , %6                          \n\t"
    "    jnb loop_incr0                         \n\t"
    "    movl (%%rdi), %%eax                    \n\t"
    "    pinsrb $0x0, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    loop_incr0:                            \n\t"
    "    incl %%edx                             \n\t"
    "    bt %%edx , %6                          \n\t"
    "    jnb loop_incr1                         \n\t"
    "    movl 0x4(%%rdi), %%eax                 \n\t"
    "    pinsrb $0x1, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    loop_incr1:                            \n\t"
    "    incl %%edx                             \n\t"
    "    bt %%edx , %6                          \n\t"
    "    jnb loop_incr2                         \n\t"
    "    movl 0x8(%%rdi), %%eax                 \n\t"
    "    pinsrb $0x2, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    loop_incr2:                            \n\t"
    "    incl %%edx                             \n\t"
    "    bt %%edx , %6                          \n\t"
    "    jnb loop_incr3                         \n\t"
    "    movl 0xc(%%rdi), %%eax                 \n\t"
    "    pinsrb $0x3, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    loop_incr3:                            \n\t"
    "    incl %%edx                             \n\t"
    "    bt %%edx , %6                          \n\t"
    "    jnb loop_incr4                         \n\t"
    "    movl 0x10(%%rdi), %%eax                \n\t"
    "    pinsrb $0x4, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    loop_incr4:                            \n\t"
    "    incl %%edx                             \n\t"
    "    bt %%edx , %6                          \n\t"
    "    jnb loop_incr5                         \n\t"
    "    movl 0x14(%%rdi), %%eax                \n\t"
    "    pinsrb $0x5, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    loop_incr5:                            \n\t"
    "    incl %%edx                             \n\t"
    "    bt %%edx , %6                          \n\t"
    "    jnb loop_incr6                         \n\t"
    "    movl 0x18(%%rdi), %%eax                \n\t"
    "    pinsrb $0x6, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    loop_incr6:                            \n\t"
    "    incl %%edx                             \n\t"
    "    bt %%edx , %6                          \n\t"
    "    jnb loop_incr7                         \n\t"
    "    movl 0x1C(%%rdi), %%eax                \n\t"
    "    pinsrb $0x7, (%%rsi, %%rax, 1), %%xmm0 \n\t"
    "    loop_incr7:                            \n\t"
    "    incl %%edx                             \n\t"
    "    vpermd  %%zmm0, %%zmm1, %%zmm0         \n\t"
    "    vpsubd  %%zmm4, %%zmm1, %%zmm1         \n\t"
    "    vporq   %%zmm0, %%zmm2, %%zmm2         \n\t"  
    "    addq $0x20, %%rdi \n\t"
    "    subl $0x4, %%ecx  \n\t"
    "    jnz  loop1        \n\t" 
    "movd %%xmm2, %0       \n\t"
    : "=r"(res)
    : "r"(src), "r"(index), "r"(perm_table), "r"(round_table), "r"(length), "r"(mask)
    : "%r11", "%rdx", "%r9", "%rax", "%rsi", "%zmm0", "%ecx", "%rdi", "%zmm1", "%zmm2", "%zmm3", "%zmm4", "%zmm5"
  );
  return res;
}

#define SIZE 4096
#define ISIZE 64

int main() {
  long res = 0L;
  char* source = (char*)malloc(SIZE);
  int* index = (int*)malloc(ISIZE*sizeof(int));
  int mask = 0x5555;
  for (int i = 0; i < SIZE; i++) {
      source[i] = (char)i;
  } 
  for (int i = 0; i < ISIZE; i++) {
      index[i] = i * 64;
  } 
  for (int i = 0; i < 90000000; i++) {
      res += gather_byte_masked(source, index, 64, mask);
  }
  auto start = std::chrono::steady_clock::now();
  for (int i = 0; i < 90000000; i++) {
      res += gather_byte_masked(source, index, 64, mask);
  }
  auto end = std::chrono::steady_clock::now();
  std::chrono::duration<double> diff = end - start;
  printf("[time] %lf   [res]  %ld\n", diff.count(), res );

  res = 0;
  for (int i = 0; i < 90000000; i++) {
      res += gather_move_byte_avx2_masked(source, index, 32, mask);
  }
  start = std::chrono::steady_clock::now();
  for (int i = 0; i < 90000000; i++) {
      res += gather_move_byte_avx2_masked(source, index, 32, mask);
  }
  end = std::chrono::steady_clock::now();
  diff = end - start;
  printf("[time] %lf   [res]  %ld\n", diff.count(), res);

  free(source);
  free(index);
  return 0;
}
