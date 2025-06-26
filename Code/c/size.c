
#include <stdio.h>
#include <limits.h>

int main() {
  printf("__WORDSIZE = %d\n", __WORDSIZE);
  return printf("LONG_MAX = %lld\n", LLONG_MAX);
}
