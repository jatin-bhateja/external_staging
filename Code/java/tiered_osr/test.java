
class logic {
  public static final int VECLEN = 2048;

  public static int workload_core(int count, int [] r,  int [] a, int [] b , int [] c) {
    for(int i = 0 ; i < r.length ; i++) {
      r[i] = (
         (((a[i] & b[i]) ^ (a[i] & c[i]) ^ (b[i] & c[i]))  &  ((~a[i] & b[i]) | (~b[i] & c[i])  | ~c[i] & a[i]))
     );      
    }
     return r[count];
  }
/*
  public static void workload(int [] r,  int [] a, int [] b , int [] c) {
    for(int i = 0 ; i < r.length ; i++) {
      workload_core(r,a,b,c);
    }
  }
*/
  public static void main(String [] args) {
    int res = 0;
    int [] r = new int[VECLEN];

    int [] a1 = new int[VECLEN];
    int [] b1 = new int[VECLEN];
    int [] c1 = new int[VECLEN];
    
    for(int i = 0 ; i < VECLEN ; i++) {
       a1[i] = 426;
       b1[i] = 426;
       c1[i] = 426;
    }
    /// Warmup for C2 compilation of workload_core
    //for(int i = 0 ; i < 100000; i++)
    //  workload_core(r, a1, b1, c1);

    // Perf measurement.
    long t1 = System.nanoTime();
    // OSR compilation time (parallel to mutator not accounted), 
    // c1->osr_code  | c2->osr code to -> [c2 optimized workload_core2 + deopt_time at the end of OSR]
    for(int i = 0 ; i < 100000; i++)
      res += workload_core((i&(r.length-1)), r, a1, b1, c1);
    long t2 = System.nanoTime();

    //for(int i = 0 ; i < 16; i++)
    //  System.out.println("r["+i+"] = " + r[i]);
    System.out.println("Res = " + res + " [Time] " + (t2-t1)/1000 + " us");
  }
}
