#include <iostream>

class A {
private:
  friend class B;
  friend class C;
  int _val;
  A() = default;
  A(int val) : _val(val) {}
public:
  int getVal() { return _val;}
};

class B : public A {
private:
  friend class C;
  B() = default;
  B(int val) : A(val) {}  
};

class C {
public:
  static B* allocateB(int val) { return new B(val);} 
};

int main() {
  std::cout << C::allocateB(10)->getVal() << std::endl;
}
