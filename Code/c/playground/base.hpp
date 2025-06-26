
#include <stdint.h>
#include <iostream>

class VM_Features {
  public:
    static constexpr uint32_t N;
    uint64_t _array[N];

  VM_Features(int N) {
    this.N = N;
    std::cout << "sizeof _array = " << sizeof(_array)/sizeof(uint64_t) << std::endl;
  }
}; 

class Base {
  public:
  uint32_t N;
  VM_Features _features(N);

  Base(int N) { this.N = N;}
};
