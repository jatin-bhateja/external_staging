#include <math.h>
#include <stdio.h>
#include <stdlib.h>
int main(int argc, char * argv[]) {
  float f1 = atof(argv[1]);
  float f2 = atof(argv[2]);
  return printf("%f mod %f = %f\n", f1, f2, fmodf(f1,f2));
}
