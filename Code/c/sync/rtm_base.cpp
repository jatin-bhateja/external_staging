

#include <stdio.h>
#include <iostream>
#include <string.h>
#include <chrono>

extern "C"
void _fault() {
  std::cout << "Contention detected" << std::endl;
}

int no_contention(int* mem, int length) {
  int res = 0;
  asm volatile("xbegin _fault \n\t" : : : );
  res += mem[length];
  asm volatile(
      "xend              \n\t"
   : : : );
   return res;
}

int main() {
  int res = 0;
  int* mem = new int[1024];
  memset(mem, sizeof(int)*1024, 1); 
  auto start = std::chrono::steady_clock::now();
  for (int i = 0; i < 1000000000; i++) {
     res += no_contention(mem, i & 1023); 
  }
  auto end = std::chrono::steady_clock::now();
  std::chrono::duration<double> diff = end - start;
  diff = end - start;
  return printf("[no_contention (time) %lf  [Res] %d\n" , diff.count(), res);
}
