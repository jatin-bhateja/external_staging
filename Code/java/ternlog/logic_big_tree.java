         //((a[i] & b[i]) | (a[i] & c[i]) | (b[i] & c[i])  | (~a[i] & ~b[i]) | (~a[i] & ~c[i]) | (~b[i] & ~c[i]) | (~a[i] & b[i]) | (~a[i] & c[i]) | (~b[i] & c[i]) | (~b[i] & a[i]) | (~c[i] & a[i])  | (~c[i] & b[i])) ^ ((a[i] | b[i]) & (a[i] | c[i])& (b[i] | c[i]) & (~a[i] | ~b[i]) & (~a[i] | ~c[i]) & (~b[i] | ~c[i]) & (~a[i] | b[i]) & (~a[i] | c[i]) & (~b[i] | c[i]) & (~b[i] | a[i]) & (~c[i] | a[i])  & (~c[i] | b[i])) ^ ((a[i] ^ b[i]) | (a[i] ^ c[i]) & (b[i] ^ c[i]) | (~a[i] ^ ~b[i]) & (~a[i] ^ ~c[i]) | (~b[i] ^ ~c[i]) &  (~a[i] ^ b[i]) | (~a[i] ^ c[i]) & (~b[i] ^ c[i]) | (~b[i] ^ a[i]) & (~c[i] ^ a[i]) | (~c[i] ^ b[i])) 

class logic {
  public static final int VECLEN = 2048;

  public static int micro(int count, int [] r,  int [] a, int [] b , int [] c) {
    for(int i = 0 ; i < r.length ; i++) {
      r[i] = (
         (((a[i] & b[i]) ^ (a[i] & c[i]) ^ (b[i] & c[i]))  &  ((~a[i] & b[i]) | (~b[i] & c[i])  | ~c[i] & a[i]))
     );      
    }
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
      res += micro(i,(i&(r.length-1)), r, a1, b1, c1);

    // Perf measurement.
    long t1 = System.nanoTime();
    for(int i = 0 ; i < 10000 ; i++)
      res += micro((i&(r.length-1)), r, a1, b1, c1);
    long t2 = System.nanoTime();

    System.out.println("Res = " + res + " [Time] " + (t2-t1)/1000 + " us");
  }
}
