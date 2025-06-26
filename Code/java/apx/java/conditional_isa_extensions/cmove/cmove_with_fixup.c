
#include <math.h>
#include <stdio.h>

long micro_fp_eq(double a, double b) {
  long res = 0;
  asm volatile (
      "movq     $1, %%rdx          \n\t"
      "xorq     %%rax, %%rax       \n\t"
      "ucomisd  %2, %1             \n\t"
      "cmovpq   %%rdx, %%rax, %0   \n\t"
      "cmovneq  %%rdx, %%rax, %0   \n\t" 
     : "+r"(res)
     : "x"(a) , "x"(b)
     : "cc" , "%rax", "%rdx"
  );
  return res;
}

/*

     Operator : NE
     DST = DST;
     if ( A != B) {
        DST = SRC;   // entry conditions:  1) NaN != NaN 2)  NON_NAN != NON_NAN e.g. 2.0 != 3.0
     }
     So following sequence works fine
      __ cmovl(Assembler::parity, $dst$$Register, $src$$Register);   // parity is set if either of operand is NaN
      __ cmovl(Assembler::notEqual, $dst$$Register, $src$$Register); // if true non-equality.


     Operator : EQ

     DST = DST;
     if (A == B) {
        DST = SRC  // entry condition: 1) NON_NAN == NON_NAN e.g. 2.0 == 2.0  2) NaN != NaN (true)
                   // no entry condition: 1) NaN == NaN (false), 2) NaN == 2.0
     }

*/

int main() {
  printf("-1.0 == -1.0 => %ld \n", micro_fp_eq(-1.0, -1.0));
  printf("NaN == NaN => %ld \n", micro_fp_eq(NAN, NAN));
  printf("NaN == 2.0 => %ld \n", micro_fp_eq(NAN, 2.0));
  return printf("2.0 == 2.0 => %ld \n", micro_fp_eq(2.0, 2.0));
}
