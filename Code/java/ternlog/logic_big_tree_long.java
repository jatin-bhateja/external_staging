
         //((a[i] & b[i]) | (a[i] & c[i]) | (b[i] & c[i])  | (~a[i] & ~b[i]) | (~a[i] & ~c[i]) | (~b[i] & ~c[i]) | (~a[i] & b[i]) | (~a[i] & c[i]) | (~b[i] & c[i]) | (~b[i] & a[i]) | (~c[i] & a[i])  | (~c[i] & b[i])) ^ ((a[i] | b[i]) & (a[i] | c[i])& (b[i] | c[i]) & (~a[i] | ~b[i]) & (~a[i] | ~c[i]) & (~b[i] | ~c[i]) & (~a[i] | b[i]) & (~a[i] | c[i]) & (~b[i] | c[i]) & (~b[i] | a[i]) & (~c[i] | a[i])  & (~c[i] | b[i])) ^ ((a[i] ^ b[i]) | (a[i] ^ c[i]) & (b[i] ^ c[i]) | (~a[i] ^ ~b[i]) & (~a[i] ^ ~c[i]) | (~b[i] ^ ~c[i]) &  (~a[i] ^ b[i]) | (~a[i] ^ c[i]) & (~b[i] ^ c[i]) | (~b[i] ^ a[i]) & (~c[i] ^ a[i]) | (~c[i] ^ b[i])) 

class logic {
  public static final int VECLEN = 512;

  public static void workload(long [] r,  long [] a, long [] b , long [] c) {
    for(int i = 0 ; i < r.length ; i++) {
      r[i] = (
         (((a[i] & b[i]) ^ (a[i] & c[i]) ^ (b[i] & c[i]))  &  ((~a[i] & b[i]) | (~b[i] & c[i])  | ~c[i] & a[i]))
     );      
    }
  }

  public static void main(String [] args) {
    long [] r = new long[VECLEN];

    long [] a1 = new long[VECLEN];
    long [] b1 = new long[VECLEN];
    long [] c1 = new long[VECLEN];
    
    for(int i = 0 ; i < VECLEN ; i++) {
       a1[i] = 426;
       b1[i] = 426;
       c1[i] = 426;
    }
    // Warmup
    for(int i = 0 ; i < 900000 ; i++)
      workload(r, a1, b1, c1);

    // Perf measurement.
    long t1 = System.nanoTime();
    for(int i = 0 ; i < 1000 ; i++)
      workload(r, a1, b1, c1);
    long t2 = System.nanoTime();

    //for(int i = 0 ; i < 16; i++)
    //  System.out.println("r["+i+"] = " + r[i]);
    System.out.println("[Time] " + (t2-t1)/1000 + " us");
  }
}
