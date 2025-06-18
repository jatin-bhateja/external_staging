
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <iostream>
#include <chrono>

#define PAYLOAD_8B \
  float fld1;   \
  float fld2; 

typedef struct _value_class8B {
  PAYLOAD_8B;
} value_class8B; 

#define OFFSET_OF(TYPE, FIELD) \
  ((int64_t)(&(((TYPE*)(0))->FIELD)))

#define PRINT(...) \
  fprintf(stdout, __VA_ARGS__)

// Values are immutable and not subjected to data races.
void atomic_field_update(value_class8B* src, value_class8B* dst) {
  asm volatile (
     // Assemble first two floating point fields into %%r11
     "vmovd  %1, %%r10d         \n\t"
     "vmovd  %2, %%r11d         \n\t" 
     "movslq %%r11d, %%r11      \n\t"
     "shlq   $32, %%r11         \n\t"
     "orq    %%r10, %%r11       \n\t"
     "movq   %%r11, %0          \n\t"
    : "+m"(*dst)
    : "x"(src->fld1), "x"(src->fld2)
    : "cc" , "%r11" 
  );
}

__attribute((aligned(8)))
value_class8B src = {1.0f, 2.0f};  
__attribute((aligned(8)))
value_class8B dst = {10.0f, 20.0f};    


void print_value_object(const char* msg, value_class8B obj) {
  std::cout << msg << obj.fld1 << " , " << obj.fld2 << std::endl;
}


int main() {
  print_value_object("[src]  " , src);
  print_value_object("[dst before atomic update]  " , dst);

  atomic_field_update(&src, &dst);

  print_value_object("[dst after atomic update]  " , dst);
  return 0; 
}
