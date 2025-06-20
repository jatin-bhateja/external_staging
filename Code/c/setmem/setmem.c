
#include "stdint.h"

void SetMemory(char value, int size, int* dst) {
  long fill = (long)(value); 
  if (fill != 0) {
    fill += fill << 8;
    fill += fill << 16;
    fill += fill << 32;
  }
  for (uintptr_t off = 0; off < size; off += sizeof(long)) {
    *(long*)(dst + off) = fill;
  }
}
