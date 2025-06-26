
#include <iostream>

class VM_Features {
   private:
      static constexpr uint64_t _feature_vector_size = 4;
      uint64_t _feature_vector[_feature_vector_size];
      const char* _feature_names[_feature_vector_size * 64];

   public:
      VM_Features () {
         for (int i = 0; i < _feature_vector_size; i++) {
            _feature_vector[i] = 0;
         }
      }

      void set_feature(uint64_t feature) {
        _feature_vector[feature >> 6] |= (1ULL << (feature & 63));
      }
    
      void set_feature(uint64_t feature, const char* feature_string) {
        _feature_vector[feature >> 6] |= (1ULL << (feature & 63));
        _feature_names[feature] = feature_string;
      }

      // Utility routines.
      void operator + (uint64_t feature);
      void operator - (uint64_t feature);
      VM_Features   operator |  (VM_Features features);
      void          operator |= (VM_Features features);

      void vm_initialize();

      void dumpFeatures() {
       std::cout << std::endl;
       for (int i = 0; i < _feature_vector_size; i++) {
         uint64_t features = _feature_vector[i];
         while(features) {
           uint64_t feature = -1L;
           asm volatile ("bsfq %1, %0    \n\t"
                         "blsrq %1, %1   \n\t"
                         : "=r"(feature) , "+r"(features) : : "cc");
           feature += i * 64;
           std::cout << "Feature => " << feature << " : " << _feature_names[feature] << std::endl;
         }
       }
     }
};

#define CPU_FEATURES(DECL_FEATURE)          \
  DECL_FEATURE(CPU_AVX,          "avx",        0)   \
  DECL_FEATURE(CPU_AVX2,         "avx2",       1)   \
  DECL_FEATURE(CPU_AVX512,       "avx512",     2)   \
  DECL_FEATURE(CPU_AVX512F,      "avx512f",    3)   \
  DECL_FEATURE(CPU_AVX512VL,     "avx512VL",   4)   \
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

enum Features : uint64_t {
#define DECL_FEATURE(name, string, id) \
  name = id,
CPU_FEATURES(DECL_FEATURE)
#undef DECL_FEATURE
};

void VM_Features::vm_initialize() {
#define DECL_FEATURE(name, string, id) \
  set_feature(id, string);
CPU_FEATURES(DECL_FEATURE);
#undef DECL_FEATURE
}

void VM_Features::operator |= (VM_Features features) {
   for (int i = 0; i < _feature_vector_size; i++) {
      _feature_vector[i] |= features._feature_vector[i];
   }
}

VM_Features VM_Features::operator | (VM_Features features) {
   VM_Features result;
   for (int i = 0; i < _feature_vector_size; i++) {
      result._feature_vector[i] = _feature_vector[i] | features._feature_vector[i];
   }
   return result;
}

void VM_Features::operator + (uint64_t feature) {
   for (int i = 0; i < _feature_vector_size; i++) {
      _feature_vector[feature >> 6] |= 1L << (feature & 63);
   }
}

void VM_Features::operator - (uint64_t feature) {
   for (int i = 0; i < _feature_vector_size; i++) {
      _feature_vector[feature >> 6] &= ~(1L << (feature & 63));
   }
}

int main() {
   VM_Features cpu_features;
   cpu_features.vm_initialize();
   cpu_features.dumpFeatures();
   cpu_features - CPU_AVX512F;
   cpu_features.dumpFeatures();
   
   VM_Features cpu_features_aux;
   cpu_features_aux = cpu_features;
   cpu_features_aux + CPU_AVX512F;
   cpu_features_aux.dumpFeatures(); 
   
   cpu_features |= cpu_features_aux;
   cpu_features.dumpFeatures();
   return 0;   
}
