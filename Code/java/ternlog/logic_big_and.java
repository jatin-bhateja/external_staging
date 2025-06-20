

class logic {
  public static final int VECLEN = 1024;

  public static void workload(int [] r, 
          int [] a1, int [] b1 , int [] c1, int [] d1, int [] e1,
          int [] a2, int [] b2 , int [] c2, int [] d2, int [] e2
      ) {
    for(int i = 0 ; i < r.length ; i++) {
      r[i] = (
         a1[i] & b1[i] & c1[i] & d1[i] & e1[i] &
         a2[i] & b2[i] & c2[i] & d2[i] & e2[i] 
      ); 
    }
  }
  public static void main(String [] args) {
    int [] r = new int[VECLEN];

    int [] a1 = new int[VECLEN];
    int [] b1 = new int[VECLEN];
    int [] c1 = new int[VECLEN];
    int [] d1 = new int[VECLEN];
    int [] e1 = new int[VECLEN];
    
    int [] a2 = new int[VECLEN];
    int [] b2 = new int[VECLEN];
    int [] c2 = new int[VECLEN];
    int [] d2 = new int[VECLEN];
    int [] e2 = new int[VECLEN];

    for(int i = 0 ; i < VECLEN ; i++) {
       a1[i] = a2[i] =  426;
       b1[i] = b2[i] =  426;
       c1[i] = c2[i] =  426;
       d1[i] = d2[i] =  426;
    }
    // Warmup
    for(int i = 0 ; i < 900000 ; i++)
      workload(r,
            a1, b1, c1, d1, e1,
            a2, b2, c2, d2, e2
      );
    // Perf measurement.
    long t1 = System.nanoTime();
    for(int i = 0 ; i < 100000 ; i++)
      workload(r,
            a1, b1, c1, d1, e1,
            a2, b2, c2, d2, e2
      );

    long t2 = System.nanoTime();

    for(int i = 0 ; i < 16; i++)
      System.out.println("r["+i+"] = " + r[i]);
    System.out.println("[Time] " + (t2-t1)/1000 + " us");
  }
}
