
#include <iostream>
#include <stdint.h>

enum Feature : uint64_t {
  F1 = 0,
  F2 = 1
};

#define SET_FLAG(feature, f)            \
  do {                                  \
    feature = (Feature)(1ULL << f);     \
  } while(0)

Feature operator & (Feature f1, Feature f2) {
   Feature f;
   SET_FLAG(f, f1);  
   SET_FLAG(f, f2);  
   return f;
}

int main() {
  Feature f = F1 & F2;
  std::cout << " Feature =  " << f << std::endl;   
  return 0;
}

