

class logic {
  public static final int VECLEN = 1024;

  public static void workload(int [] r, int [] a, int [] b , int [] c) {
    for(int i = 0 ; i < r.length ; i++) {
       r[i] = ~((~(a[i] & b[i])) & c[i]);
    }
  }
  public static void main(String [] args) {
    int [] a = new int[VECLEN];
    int [] b = new int[VECLEN];
    int [] c = new int[VECLEN];
    int [] r = new int[VECLEN];
    
    for(int i = 0 ; i < VECLEN ; i++) {
       a[i] = 426;
       b[i] = 426;
       c[i] = 426;
    }
    // Warmup
    for(int i = 0 ; i < 900000 ; i++)
      workload(r, a, b, c);

    // Perf measurement.
    long t1 = System.nanoTime();
    for(int i = 0 ; i < 1000 ; i++)
      workload(r, a, b, c);
    long t2 = System.nanoTime();

    for(int i = 0 ; i < 16; i++)
      System.out.println("r["+i+"] = " + r[i]);
    System.out.println("[Time] " + (t2-t1)/1000 + " us");
  }
}
