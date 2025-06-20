
#include <stdio.h>
#include <math.h>

int main() {
   float f1 = 3.4f;
   float f2 = 0.5f; // 0.5 x 2^0 , 0.5 x 2^1, 0.5 x 2^2 , 0.5 x 2^3... progression 0.5 x 2^n, so if normalized_mantissa is 0.5 then number of
   // is power of two.
   int exp = 0;
   float normalized_mantissa = frexp(f2, &exp);
   printf("exp = %d\n", exp); 
   return printf("normalized_mantissa = %f\n", normalized_mantissa); 
}
