
class roundd {
  public static double micro(double [] a,  double [] r, int ctr) {
     for (int j =  0 ; j < a.length ; j++) {
        r[j] = Math.fma(a[j],a[j],a[j]);
     }
     return r[ctr];
  }

  public static void main(String [] args) {
     double [] a = new double[1024];
     double [] r = new double[1024];

     for (int i = 0 ; i < 1024; i++)
        a[i] = 72.4;

      a[6] = +0x1.fffffffffffffp-2;
      a[7] = +0x1.0p-1;
      a[8] = +0x1.0000000000001p-1;
      a[9] = -0x1.fffffffffffffp-2;
      a[10] = -0x1.0p-1;
      a[11] = -0x1.0000000000001p-1;

        //a[i] = -0x1.fffffffffffffp-2;

     /*a[0] = Double.NaN;
     a[1] = Double.POSITIVE_INFINITY;
     a[2] = Double.NEGATIVE_INFINITY;
     a[3] = -(double)Long.MIN_VALUE;
     a[4] = (double) Long.MIN_VALUE;
     a[5] = 0;
     a[6] = Double.MIN_VALUE;
     a[7] = -Double.MIN_VALUE;*/

     double res = 0;
     for (int i = 0 ; i < 100000 ; i++)
        res += micro(a, r, i & 1023);

     long t1 = System.currentTimeMillis();
     res = 0;
     for (int i = 0 ; i < 100000 ; i++)
        res += micro(a, r, i & 1023);
     long t2 = System.currentTimeMillis();
     
     System.out.println("[Time] " + (t2-t1) + " ms  [Res] " + res); 

     for(int i = 0 ; i <= 12; i++) {
        System.out.println("r["+ i + "] = " + r[i]);
     }
  }
}
