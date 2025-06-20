#include <iostream>
#include <assert.h>

class CPUFeatures {
private:
  uint64_t*    _features;
  uint64_t     _features_array_size;
  const char** _features_string;

public:
  CPUFeatures(uint64_t features_array_size = 1) {
    _features_array_size = features_array_size;
    _features = new uint64_t[_features_array_size];
    _features_string = new const char*[features_array_size*64];
  }
    
  void set_feature(uint64_t feature) {
    _features[feature >> 6] |= (1ULL << (feature & 63));
  }

  void set_feature(uint64_t feature, const char* feature_string) {
    _features[feature >> 6] |= (1ULL << (feature & 63));
    _features_string[feature] = feature_string;
  }

  bool supports_feature(uint64_t feature) {
    return (_features[feature >> 6] & (1ULL << (feature & 63))) != 0;
  }

  void clear_feature(uint64_t feature) {
    _features[feature >> 6] &= ~(1ULL << (feature & 63));
  }

  void dumpFeatures() {
    for (int i = 0; i < _features_array_size; i++) {
      uint64_t features = _features[i];
      while(features) {
        uint64_t feature = -1L;
        asm volatile ("bsfq %1, %0    \n\t"
                      "blsrq %1, %1   \n\t"
                      : "=r"(feature) , "+r"(features) : : "cc");
        feature += i * 64;
        std::cout << "Feature => " << feature << " : " << _features_string[feature] << std::endl;
      }
    }
  }
};

#define CPU_FEATURES(DECL_FEATURE)          \
  DECL_FEATURE(CPU_AVX,          "avx",        0)   \
  DECL_FEATURE(CPU_AVX2,         "avx2",       1)   \
  DECL_FEATURE(CPU_AVX512,       "avx512",     2)   \
  DECL_FEATURE(CPU_AVX512F,      "avx512f",    3)   \
  DECL_FEATURE(CPU_AVX512VL,     "avx512f",    4)   \
  DECL_FEATURE(CPU_AVX512BW,     "avx512bw",   5)   \
  DECL_FEATURE(CPU_AVX512DQ,     "avx512dq",   6)   \
  DECL_FEATURE(CPU_AVX512VBMI,   "avx512vbmi", 7)   \
  DECL_FEATURE(CPU_AVX512IFMA,   "avx512ifma", 8)   \
  DECL_FEATURE(CPU_AVX10_1,      "avx10.1",    65)  \
  DECL_FEATURE(CPU_AVX10_2,      "avx10.2",    66)  \
  DECL_FEATURE(CPU_AVX10_3,      "avx10.3",    166) \
  DECL_FEATURE(CPU_AVX10_4,      "avx10.4",    167) \
  DECL_FEATURE(CPU_AVX10_5,      "avx10.5",    168) \
  DECL_FEATURE(CPU_AVX10_6,      "avx10.6",    169) \
  DECL_FEATURE(CPU_AVX10_7,      "avx10.7",    170) \

#define MAX_FEATURE_ID 166

enum Features : uint64_t {
#define DECL_FEATURE(name, string, id) \
  name = id,
CPU_FEATURES(DECL_FEATURE)
#undef DECL_FEATURE
};

CPUFeatures vm_initialize() {
  CPUFeatures vm_features((MAX_FEATURE_ID >> 6) + 1); 
#define DECL_FEATURE(name, string, id) \
  vm_features.set_feature(id, string);
CPU_FEATURES(DECL_FEATURE);
#undef DECL_FEATURE
  return vm_features;
}

int main(int argc, char* argv[]) {
  CPUFeatures vm_features = vm_initialize();
  vm_features.dumpFeatures();
  assert(vm_features.supports_feature(CPU_AVX512VL) && "Unsupported CPU_AVX512VL");
  return 0;
}
