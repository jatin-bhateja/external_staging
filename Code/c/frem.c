
#include <math.h>
float f1 = 2.0f;
float f2 = 1.2f;

float res(float v1, float v2) {
   return fmodf(v1,v2);
}
int main() {
  return (int)res(f1, f2);
}
