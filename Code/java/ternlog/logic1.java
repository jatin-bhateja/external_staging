

class logic {
  public static final int VECLEN = 64;

  public static void workload(int [] r, int [] a, int [] b , int [] c) {
    int [] r1 = new int[VECLEN];
    int [] r2 = new int[VECLEN];
    int [] r3 = new int[VECLEN];
    for(int i = 0 ; i < r.length ; i++) {
      r1[i] = a[i] & b[i]; 
      r2[i] = a[i] | b[i]; 
      r[i] = r1[i] ^ r2[i]; 
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
