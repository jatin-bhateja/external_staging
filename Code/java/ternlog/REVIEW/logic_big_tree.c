
  #include "stdio.h"

         //((a[i] & b[i]) | (a[i] & c[i]) | (b[i] & c[i])  | (~a[i] & ~b[i]) | (~a[i] & ~c[i]) | (~b[i] & ~c[i]) | (~a[i] & b[i]) | (~a[i] & c[i]) | (~b[i] & c[i]) | (~b[i] & a[i]) | (~c[i] & a[i])  | (~c[i] & b[i])) ^ ((a[i] | b[i]) & (a[i] | c[i])& (b[i] | c[i]) & (~a[i] | ~b[i]) & (~a[i] | ~c[i]) & (~b[i] | ~c[i]) & (~a[i] | b[i]) & (~a[i] | c[i]) & (~b[i] | c[i]) & (~b[i] | a[i]) & (~c[i] | a[i])  & (~c[i] | b[i])) ^ ((a[i] ^ b[i]) | (a[i] ^ c[i]) & (b[i] ^ c[i]) | (~a[i] ^ ~b[i]) & (~a[i] ^ ~c[i]) | (~b[i] ^ ~c[i]) &  (~a[i] ^ b[i]) | (~a[i] ^ c[i]) & (~b[i] ^ c[i]) | (~b[i] ^ a[i]) & (~c[i] ^ a[i]) | (~c[i] ^ b[i])) 

  int VECLEN = 2048;

  __attribute__((noinline))
  int workload(int iter, int count, int * r,  int * a, int * b , int * c) {
    for(int i = 0 ; i < VECLEN ; i++) {
      r[i] = (
         (((a[i] & b[i]) ^ (a[i] & c[i]) ^ (b[i] & c[i]))  &  ((~a[i] & b[i]) | (~b[i] & c[i])  | ~c[i] & a[i]))
     );      
    }
    return r[count];
  }

  int main() {
    int res = 0;
    int * r = new int[VECLEN];

    int * a1 = new int[VECLEN];
    int * b1 = new int[VECLEN];
    int * c1 = new int[VECLEN];
    
    for(int i = 0 ; i < VECLEN ; i++) {
       a1[i] = 15;
       b1[i] = 3;
       c1[i] = 12;
    }
    // Warmup
    for(int i = 0 ; i < 100000 ; i++)
      res += workload(i,(i&(VECLEN-1)), r, a1, b1, c1);

    printf("Res = %d\n" , res);
    // Perf measurement.
    for(int i = 0 ; i < 1000 ; i++)
      res += workload(i,(i&(VECLEN-1)), r, a1, b1, c1);

    //for(int i = 0 ; i < 16; i++)
    //  System.out.println("r["+i+"] = " + r[i]);
    printf("Res = %d\n" , res);
  }
