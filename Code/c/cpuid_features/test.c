#include <stdio.h>
#include <iostream>
#include <stdint.h>
#include <chrono>

enum Features : uint64_t {
  FEATURE0 = 0,
  FEATURE1 = 1,
  FEATURE2 = 2,
  FEATURE3 = 3,
  FEATURE4 = 4,
  FEATURE5 = 5,
  FEATURE6 = 6,
  FEATURE7 = 7,
  FEATURE8 = 8,
  FEATURE9 = 9,
  FEATURE10 = 10,
  FEATURE11 = 11,
  FEATURE12 = 12,
  FEATURE13 = 13,
  FEATURE14 = 14,
  FEATURE15 = 15,
  FEATURE16 = 16,
  FEATURE17 = 17,
  FEATURE18 = 18,
  FEATURE19 = 19,
  FEATURE20 = 20,
  FEATURE21 = 21,
  FEATURE22 = 22,
  FEATURE23 = 23,
  FEATURE24 = 24,
  FEATURE25 = 25,
  FEATURE26 = 26,
  FEATURE27 = 27,
  FEATURE28 = 28,
  FEATURE29 = 29,
  FEATURE30 = 30,
  FEATURE31 = 31,
  FEATURE32 = 32,
  FEATURE33 = 33,
  FEATURE34 = 34,
  FEATURE35 = 35,
  FEATURE36 = 36,
  FEATURE37 = 37,
  FEATURE38 = 38,
  FEATURE39 = 39,
  FEATURE40 = 40,
  FEATURE41 = 41,
  FEATURE42 = 42,
  FEATURE43 = 43,
  FEATURE44 = 44,
  FEATURE45 = 45,
  FEATURE46 = 46,
  FEATURE47 = 47,
  FEATURE48 = 48,
  FEATURE49 = 49,
  FEATURE50 = 50,
  FEATURE51 = 51,
  FEATURE52 = 52,
  FEATURE53 = 53,
  FEATURE54 = 54,
  FEATURE55 = 55,
  FEATURE56 = 56,
  FEATURE57 = 57,
  FEATURE58 = 58,
  FEATURE59 = 59,
  FEATURE60 = 60,
  FEATURE61 = 61,
  FEATURE62 = 62,
  FEATURE63 = 63,
  FEATURE64 = 64,
  FEATURE65 = 65,
  FEATURE66 = 66,
  FEATURE67 = 67,
  FEATURE68 = 68,
  FEATURE69 = 69,
};


enum Features_Opt: uint64_t {
  OPT_FEATURE0 = 1ULL << 0,
  OPT_FEATURE1 = 1ULL << 1,
  OPT_FEATURE2 = 1ULL << 2,
  OPT_FEATURE3 = 1ULL << 3,
  OPT_FEATURE4 = 1ULL << 4,
  OPT_FEATURE5 = 1ULL << 5,
  OPT_FEATURE6 = 1ULL << 6,
  OPT_FEATURE7 = 1ULL << 7,
  OPT_FEATURE8 = 1ULL << 8,
  OPT_FEATURE9 = 1ULL << 9,
  OPT_FEATURE10 = 1ULL << 10,
  OPT_FEATURE11 = 1ULL << 11,
  OPT_FEATURE12 = 1ULL << 12,
  OPT_FEATURE13 = 1ULL << 13,
  OPT_FEATURE14 = 1ULL << 14,
  OPT_FEATURE15 = 1ULL << 15,
  OPT_FEATURE16 = 1ULL << 16,
  OPT_FEATURE17 = 1ULL << 17,
  OPT_FEATURE18 = 1ULL << 18,
  OPT_FEATURE19 = 1ULL << 19,
  OPT_FEATURE20 = 1ULL << 20,
  OPT_FEATURE21 = 1ULL << 21,
  OPT_FEATURE22 = 1ULL << 22,
  OPT_FEATURE23 = 1ULL << 23,
  OPT_FEATURE24 = 1ULL << 24,
  OPT_FEATURE25 = 1ULL << 25,
  OPT_FEATURE26 = 1ULL << 26,
  OPT_FEATURE27 = 1ULL << 27,
  OPT_FEATURE28 = 1ULL << 28,
  OPT_FEATURE29 = 1ULL << 29,
  OPT_FEATURE30 = 1ULL << 30,
  OPT_FEATURE31 = 1ULL << 31,
  OPT_FEATURE32 = 1ULL << 32,
  OPT_FEATURE33 = 1ULL << 33,
  OPT_FEATURE34 = 1ULL << 34,
  OPT_FEATURE35 = 1ULL << 35,
  OPT_FEATURE36 = 1ULL << 36,
  OPT_FEATURE37 = 1ULL << 37,
  OPT_FEATURE38 = 1ULL << 38,
  OPT_FEATURE39 = 1ULL << 39,
  OPT_FEATURE40 = 1ULL << 40,
  OPT_FEATURE41 = 1ULL << 41,
  OPT_FEATURE42 = 1ULL << 42,
  OPT_FEATURE43 = 1ULL << 43,
  OPT_FEATURE44 = 1ULL << 44,
  OPT_FEATURE45 = 1ULL << 45,
  OPT_FEATURE46 = 1ULL << 46,
  OPT_FEATURE47 = 1ULL << 47,
  OPT_FEATURE48 = 1ULL << 48,
  OPT_FEATURE49 = 1ULL << 49,
  OPT_FEATURE50 = 1ULL << 50,
  OPT_FEATURE51 = 1ULL << 51,
  OPT_FEATURE52 = 1ULL << 52,
  OPT_FEATURE53 = 1ULL << 53,
  OPT_FEATURE54 = 1ULL << 54,
  OPT_FEATURE55 = 1ULL << 55,
  OPT_FEATURE56 = 1ULL << 56,
  OPT_FEATURE57 = 1ULL << 57,
  OPT_FEATURE58 = 1ULL << 58,
  OPT_FEATURE59 = 1ULL << 59,
  OPT_FEATURE60 = 1ULL << 60,
  OPT_FEATURE61 = 1ULL << 61,
  OPT_FEATURE62 = 1ULL << 62,
  OPT_FEATURE63 = 1ULL << 63,
};

uint64_t _features_opt = 0xFFFFFFFFFFFFFFFFL;

#define MAX_FEATURE_WORD 2
uint64_t _features[MAX_FEATURE_WORD] = {0xFFFFFFFFFFFFFFFFL, 0xFFFFFFFFFFFFFFFFL};

void set_feature_opt(uint64_t feature) {
  _features_opt |= feature;
}

uint64_t check_feature_opt(uint64_t feature) {
  return _features_opt & feature;
}

void set_feature(uint64_t feature) {
  _features[feature >> 8] |= (feature & 63);
}

uint64_t check_feature(uint64_t feature) {
  return (_features[feature >> 8]) & (feature & 63);
}

uint64_t micro_feature_test_opt() {
  uint64_t res = 0;
  for (int i = 0; i < 64; i++) {
    set_feature_opt(i);
    res += check_feature_opt(i); 
  }
  return res;
}

uint64_t micro_feature_test() {
  uint64_t res = 0;
  for (int i = 0; i < 64; i++) {
    set_feature(i);
    res += check_feature(i); 
  }
  return res;
}

int main() {
  uint64_t res = 0;
  for (int i = 0; i < 10000000; i++) {
     res += micro_feature_test_opt();
  }
  res = 0;
  auto start = std::chrono::high_resolution_clock::now(); 
  for (int i = 0; i < 10000000; i++) {
     res += micro_feature_test_opt();
  }
  auto end = std::chrono::high_resolution_clock::now(); 
  auto diff = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
  std::cout << "[time micro_feature_test_opt] " << diff.count() <<  " ms  [res] " << res << std::endl;
  res = 0;
  for (int i = 0; i < 10000000; i++) {
     res += micro_feature_test();
  }
  res = 0;
  start = std::chrono::high_resolution_clock::now(); 
  for (int i = 0; i < 10000000; i++) {
     res += micro_feature_test();
  }
  end = std::chrono::high_resolution_clock::now(); 
  diff = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
  std::cout << "[time micro_feature_test] " << diff.count() <<  " ms  [res] " << res << std::endl;
  return 0;
}
