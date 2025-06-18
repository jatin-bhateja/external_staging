
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <chrono>

#define PAYLOAD_16B \
  float fld1;   \
  float fld2;   \
  float fld3;   \
  float fld4;

typedef struct _value_class16B {
  PAYLOAD_16B;
} value_class16B; 

#define OFFSET_OF(TYPE, FIELD) \
  ((int64_t)(&(((TYPE*)(0))->FIELD)))

#define PRINT(...) \
  fprintf(stdout, __VA_ARGS__)

void atomic_field_update(value_class16B* src, value_class16B* dst) {
  asm volatile (

  );
}

int main() {
  PRINT("OFFSET_OF value_class16B.fld1 = %ld\n", OFFSET_OF(value_class16B, fld1)); 
  PRINT("OFFSET_OF value_class16B.fld2 = %ld\n", OFFSET_OF(value_class16B, fld2)); 
  PRINT("OFFSET_OF value_class16B.fld3 = %ld\n", OFFSET_OF(value_class16B, fld3)); 
  PRINT("OFFSET_OF value_class16B.fld4 = %ld\n", OFFSET_OF(value_class16B, fld4)); 

  return 0; 
}
