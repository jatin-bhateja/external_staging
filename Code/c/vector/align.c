
#include "stdalign.h"

int myint = 1;
char mychar[] __attribute__((aligned(64))) = {'a','b','c','d','e','f'};

int main() {
  char mychar_local[] __attribute__((aligned(16))) = {'a','b','c','d','e','f'};
  alignas(64) double mydouble_local2[] = {1.2,1.2,1.2};
  return (int)mychar_local[4];
}

