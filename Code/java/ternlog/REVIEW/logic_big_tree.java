
         //((a[i] & b[i]) | (a[i] & c[i]) | (b[i] & c[i])  | (~a[i] & ~b[i]) | (~a[i] & ~c[i]) | (~b[i] & ~c[i]) | (~a[i] & b[i]) | (~a[i] & c[i]) | (~b[i] & c[i]) | (~b[i] & a[i]) | (~c[i] & a[i])  | (~c[i] & b[i])) ^ ((a[i] | b[i]) & (a[i] | c[i])& (b[i] | c[i]) & (~a[i] | ~b[i]) & (~a[i] | ~c[i]) & (~b[i] | ~c[i]) & (~a[i] | b[i]) & (~a[i] | c[i]) & (~b[i] | c[i]) & (~b[i] | a[i]) & (~c[i] | a[i])  & (~c[i] | b[i])) ^ ((a[i] ^ b[i]) | (a[i] ^ c[i]) & (b[i] ^ c[i]) | (~a[i] ^ ~b[i]) & (~a[i] ^ ~c[i]) | (~b[i] ^ ~c[i]) &  (~a[i] ^ b[i]) | (~a[i] ^ c[i]) & (~b[i] ^ c[i]) | (~b[i] ^ a[i]) & (~c[i] ^ a[i]) | (~c[i] ^ b[i])) 

class logic {
  public static final int VECLEN = 2048;

  public static int workload(int iter, int count, int [] r,  int [] a, int [] b , int [] c) {
    for(int i = 0 ; i < r.length ; i++) {
      r[i] = (
         (((a[i] & b[i]) ^ (a[i] & c[i]) ^ (b[i] & c[i]))  &  ((~a[i] & b[i]) | (~b[i] & c[i])  | ~c[i] & a[i]))
     );      
    }
    //System.out.println("Iter["+ iter + "] " + "Returning element at count:" + count);
    return r[count];
  }

  public static void main(String [] args) {
    int res = 0;
    int [] r = new int[VECLEN];

    int [] a1 = new int[VECLEN];
    int [] b1 = new int[VECLEN];
    int [] c1 = new int[VECLEN];
    
    for(int i = 0 ; i < VECLEN ; i++) {
       a1[i] = 15;
       b1[i] = 3;
       c1[i] = 12;
    }
    // Warmup
    for(int i = 0 ; i < 100000 ; i++)
      res += workload(i,(i&(r.length-1)), r, a1, b1, c1);

    System.out.println("Res = " + res);
    // Perf measurement.
    long t1 = System.nanoTime();
    for(int i = 0 ; i < 1000 ; i++)
      res += workload(i,(i&(r.length-1)), r, a1, b1, c1);
    long t2 = System.nanoTime();

    //for(int i = 0 ; i < 16; i++)
    //  System.out.println("r["+i+"] = " + r[i]);
    System.out.println("Res = " + res + " [Time] " + (t2-t1)/1000 + " us");
  }
}
