
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define DEBUG(...) \
 fprintf(stdout, __VA_ARGS__)

int main() {
  DEBUG("NaN / NaN = %f\n", NAN / NAN);  
  DEBUG("NaN / 2.0 = %f\n", NAN / 2.0f);  
  DEBUG("2.0f / NaN = %f\n", 2.0f / NAN);  
  
  DEBUG("INFINITY / INFINITY = %f\n", INFINITY / INFINITY);  
  DEBUG("-INFINITY / INFINITY = %f\n", -INFINITY / INFINITY);  
  DEBUG("INFINITY / -INFINITY = %f\n", INFINITY / -INFINITY);  
  DEBUG("-INFINITY / -INFINITY = %f\n", INFINITY / INFINITY);  

  DEBUG("INFINITY / 2.0 = %f\n", INFINITY / 2.0f);  
  DEBUG("-INFINITY / 2.0 = %f\n", -INFINITY / 2.0f);  
  DEBUG("INFINITY / -2.0 = %f\n", INFINITY / -2.0f);  
  DEBUG("-INFINITY / -2.0 = %f\n", -INFINITY / -2.0f);  

  DEBUG("2.0f / INFINITY = %f\n", 2.0f / INFINITY);  
  DEBUG("2.0f / -INFINITY = %f\n", 2.0f / -INFINITY);  
  DEBUG("-2.0f / INFINITY = %f\n", -2.0f / INFINITY);  
  DEBUG("-2.0f / -INFINITY = %f\n", -2.0f / -INFINITY);  

  DEBUG("0.0f / 0.0f= %f\n", 0.0f / 0.0f);  

  DEBUG("0.0f / -2.0f= %f\n", 0.0f / -2.0f);  
  DEBUG("0.0f / 2.0f= %f\n", 0.0f / 2.0f);  
  DEBUG("-0.0f / 2.0f= %f\n", -0.0f / 2.0f);  
  DEBUG("-0.0f / -2.0f= %f\n", -0.0f / -2.0f);  

  DEBUG("2.0f / -0.0f= %f\n", 2.0f / -0.0f);  
  DEBUG("-2.0f / 0.0f= %f\n", -2.0f / 0.0f);  
  DEBUG("-2.0f / -0.0f= %f\n", -2.0f / -0.0f);  
  DEBUG("2.0f / 0.0f= %f\n", 2.0f / 0.0f);  
 
  return 0;
}
