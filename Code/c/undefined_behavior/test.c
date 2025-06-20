#include <stdint.h>

int64_t microUB() {
  return (int64_t)((1ULL << 63) - 1);
}

int main() {
  microUB();
  return 0;
}

