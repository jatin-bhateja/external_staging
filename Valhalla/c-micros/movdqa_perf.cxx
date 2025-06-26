
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <iostream>
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

// Values are immutable and not subjected to data races.
void atomic_field_update(value_class16B* src, value_class16B* dst) {
  asm volatile (
     // Assemble first two floating point fields into RBX
     "vmovd  %1, %%r10d         \n\t"
     "vmovd  %2, %%r11d         \n\t" 
     "movslq %%r11d, %%r11      \n\t"
     "shlq   $32, %%r11         \n\t"
     "orq  %%r10, %%r11         \n\t"
     "movq %%r11, %%rbx         \n\t"
     // Assemble next two floating point fields into RCX
     "vmovd  %3, %%r10d         \n\t"
     "vmovd  %4, %%r11d         \n\t" 
     "movslq %%r11d, %%r11      \n\t"
     "shlq   $32, %%r11         \n\t"
     "orq  %%r10, %%r11         \n\t"
     "movq %%r11, %%rcx         \n\t"
     // Move RBX and RCX to lower and upper quadword of 128bit XMM register.
     "vpinsrq $0, %%rbx, %%xmm0, %%xmm0 \n\t"
     "vpinsrq $1, %%rcx, %%xmm0, %%xmm0 \n\t"
     "movdqa %%xmm0, %0         \n\t"
    : "+m"(*dst)
    : "x"(src->fld1), "x"(src->fld2) , "x"(src->fld3), "x"(src->fld4)
    : "cc" , "%r10", "%r11" , "%rbx", "%rdx", "%rcx", "%rax", "%rdi" 
  );
}

__attribute((aligned(16)))
value_class16B dst = {10.0f, 20.0f, 30.0f, 40.0f};    
__attribute((aligned(16)))
value_class16B src = {1.0f, 2.0f, 3.0f, 4.0f};  


void print_value_object(const char* msg, value_class16B obj) {
  std::cout << msg << obj.fld1 << " , " << obj.fld2 << " , " << obj.fld3 << " , " << obj.fld4  << std::endl;
}


int main() {
  print_value_object("[src]  " , src);
  print_value_object("[dst before atomic update]  " , dst);

  atomic_field_update(&src, &dst);

  print_value_object("[dst after atomic update]  " , dst);
  return 0; 
}
