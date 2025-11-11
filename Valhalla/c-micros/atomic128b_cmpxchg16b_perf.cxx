
//
// Double-quadword atomic vs non-atomic field update performance.
//

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <iostream>
#include <chrono>
#include <assert.h>

#define PAYLOAD_16B \
  float fld1;   \
  float fld2;   \
  float fld3;   \
  float fld4;

class value_flat_class16B {
public:
  PAYLOAD_16B;
  value_flat_class16B& operator += (const value_flat_class16B& obj) {
    this->fld1 += obj.fld1;
    this->fld2 += obj.fld2;
    this->fld3 += obj.fld3;
    this->fld4 += obj.fld4;
    return *this;
  }
}; 

class payload16b {
public:
  PAYLOAD_16B
};

class value_class16B {
public:
  payload16b* _payload;
};

class HeapAllocator {
private:
  int64_t _size;
  int32_t _align;
  char* _mem;
  char* _bump_ptr;
public:
  HeapAllocator(int64_t size, int32_t align) {
    _size = size;
    _align = align;
    _mem = (char*)aligned_alloc(align, size);
    memset(_mem, 0, size);
    _bump_ptr = _mem;
  }

  template<typename TYPE>
  TYPE get_mem(int64_t size) {
    if ((size + _bump_ptr) > (_size + _mem)) {
      std::cerr << "out of memory!" << std::endl;
      return nullptr;
    }
    char* mem = _bump_ptr;
    _bump_ptr += size;
    return reinterpret_cast<TYPE>(mem);
  }

  void reset_mem() {
    _bump_ptr = _mem;
  }
};

#define OFFSET_OF(TYPE, FIELD) \
  ((int64_t)(&(((TYPE*)(0))->FIELD)))

#define PRINT(...) \
  fprintf(stdout, __VA_ARGS__)

typedef void (*atomic_update_api)(value_flat_class16B* src, value_flat_class16B* dst);
atomic_update_api atomic_api = nullptr;

// Values are immutable and not subjected to data races.
void atomic_field_update1(value_flat_class16B* src, value_flat_class16B* dst) {
  asm volatile (
    "vmovdqu  %1, %%xmm0        \n\t"
    "vpslldq  $4, %2, %%xmm1    \n\t" 
    "vpslldq  $8, %3, %%xmm2    \n\t" 
    "vpslldq  $12, %4, %%xmm3   \n\t" 
    "vorps  %%xmm0, %%xmm1, %%xmm0 \n\t"
    "vorps  %%xmm0, %%xmm2, %%xmm0 \n\t"
    "vorps  %%xmm0, %%xmm3, %%xmm0 \n\t"
    "movdqa %%xmm0, %0    \n\t"    
    : "=m"(*dst)
    : "x"(src->fld1), "x"(src->fld2) , "x"(src->fld3), "x"(src->fld4)
    : "cc" , "%xmm0", "%xmm1", "%xmm2", "%xmm3" 
  );
}

// Values are immutable and not subjected to data races.
void atomic_field_update2(value_flat_class16B* src, value_flat_class16B* dst) {
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
     // Load recent most dst contents into RDX:RAX
     "loop:                     \n\t"
     "movq %0,  %%rdi           \n\t"
     "movq 0x0(%%rdi) , %%rax   \n\t"
     "movq 0x8(%%rdi) , %%rdx   \n\t"
     // If RDX:RAX holds same value as destination, then update destination
     // atomically with RCX:RBX. Loopback and re-attempt.
     "lock cmpxchg16b 0x0(%%rdi)     \n\t"
     "jnz loop                  \n\t"
     "done:                     \n\t"
    : "+m"(dst)
    : "x"(src->fld1), "x"(src->fld2) , "x"(src->fld3), "x"(src->fld4)
    : "cc" , "%r10", "%r11" , "%rbx", "%rdx", "%rcx", "%rax", "%rdi"
  );
}

// Values are immutable and not subjected to data races.
void atomic_field_update3(value_flat_class16B* src, value_flat_class16B* dst) {
  asm volatile (
    // Assemble first two floating point fields into RBX
    "vmovdqu  %1, %%xmm0           \n\t"
    "vpslldq  $4, %2, %%xmm1       \n\t" 
    "vpslldq  $8, %3, %%xmm2       \n\t" 
    "vpslldq  $12, %4, %%xmm3      \n\t" 
    "vorps  %%xmm0, %%xmm1, %%xmm0 \n\t"
    "vorps  %%xmm0, %%xmm2, %%xmm0 \n\t"
    "vorps  %%xmm0, %%xmm3, %%xmm0 \n\t"
    "vmovq  %%xmm0, %%rbx          \n\t"
    // Assemble next two floating point fields into RCX
    "vpextrq $1, %%xmm0, %%rcx      \n\t"
    // Load recent most dst contents into RDX:RAX
    "loop0:                     \n\t"
    "movq %0,  %%rdi           \n\t"
    "movq 0x0(%%rdi) , %%rax   \n\t"   
    "movq 0x8(%%rdi) , %%rdx   \n\t"   
    // If RDX:RAX holds same value as destination, then update destination
    // atomically with RCX:RBX. Loopback and re-attempt.
    "lock cmpxchg16b 0x0(%%rdi)     \n\t"
    "jnz loop0                  \n\t"
    "done0:                     \n\t"
    : "+m"(dst)
    : "x"(src->fld1), "x"(src->fld2) , "x"(src->fld3), "x"(src->fld4)
    : "cc" , "%xmm0", "%xmm1", "%xmm2", "%xmm3", "%rbx", "%rdx", "%rcx", "%rax", "%rdi" 
  );
}

__attribute((aligned(16)))
value_flat_class16B src = {1.0f, 2.0f, 3.0f, 4.0f};  
__attribute((aligned(16)))
value_flat_class16B dst = {10.0f, 20.0f, 30.0f, 40.0f};    

HeapAllocator* alloc = nullptr;
#define ONE_M 10000000

void print_value_object(const char* msg, value_flat_class16B obj) {
  std::cout << msg << "{ " << obj.fld1 << " , " << obj.fld2 << " , " << obj.fld3 << " , " << obj.fld4 << " }" << std::endl;
}

value_flat_class16B* allocate_1_million_flat_payload_values(float f1, float f2, float f3, float f4) {
  assert(alloc != nullptr);
  value_flat_class16B* mem = alloc->get_mem<value_flat_class16B*>(sizeof(value_flat_class16B)*ONE_M);
  value_flat_class16B src;
  src.fld1 = f1;
  src.fld2 = f2;
  src.fld3 = f3;
  src.fld4 = f4;
  for (int64_t i = 0; i < ONE_M; i++) {
    value_flat_class16B* obj = (value_flat_class16B*)((((char*)mem) + sizeof(value_flat_class16B) * i));
    atomic_api(&src, obj);
  }
  return mem;
}

value_class16B* allocate_1_million_payload_values(float  f1, float f2, float f3, float f4) {
  assert(alloc != nullptr);
  value_class16B* mem = alloc->get_mem<value_class16B*>(sizeof(value_class16B)*ONE_M);
  for (int64_t i = 0; i < ONE_M; i++) {
    payload16b* payload = alloc->get_mem<payload16b*>(sizeof(payload16b));
    payload->fld1 = f1;
    payload->fld2 = f2;
    payload->fld3 = f3;
    payload->fld4 = f4;
    mem[i]._payload = payload;
  }
  return mem;
}

value_flat_class16B accumulate_flat_blob(value_flat_class16B* mem) {
  value_flat_class16B res = {0.0f, 0.0f, 0.0f, 0.0f};
  for (int64_t i = 0; i < ONE_M; i++) {
    value_flat_class16B* obj = (value_flat_class16B*)((((char*)mem) + sizeof(value_flat_class16B) * i));
    res.fld1 += obj->fld1;
    res.fld2 += obj->fld2;
    res.fld3 += obj->fld3;
    res.fld4 += obj->fld4;
  }
  return res;
}


value_flat_class16B accumulate_blob(value_class16B* mem) {
  value_flat_class16B res = {0.0f, 0.0f, 0.0f, 0.0f};
  for (int64_t i = 0; i < ONE_M; i++) {
    value_class16B* obj = (value_class16B*)((((char*)mem) + sizeof(value_class16B) * i));
    res.fld1 += obj->_payload->fld1;
    res.fld2 += obj->_payload->fld2;
    res.fld3 += obj->_payload->fld3;
    res.fld4 += obj->_payload->fld4;
  }
  return res;
}

#define ITER 100
#define WITER 100

void micro(int32_t algo) {
  if (algo == 0 || algo == -1) {
    value_flat_class16B res = {0.0f, 0.0f, 0.0f, 0.0f};
    for (int32_t i = 0; i < WITER; i++) {
      value_flat_class16B* flat_mem = allocate_1_million_flat_payload_values((float)i, ((float)i+1), ((float)i+2), ((float)i+3));
      res += accumulate_flat_blob(flat_mem);
      alloc->reset_mem();
    }
    auto start = std::chrono::high_resolution_clock::now();
    for (int32_t i = 0; i < ITER; i++) {
      value_flat_class16B* flat_mem = allocate_1_million_flat_payload_values((float)i, ((float)i+1), ((float)i+2), ((float)i+3));
      res += accumulate_flat_blob(flat_mem);
      alloc->reset_mem();
    }
    auto end = std::chrono::high_resolution_clock::now();
    auto time_diff = std::chrono::duration<double>(end - start);
    std::cout << "[time] " << time_diff.count() << " s ";
    print_value_object("[res flat payload] ", res);
  }

  if (algo == 1 || algo == -1) {
    assert(alloc != nullptr);
    alloc->reset_mem();
    value_flat_class16B res2 = {0.0f, 0.0f, 0.0f, 0.0f};
    for (int32_t i = 0; i < WITER; i++) {
      value_class16B* mem = allocate_1_million_payload_values((float)i, ((float)i+1), ((float)i+2), ((float)i+3));
      res2 += accumulate_blob(mem);
      alloc->reset_mem();
    }
    auto start = std::chrono::high_resolution_clock::now();
    for (int32_t i = 0; i < ITER; i++) {
      value_class16B* mem = allocate_1_million_payload_values((float)i, ((float)i+1), ((float)i+2), ((float)i+3));
      res2 += accumulate_blob(mem);
      alloc->reset_mem();
    }
    auto end = std::chrono::high_resolution_clock::now();
    auto time_diff = std::chrono::duration<double>(end - start);
    std::cout << "[time] " << time_diff.count() << " ms ";
    print_value_object("[res payload] ", res2);
    alloc->reset_mem();
  }
}

int main(int argc, char* argv[]) {
  if (argc != 3) {
    std::cerr << "Incorrect Arguments! <app> <algo=0,1,-1> <atomic_api=0,1,2>" << std::endl;
    return -1;
  }

  int atomic_api_level = atoi(argv[2]);
  if (atomic_api_level == 0) {
    atomic_api = atomic_field_update1;
  } else if (atomic_api_level == 1) {
    atomic_api = atomic_field_update2;
  } else {
    atomic_api = atomic_field_update3;
  }

  alloc = new HeapAllocator((sizeof(value_flat_class16B) + sizeof(void*))*ONE_M, 64);
  micro(atoi(argv[1]));
  return 0; 
}
