
class logic {
  public static final int VECLEN = 256;

  static void micro(int[] r, int[] a, int[] b, int[] c, int[] d) {
    for (int i = 0; i < r.length; i++) {
      r[i] = (a[i] & (b[i] | c[i])) ^ ((b[i] | c[i]) & d[i]);
    }
  }

  public static void main(String [] args) {
    int [] a = new int[VECLEN];
    int [] b = new int[VECLEN];
    int [] c = new int[VECLEN];
    int [] d = new int[VECLEN];
    int [] r = new int[VECLEN];
    
    for(int i = 0 ; i < VECLEN ; i++) {
       a[i] = 4; b[i] = 9; c[i] = -1; d[i] = 13;
    }

    // Warmup
    for(int i = 0 ; i < 100000 ; i++)
      micro(r, a, b, c, d);

    // Perf measurement.
    long t1 = System.nanoTime();
    for(int i = 0 ; i < 1000*1000; i++)
      micro(r, a, b, c, d);
    long t2 = System.nanoTime();

    long res = 0L;
    for (int i = 0; i < r.length ; i++)
      res += r[i];
    System.out.println("res = " + res + " [Time] " + (t2-t1) + " ns");
  }
}
