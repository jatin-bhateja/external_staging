

#include <math.h>
#include <stdio.h>

long micro(double src) {
   return (long)round(src); 
}

int main() {
   return printf("res = %ld\n", micro(0.5)); 
}
