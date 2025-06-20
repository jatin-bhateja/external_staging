
#include <iostream>
#include <stdio.h>
#include <type_traits>

// Explicit RTTI.

class Base;

template <typename T1, typename T2> bool compile_isa(T2 *obj) {
  return std::is_same<T1, T2>();
}

template <typename T1> bool runtime_isa(Base *obj) {
  return obj->checkRTTI(T1::getRTTI());
}

class Base {
public:
  Base() : _RTTI('B') {}
  Base(char R) : _RTTI(R) {}

  static char getRTTI() { return 'B'; }
  bool checkRTTI(char R) { return _RTTI == R; }

  char _RTTI;
};

class Dummy : public Base {
public:
  Dummy() : Base('d') {}
  static char getRTTI() { return 'd'; }
};

class Dummy1 : public Base {
public:
  Dummy1() : Base('D') {}
  Dummy1(char R) : Base(R) {}
  static char getRTTI() { return 'D'; }
  void print() { std::cout << __PRETTY_FUNCTION__ << std::endl; }
};

class Dummy1_C : public Dummy1 {
public:
  Dummy1_C() : Dummy1('C') {}
  static char getRTTI() { return 'C'; }
  void print() { std::cout << __PRETTY_FUNCTION__ << std::endl; }
};

int main() {
  Dummy obj;
  Dummy1_C *cobj = new Dummy1_C();
  Dummy1 *pobj = cobj;
  std::cout << compile_isa<Dummy>(&obj) << std::endl;
  std::cout << compile_isa<Dummy1>(cobj) << std::endl;
  std::cout << compile_isa<Dummy1_C>(pobj) << std::endl;

  std::cout << runtime_isa<Dummy>(&obj) << std::endl;
  std::cout << runtime_isa<Dummy1>(cobj) << std::endl;
  std::cout << runtime_isa<Dummy1_C>(pobj) << std::endl;
  return 0;
}
