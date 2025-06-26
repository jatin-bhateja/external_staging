
         //((a[i] & b[i]) | (a[i] & c[i]) | (b[i] & c[i])  | (~a[i] & ~b[i]) | (~a[i] & ~c[i]) | (~b[i] & ~c[i]) | (~a[i] & b[i]) | (~a[i] & c[i]) | (~b[i] & c[i]) | (~b[i] & a[i]) | (~c[i] & a[i])  | (~c[i] & b[i])) ^ ((a[i] | b[i]) & (a[i] | c[i])& (b[i] | c[i]) & (~a[i] | ~b[i]) & (~a[i] | ~c[i]) & (~b[i] | ~c[i]) & (~a[i] | b[i]) & (~a[i] | c[i]) & (~b[i] | c[i]) & (~b[i] | a[i]) & (~c[i] | a[i])  & (~c[i] | b[i])) ^ ((a[i] ^ b[i]) | (a[i] ^ c[i]) & (b[i] ^ c[i]) | (~a[i] ^ ~b[i]) & (~a[i] ^ ~c[i]) | (~b[i] ^ ~c[i]) &  (~a[i] ^ b[i]) | (~a[i] ^ c[i]) & (~b[i] ^ c[i]) | (~b[i] ^ a[i]) & (~c[i] ^ a[i]) | (~c[i] ^ b[i])) 

class logic {
  public static final int VECLEN = 2048;

  public static void workload(int [] r,  int [] a, int [] b , int [] c) {
    for(int i = 0 ; i < r.length ; i++) {
      r[i] = (
         (((a[i] & b[i]) ^ (a[i] & c[i]) ^ (b[i] & c[i]))  &  ((~a[i] & b[i]) | (~b[i] & c[i])  | ~c[i] & a[i]))
     );      
    }
  }

  public static void main(String [] args) {
    int [] r = new int[VECLEN];

    int [] a1 = new int[VECLEN];
    int [] b1 = new int[VECLEN];
    int [] c1 = new int[VECLEN];
    
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
    // Measuring interp (no-osr)-> C2 compiled code (with tern opt).
    for(int i = 0 ; i < 1000 ; i++)
      workload(r, a1, b1, c1);
    long t2 = System.nanoTime();

    //for(int i = 0 ; i < 16; i++)
    //  System.out.println("r["+i+"] = " + r[i]);
    System.out.println("[Time] " + (t2-t1)/1000 + " us");
  }
}
