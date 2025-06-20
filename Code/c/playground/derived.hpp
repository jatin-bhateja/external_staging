
#include<base.hpp>

#define MAX_FEATURES 64
   

class Derived : public Base {
  public:
  enum Features :  uint64_t {
     Feature1 = 0,
     Feature2 = 1,
     Feature3 = 2,
     Feature4 = 3,
     Feature5 = 5,
  };
   
  
  Derived(int N) : Base(N) {  }
};

