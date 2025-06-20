
#include <chrono>
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>

__attribute__((noinline))
void micro_byte(char* dst, char* src, long length) {
   asm volatile(
      "movq %1, %%rsi \n\t"
      "movq %2, %%rcx \n\t"
      "movq %0, %%rdi \n\t"
      "rep movsb       \n\t"
    : "+r"(dst)
    : "r"(src), "r"(length)
    : "%rsi", "%rdi", "%rcx"
   );
}

__attribute__((noinline))
void micro_doubleword(int* dst, int* src, long length) {
   asm volatile(
      "movq %1, %%rsi \n\t"
      "movq %2, %%rcx \n\t"
      "movq %0, %%rdi \n\t"
      "rep movsl       \n\t"
    : "+r"(dst)
    : "r"(src), "r"(length)
    : "%rsi", "%rdi", "%rcx"
   );
}

__attribute__((noinline))
void micro_quadword(long* dst, long* src, long length) {
   asm volatile(
      "movq %1, %%rsi \n\t"
      "movq %2, %%rcx \n\t"
      "movq %0, %%rdi \n\t"
      "rep movsq       \n\t"
    : "+r"(dst)
    : "r"(src), "r"(length)
    : "%rsi", "%rdi", "%rcx"
   );
}

__attribute__((noinline))
void micro_vec(char* dst, char* src, long length) {
   char* iter_src = src;
   char* iter_dst = dst;
   for (int i = 0; i < length; i += 256, iter_dst += 256, iter_src += 256) {
     asm volatile(
        "movq %1, %%rsi \n\t"
        "movq %0, %%rdi \n\t"
        "vmovdqu64 (%%rsi), %%zmm1  \n\t"
        "vmovdqu64 0x40(%%rsi), %%zmm1  \n\t"
        "vmovdqu64 0x80(%%rsi), %%zmm1  \n\t"
        "vmovdqu64 0xC0(%%rsi), %%zmm1  \n\t"
        "vmovdqu64 %%zmm1, (%%rdi)  \n\t"
        "vmovdqu64 %%zmm1, 0x40(%%rdi)  \n\t"
        "vmovdqu64 %%zmm1, 0x80(%%rdi)  \n\t"
        "vmovdqu64 %%zmm1, 0xC0(%%rdi)  \n\t"
      : "+r"(iter_dst)
      : "r"(iter_src)
      : "%rsi", "%rdi", "%zmm1"
     );
   }
}


long accum(char* dst, int length) {
  long res = 0;
  for (int i = 0; i < length; i++) {
    res += dst[i];
  }
  return res;
}

int ITER = 1000000;

int main(int argc, char *argv[]) {
   if (argc != 3) {
      std::cerr << "Incorrect Arguments!: ./copy <algo> <length> " << std::endl;
      return -1;
   }

   int algo = atoi(argv[1]);
   int size = atoi(argv[2]);
   assert (size > 0 && ((size & 0x1F) == 0) && "Size must be multiple of 32");

   char* src = static_cast<char*>(aligned_alloc(32, size));
   memset(src, -1, size);
   char* dst = static_cast<char*>(aligned_alloc(32, size));

   if (algo == 0 || algo == -1) {
     memset(dst, 0, size);
     for(int i = 0; i < ITER; i++) {
        micro_byte(dst, src, size);
     }

     auto start = std::chrono::system_clock::now();
     for(int i = 0; i < ITER; i++) {
        micro_byte(dst, src, size);
     }
     auto stop = std::chrono::system_clock::now();
     std::chrono::duration<double> diff = stop - start;
     std::cout << "[time micro_byte] "  << diff.count() <<  "  [res] " << accum(dst,size) << std::endl;
   }

   if (algo == 1 || algo == -1) {
     memset(dst, 0, size);
     for(int i = 0; i < ITER; i++) {
        micro_doubleword(reinterpret_cast<int*>(dst), reinterpret_cast<int*>(src), size/4);
     }

     auto start = std::chrono::system_clock::now();
     for(int i = 0; i < ITER; i++) {
        micro_doubleword(reinterpret_cast<int*>(dst), reinterpret_cast<int*>(src), size/4);
     }
     auto stop = std::chrono::system_clock::now();
     std::chrono::duration<double> diff = stop - start;
     std::cout << "[time micro_doubleword] "  << diff.count() <<  "  [res] " << accum(dst,size) << std::endl;
   }

   if (algo == 2 || algo == -1) {
     memset(dst, 0, size);
     for(int i = 0; i < ITER; i++) {
        micro_quadword(reinterpret_cast<long*>(dst), reinterpret_cast<long*>(src), size/8);
     }

     auto start = std::chrono::system_clock::now();
     for(int i = 0; i < ITER; i++) {
        micro_quadword(reinterpret_cast<long*>(dst), reinterpret_cast<long*>(src), size/8);
     }
     auto stop = std::chrono::system_clock::now();
     std::chrono::duration<double> diff = stop - start;
     std::cout << "[time micro_quadword] "  << diff.count() <<  "  [res] " << accum(dst,size) << std::endl;
   }

   if (algo == 3 || algo == -1) {
     memset(dst, 0, size);
     for(int i = 0; i < ITER; i++) {
        micro_vec(dst, src, size);
     }

     auto start = std::chrono::system_clock::now();
     for(int i = 0; i < ITER; i++) {
        micro_vec(dst, src, size);
     }
     auto stop = std::chrono::system_clock::now();
     std::chrono::duration<double> diff = stop - start;
     std::cout << "[time micro_vec] "  << diff.count() <<  "  [res] " << accum(dst,size) << std::endl;
   }
}
