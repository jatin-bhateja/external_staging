
#include <chrono>
#include <iostream>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Only possible for in-range sub-word predicated vector stores. Since VMASKMOVDQU does not
// suppress memory access violations.
__attribute__((noinline))
void micro1(short* dst, short* src, short* mask, int vlen) {
  asm volatile(
     // On legacy targets mask is propagated through
     // vector register, since all the bits of mask vector
     // lanes either holds a zero or one value hence
     // mask vector corresponding to a short vector can be
     // directly used for byte level operations.
     "vmovdqu %1, %%ymm0              \n\t"
     "vmovdqu %2, %%ymm1              \n\t"
     "vextracti128 $1, %%ymm0, %%xmm2 \n\t"
     "vextracti128 $1, %%ymm1, %%xmm3 \n\t"
     "movq %0, %%rdi                  \n\t"
     "vmaskmovdqu  %%xmm1, %%xmm0     \n\t"
     "addq $16, %%rdi                 \n\t"
     "vmaskmovdqu  %%xmm3, %%xmm2     \n\t"
     "sfence                          \n\t"
    : "+r"(dst)
    : "m"(*src), "m"(*mask) 
    : "%ymm0", "%ymm1", "%xmm2", "%xmm3", "%rdi"
  );
}

__attribute__((noinline))
void micro2(short* dst, short* src, short* mask, int vlen) {
  for(int i = 0; i < vlen; i++) {
    if (mask[i] == -1) {
      dst[i] = src[i];
    }
  }
}

// This is a generic stub emulating sub-word predicated vector store
// operation. Even though stub operates at byte granularity, for 
// short vector we always write consective bytes.
void micro3(short* dst, short* src, short* mask, int vlen) {
   unsigned mask_bits = 0;
   asm volatile (
     "vmovdqu %1, %%ymm0   \n\t"
     "vpmovmskb %%ymm0, %0 \n\t" 
    : "+r"(mask_bits) 
    : "m"(*mask)
    : "%ymm0"
   );
   while(mask_bits) {
      switch(mask_bits & 0xF) {
         case 0: 
         break;
         case 1: 
           asm volatile(
             "movb %1, %%al \n\t"
             "movb %%al, %0 \n\t" 
            : "=m"(*dst)
            : "m"(*src) 
            : "%eax"
           );
         break;
         case 2: 
           asm volatile(
             "movb 0x1(%1), %%al \n\t"
             "movb %%al, 0x1(%0) \n\t" 
            : "=r"(dst)
            : "r"(src) 
            : "%eax"
           );
         break;
         case 3: 
           asm volatile(
             "movw %1, %%ax \n\t"
             "movw %%ax, %0 \n\t" 
            : "=m"(*dst)
            : "m"(*src) 
            : "%eax"
           );
         break;
         case 4: 
           asm volatile(
             "movb 0x2(%1), %%al \n\t"
             "movb %%al, 0x2(%0) \n\t" 
            : "=r"(dst)
            : "r"(src) 
            : "%eax"
           );
         break;
         case 5: 
           asm volatile(
             "movb 0x0(%1), %%al \n\t"
             "movb %%al, 0x0(%0) \n\t" 
             "movb 0x2(%1), %%al \n\t"
             "movb %%al, 0x2(%0) \n\t" 
            : "=r"(dst)
            : "r"(src) 
            : "%eax"
           );
         break;
         case 6: 
           asm volatile(
             "movw 0x1(%1), %%ax \n\t"
             "movw %%ax, 0x1(%0) \n\t" 
            : "=r"(dst)
            : "r"(src) 
            : "%eax"
           );
         break;
         case 7: 
           asm volatile(
             "movw 0x0(%1), %%ax \n\t"
             "movw %%ax, 0x0(%0) \n\t" 
             "movb 0x2(%1), %%al \n\t"
             "movb %%al, 0x2(%0) \n\t" 
            : "=r"(dst)
            : "r"(src) 
            : "%eax"
           );
         break;
         case 8: 
           asm volatile(
             "movb 0x3(%1), %%al \n\t"
             "movb %%al, 0x3(%0) \n\t" 
            : "=r"(dst)
            : "r"(src) 
            : "%eax"
           );
         break;
         case 9: 
           asm volatile(
             "movb 0x0(%1), %%al \n\t"
             "movb %%al, 0x0(%0) \n\t" 
             "movb 0x3(%1), %%al \n\t"
             "movb %%al, 0x3(%0) \n\t" 
            : "=r"(dst)
            : "r"(src) 
            : "%eax"
           );
         break;
         case 10: 
           asm volatile(
             "movb 0x1(%1), %%al \n\t"
             "movb %%al, 0x1(%0) \n\t" 
             "movb 0x3(%1), %%al \n\t"
             "movb %%al, 0x3(%0) \n\t" 
            : "=r"(dst)
            : "r"(src) 
            : "%eax"
           );
         break;
         case 11: 
           asm volatile(
             "movw 0x0(%1), %%ax \n\t"
             "movw %%ax, 0x0(%0) \n\t" 
             "movb 0x3(%1), %%al \n\t"
             "movb %%al, 0x3(%0) \n\t" 
            : "=r"(dst)
            : "r"(src) 
            : "%eax"
           );
         break;
         case 12: 
           asm volatile(
             "movw 0x2(%1), %%ax \n\t"
             "movw %%ax, 0x2(%0) \n\t" 
            : "=r"(dst)
            : "r"(src) 
            : "%eax"
           );
         break;
         case 13: 
           asm volatile(
             "movb 0x0(%1), %%al \n\t"
             "movb %%al, 0x0(%0) \n\t" 
             "movw 0x2(%1), %%ax \n\t"
             "movw %%ax, 0x2(%0) \n\t" 
            : "=r"(dst)
            : "r"(src) 
            : "%eax"
           );
         break;
         case 14: 
           asm volatile(
             "movw 0x1(%1), %%ax \n\t"
             "movw %%ax, 0x1(%0) \n\t" 
             "movb 0x3(%1), %%al \n\t"
             "movb %%al, 0x3(%0) \n\t" 
            : "=r"(dst)
            : "r"(src) 
            : "%eax"
           );
         break;
         default: 
           asm volatile(
             "movl 0x0(%1), %%eax \n\t"
             "movl %%eax, 0x0(%0) \n\t" 
            : "=r"(dst)
            : "r"(src) 
            : "%eax"
           );
         break;
      }
      mask_bits >>= 4; 
      dst += 2;
      src += 2;
   }
}

// Stub optimized for ShortVector, special cases takes into
// consideration that short lane is composed of pair of consective
// bytes, thus corresponding mask will have two consective bit values
// set.
// 00000000
// 11000000
// 00110000
// 11110000
// 00001100
// 11001100
void micro4(short* dst, short* src, short* mask, int vlen) {
   unsigned mask_bits = 0;
   short stack[32];
   short* stack_ptr = stack;
   asm volatile(
     "vmovdqu %1, %%ymm0 \n\t"
     "vmovdqu %%ymm0, %0 \n\t"
    : "=m"(*stack_ptr)
    : "m"(*src)
    : "%ymm0"
   );
               
   asm volatile (
     "vmovdqu %1, %%ymm0   \n\t"
     "vpmovmskb %%ymm0, %0 \n\t" 
    : "+r"(mask_bits) 
    : "m"(*mask)
    : "%ymm0"
   );
   unsigned compressed_mask_bits = 0;
   unsigned compressed_mask_pattern = 0x55555555;
   asm volatile (
     "pextl %2, %1, %0 \n\t"
    : "=r"(compressed_mask_bits)
    : "r"(mask_bits) , "r"(compressed_mask_pattern)
    :
   );
   while(compressed_mask_bits) {
      switch(compressed_mask_bits & 0xF) {
         case 0: 
         break;
         case 1: 
           asm volatile(
             "movw %1, %%ax \n\t"
             "movw %%ax, %0 \n\t" 
            : "=m"(*dst)
            : "m"(*stack_ptr) 
            : "%eax"
           );
         break;
         case 2: 
           asm volatile(
             "movw 0x2(%1), %%ax \n\t"
             "movw %%ax, 0x2(%0) \n\t" 
            : "=r"(dst)
            : "r"(stack_ptr) 
            : "%eax"
           );
         break;
         case 3: 
           asm volatile(
             "movl %1, %%eax \n\t"
             "movl %%eax, %0 \n\t" 
            : "=m"(*dst)
            : "m"(*stack_ptr) 
            : "%eax"
           );
         break;
         case 4: 
           asm volatile(
             "movw 0x4(%1), %%ax \n\t"
             "movw %%ax, 0x4(%0) \n\t" 
            : "=r"(dst)
            : "r"(stack_ptr) 
            : "%eax"
           );
         break;
         case 5: 
           asm volatile(
             "movw 0x0(%1), %%ax \n\t"
             "movw %%ax, 0x0(%0) \n\t" 
             "movw 0x4(%1), %%ax \n\t"
             "movw %%ax, 0x4(%0) \n\t" 
            : "=r"(dst)
            : "r"(stack_ptr) 
            : "%eax"
           );
         break;
         case 6: 
           asm volatile(
             "movl 0x2(%1), %%eax \n\t"
             "movl %%eax, 0x2(%0) \n\t" 
            : "=r"(dst)
            : "r"(stack_ptr) 
            : "%eax"
           );
         break;
         case 7: 
           asm volatile(
             "movl 0x0(%1), %%eax \n\t"
             "movl %%eax, 0x0(%0) \n\t" 
             "movw 0x4(%1), %%ax \n\t"
             "movw %%ax, 0x4(%0) \n\t" 
            : "=r"(dst)
            : "r"(stack_ptr) 
            : "%eax"
           );
         break;
         case 8: 
           asm volatile(
             "movw 0x6(%1), %%ax \n\t"
             "movw %%ax, 0x6(%0) \n\t" 
            : "=r"(dst)
            : "r"(stack_ptr) 
            : "%eax"
           );
         break;
         case 9: 
           asm volatile(
             "movw 0x0(%1), %%ax \n\t"
             "movw %%ax, 0x0(%0) \n\t" 
             "movw 0x6(%1), %%ax \n\t"
             "movw %%ax, 0x6(%0) \n\t" 
            : "=r"(dst)
            : "r"(stack_ptr) 
            : "%eax"
           );
         break;
         case 10: 
           asm volatile(
             "movw 0x2(%1), %%ax \n\t"
             "movw %%ax, 0x2(%0) \n\t" 
             "movw 0x6(%1), %%ax \n\t"
             "movw %%ax, 0x6(%0) \n\t" 
            : "=r"(dst)
            : "r"(stack_ptr) 
            : "%eax"
           );
         break;
         case 11: 
           asm volatile(
             "movl 0x0(%1), %%eax \n\t"
             "movl %%eax, 0x0(%0) \n\t" 
             "movw 0x6(%1), %%ax \n\t"
             "movw %%ax, 0x6(%0) \n\t" 
            : "=r"(dst)
            : "r"(stack_ptr) 
            : "%eax"
           );
         break;
         case 12: 
           asm volatile(
             "movl 0x4(%1), %%eax \n\t"
             "movl %%eax, 0x4(%0) \n\t" 
            : "=r"(dst)
            : "r"(stack_ptr) 
            : "%eax"
           );
         break;
         case 13: 
           asm volatile(
             "movw 0x0(%1), %%ax \n\t"
             "movw %%ax, 0x0(%0) \n\t" 
             "movl 0x4(%1), %%eax \n\t"
             "movl %%eax, 0x4(%0) \n\t" 
            : "=r"(dst)
            : "r"(stack_ptr) 
            : "%eax"
           );
         break;
         case 14: 
           asm volatile(
             "movw 0x2(%1), %%ax \n\t"
             "movw %%ax, 0x2(%0) \n\t" 
             "movl 0x4(%1), %%eax \n\t"
             "movl %%eax, 0x4(%0) \n\t" 
            : "=r"(dst)
            : "r"(stack_ptr) 
            : "%eax"
           );
         break;
         default: 
           asm volatile(
             "movq 0x0(%1), %%rax \n\t"
             "movq %%rax, 0x0(%0) \n\t" 
            : "=r"(dst)
            : "r"(stack_ptr) 
            : "%rax"
           );
         break;
      }
      compressed_mask_bits >>= 8; 
      dst += 8;
      stack_ptr += 8;
   }
}

long accumSum(short* arr, int len) {
  long res = 0;
  for (int i = 0; i < len; i++) {
    res += arr[i];
  }
  return res;
}

int main(int argc, char* argv[]) {
  if (argc != 3) {
     return fprintf(stderr, "Incorrect Arguments! <app> <arr_len> <algo 0{vector}/1{scalar}>\n");
  }
  int len = atoi(argv[1]); 
  short* src = new short[len];
  short* dst = new short[len];
  memset(src, -1,sizeof(short)*len);

  short* mask = new short[len];
  for (int i = 0; i < len; i++) {
     if (i % 3 == 0) {
        mask[i] = -1;
     }
  } 

  int algo = atoi(argv[2]);
  if (algo == 0 || algo == -1) {
    for (int i = 0; i < 100000; i++) {
      for (int i = 0; i < len; i += 16) {
        micro1(dst + i, src + i, mask + i, 16);
      }
    }
    auto start = std::chrono::system_clock::now();
    for (int i = 0; i < 100000; i++) {
      for (int i = 0; i < len; i += 16) {
        micro1(dst + i, src + i, mask + i, 16);
      }
    }
    auto end = std::chrono::system_clock::now();
    std::chrono::duration<double> cycles = end - start;
    std::cout << "[time micro0] " << cycles.count() <<  "  [res]  " << accumSum(dst, len) << std::endl;
  } 
  if (algo == 1 || algo == -1) {
    for (int i = 0; i < 100000; i++) {
      for (int i = 0; i < len; i += 16) {
        micro2(dst + i, src + i, mask + i, 16);
      }
    }
    auto start = std::chrono::system_clock::now();
    for (int i = 0; i < 100000; i++) {
      for (int i = 0; i < len; i += 16) {
        micro2(dst + i, src + i, mask + i, 16);
      }
    }
    auto end = std::chrono::system_clock::now();
    std::chrono::duration<double> cycles = end - start;
    std::cout << "[time micro2] " << cycles.count() <<  "  [res]  " << accumSum(dst, len) << std::endl;

  }
  if (algo == 2 || algo == -1) {
    for (int i = 0; i < 100000; i++) {
      for (int i = 0; i < len; i += 16) {
        micro3(dst + i, src + i, mask + i, 16);
      }
    }
    auto start = std::chrono::system_clock::now();
    for (int i = 0; i < 100000; i++) {
      for (int i = 0; i < len; i += 16) {
        micro3(dst + i, src + i, mask + i, 16);
      }
    }
    auto end = std::chrono::system_clock::now();
    std::chrono::duration<double> cycles = end - start;
    std::cout << "[time micro3] " << cycles.count() <<  "  [res]  " << accumSum(dst, len) << std::endl;

  }
  if (algo == 3 || algo == -1) {
    for (int i = 0; i < 100000; i++) {
      for (int i = 0; i < len; i += 16) {
        micro4(dst + i, src + i, mask + i, 16);
      }
    }
    auto start = std::chrono::system_clock::now();
    for (int i = 0; i < 100000; i++) {
      for (int i = 0; i < len; i += 16) {
        micro4(dst + i, src + i, mask + i, 16);
      }
    }
    auto end = std::chrono::system_clock::now();
    std::chrono::duration<double> cycles = end - start;
    std::cout << "[time micro4] " << cycles.count() <<  "  [res]  " << accumSum(dst, len) << std::endl;

  }
  return 0;
}
