#include <vector>
#include <iostream>
#include <stdio.h>
#include <numeric>
#include <algorithm>

long loop_imul(long iterations, long* result) {
   long end, start;
   asm volatile (
      "movq $1, %%rcx    \n\t"
      "movq %3, %%rbx    \n\t"
      "mfence            \n\t"
      "rdtsc             \n\t"
      "shlq $32, %%rdx   \n\t" 
      "orq  %%rax, %%rdx \n\t"
      "movq %%rdx, %2    \n\t"
      ".align 32         \n\t"
      "1:                \n\t"
      "  imul $37, %%rcx, %%rax \n\t"
      "  decq %%rbx      \n\t"
      "  jg 1b           \n\t"
      "  movq %%rax, %0  \n\t"
      "mfence            \n\t"
      "rdtsc             \n\t"
      "shlq $32, %%rdx   \n\t" 
      "orq  %%rax, %%rdx \n\t"
      "movq %%rdx, %1    \n\t"
     : "=m"(*result), "=r"(end) , "=r"(start)
     : "r"(iterations)
     : "cc" , "%rax", "%rbx", "%rdx", "%rcx"
   );
   return (end - start);
}

long loop_lea(long iterations, long* result) {
   long end, start;
   asm volatile (
      "movq $1, %%rcx    \n\t"
      "movq %3, %%rbx    \n\t"
      "mfence            \n\t"
      "rdtsc             \n\t"
      "shlq $32, %%rdx   \n\t" 
      "orq  %%rax, %%rdx \n\t"
      "movq %%rdx, %2    \n\t"
      ".align 32         \n\t"
      "1:                \n\t"
      "  leaq (%%rcx, %%rcx, 8), %%rax \n\t"
      "  leaq (%%rcx, %%rax, 4), %%rax \n\t"
      "  decq %%rbx      \n\t"
      "  jg 1b           \n\t"
      "  movq %%rax, %0  \n\t"
      "mfence            \n\t"
      "rdtsc             \n\t"
      "shlq $32, %%rdx   \n\t" 
      "orq  %%rax, %%rdx \n\t"
      "movq %%rdx, %1    \n\t"
     : "=m"(*result), "=r"(end) , "=r"(start)
     : "r"(iterations)
     : "cc" , "%rax", "%rbx", "%rdx", "%rcx"
   );
   return (end - start);
}

long loop_overhead(long iterations, long* result) {
   long end, start;
   asm volatile (
      "movq $1, %%rcx    \n\t"
      "movq %3, %%rbx    \n\t"
      "mfence            \n\t"
      "rdtsc             \n\t"
      "shlq $32, %%rdx   \n\t" 
      "orq  %%rax, %%rdx \n\t"
      "movq %%rdx, %2    \n\t"
      ".align 32         \n\t"
      "1:                \n\t"
      "  decq %%rbx      \n\t"
      "  jg 1b           \n\t"
      "  movq %%rax, %0  \n\t"
      "mfence            \n\t"
      "rdtsc             \n\t"
      "shlq $32, %%rdx   \n\t" 
      "orq  %%rax, %%rdx \n\t"
      "movq %%rdx, %1    \n\t"
     : "=m"(*result), "=r"(end) , "=r"(start)
     : "r"(iterations)
     : "cc" , "%rax", "%rbx", "%rdx", "%rcx"
   );
   return (end - start);
}

typedef long (*func)(long, long*);

double bench_mark(const char* msg, long iterations, func bm_kernel) {
   printf("Warmup .... \n");
   long result;
   long duration;
   for (int i = 0; i < 100; i++) {
      duration = bm_kernel(iterations, &result);
   }
   printf("Measuring : %s \n", msg);
   std::vector<double> time_vector;
   for (int i = 0; i < 50; i++) {
      duration = bm_kernel(iterations, &result);
      time_vector.push_back(duration); 
   }
   std::sort(time_vector.begin(), time_vector.end());
   double avg = std::accumulate(time_vector.begin(), time_vector.end(), 0.0) / time_vector.size();
   printf(" Min:Avg:Max : %lf %lf %lf\n", *time_vector.begin(), avg, time_vector.back());
   return time_vector[time_vector.size() / 2];
}

int main() {
  long iterations = 100000000;
  double over_head = bench_mark("Loop overhead", iterations, loop_overhead);
  double lea = bench_mark("Loop lea", iterations, loop_lea);
  double imul = bench_mark("Loop imul", iterations, loop_imul);
  printf("Latency of LEA : %lf\n", (lea - over_head) / iterations);
  printf("Latency of imul : %lf\n", (imul - over_head) / iterations);
  return 0;
}
