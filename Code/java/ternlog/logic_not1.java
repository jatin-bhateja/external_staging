

class logic {
  public static final int VECLEN = 64;

  public static void workload(int [] r, int [] a, int [] b , int [] c) {
    for(int i = 0 ; i < r.length ; i++) {
      r[i] = (a[i] & b[i] & (~c[i])); 
    }
  }
  public static void main(String [] args) {
    int [] a = new int[VECLEN];
    int [] b = new int[VECLEN];
    int [] c = new int[VECLEN];
    int [] r = new int[VECLEN];
    
    for(int i = 0 ; i < VECLEN ; i++) {
       a[i] = 6;
       b[i] = 1;
       c[i] = 3;
    }
    // Warmup
    for(int i = 0 ; i < 900000 ; i++)
      workload(r, a, b, c);
    // Perf measurement.
    long t1 = System.nanoTime();
    for(int i = 0 ; i < 100000 ; i++)
      workload(r, a, b, c);
    long t2 = System.nanoTime();

    //for(int i = 0 ; i < r.length; i++)
      System.out.println("r["+0+"] = " + r[0]);
    System.out.println("[Time] " + (t2-t1)/1000 + " us");
  }
}
