#include "math.h"
  
int micro(int * arr, int len) {
     int res = 0.0f;
     for (int i = 0; i < len; i++) {
        res += arr[i] * 10;
        res += 10;
     }
     return res;
}
