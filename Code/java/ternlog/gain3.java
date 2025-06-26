

class logic {
  public static final int VECLEN = 1024;
  //public static final int VECLEN = 64;
  //public static final int VECLEN = 128;
  //public static final int VECLEN = 512;

  public static long workload(int count, long [] r, 
        long [] a, long [] b , long [] c, long [] d, long [] e, long [] f) {
    for(int i = 0 ; i < r.length ; i++) {
      r[i] = ~((~((~a[i] | ~b[i]) & c[i])) ^ (~((a[i] | b[i]) | ~(~c[i] & a[i]))));
    }
    return r[count];
  }
  public static void main(String [] args) throws InterruptedException {
    long [] r = new long[VECLEN];

    long [] a = new long[VECLEN];
    long [] b = new long[VECLEN];
    long [] c = new long[VECLEN];
    long [] d = new long[VECLEN];
    long [] e = new long[VECLEN];
    long [] f = new long[VECLEN];

    for(int i = 0 ; i < VECLEN ; i++) {
       a[i] = 10245;
       b[i] = 34554;
       c[i] = 422424;
       d[i] = 3444;
       e[i] = 13444;
       f[i] = 35444;
    }

    // Warmup
    for(int i = 0 ; i < 900000 ; i++)
      workload(i % 10, r,
            a, b, c, d, e,f
      );
    Thread.sleep(5000);

    // Perf measurement.
    long res = 0;
    long t1 = System.nanoTime();
    for(int i = 0 ; i < 1000 ; i++)
      res += workload(i%10, r,a , b, c, d, e,f);

    long t2 = System.nanoTime();

    //for(int i = 0 ; i < 16; i++)
    //  System.out.println("r["+i+"] = " + r[i]);
    System.out.println("Res = " + res + " [Time] " + (t2-t1)/1000 + " us");
  }
}
