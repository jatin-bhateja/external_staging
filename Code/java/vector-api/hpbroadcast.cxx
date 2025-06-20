
#include <iostream>
#include <chrono>

int micro1() {
  int ret = 0;
  asm volatile (
     "movl $1, %%eax \n\t"
     "movd %%eax, %%xmm1 \n\t"
     "vpbroadcastd %%xmm1, %%ymm1 \n\t"
     "vpextrd $1, %%xmm1, %0 \n\t"
     : "=r"(ret)
     : : "%eax", "%ymm1"
  );
  return ret;
}

int micro2() {
  int ret = 0;
  asm volatile (
     "vpcmpeqd %%ymm1, %%ymm1, %%ymm1 \n\t"
     "vpsrld $31, %%ymm1, %%ymm1 \n\t"
     "vpextrd $1, %%xmm1, %0 \n\t"
     : "=r"(ret)
     : : "%ymm1"
  );
  return ret;
}

int main() {
  int res = 0;
  auto start = std::chrono::steady_clock::now();
  for(int i = 0; i < 999999999; i++) {
     res += micro1();
  }
  auto end = std::chrono::steady_clock::now();
  std::chrono::duration<double> diff = end - start;
  std::cout << "[time] " << diff.count() << "s  [res] " <<  res << std::endl;

  res = 0;
  start = std::chrono::steady_clock::now();
  for(int i = 0; i < 999999999; i++) {
     res += micro2();
  }
  end = std::chrono::steady_clock::now();
  diff = end - start;
  std::cout << "[time] " << diff.count() << "s  [res] " <<  res << std::endl;
  return 0;
}
