
#include <math.h>

short conv(float f) {
   return (short)f;
}

short conv(short s) {
   return s;
}

int main() {
   return (int)fma(1.0,2.0,3.0);
}

/*
  Double
  S  E11 M52 (precision 53 bits)

  Float
  S E8 M23 (precision 24 bits)

  HFloat
  S E5 M10 (precision 11 bits)
 
  -> 

  RES = FMA
  
  IF RES > ABS( 0x1.FFCP+15) > Inf  [ D2F conversion will not changes this output]

  IF RES < 0x1P-24 (lowest sub-normal value) > result is +/- 0 [D2F conversion will not change this output]

  IF RES in range of FP16 value, Double has higher precion than Float, First conversion to Float will limit the precision of result, Second conversion from F2HF will further limit the precision of result, thus there is a double-rounding involved.]
  
  
  0x1.ffcfff 

*/
