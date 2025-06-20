
class test {
  public static double workload(int [] r,  double [] a, int idx) {
     for (int j =  0 ; j < a.length ; j++)
        r[j] = (int)a[j];
     return r[idx];
  }

  public static void main(String [] args) {
     int [] r = new int[1024];
     double [] a = new double[1024];
     double [] vals = {Double.NEGATIVE_INFINITY, Double.POSITIVE_INFINITY, Double.NaN, 0.0, -0.0, Double.MAX_VALUE, -Double.MAX_VALUE, 7.7};

     for (int i = 0 ; i < 8; i++)
        a[i] = vals[i&7];

     double res = 0.0;
     for (int i = 0 ; i < 100000 ; i++)
        res += workload(r, a, i & (r.length-1));

     res = 0.0f;
     long t1 = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
        res += workload(r, a, i & (r.length-1));
     long t2 = System.currentTimeMillis();

     System.out.println("[Time] " + (t2-t1) +  " ms   [Res] " + r[0]);
     for(int i = 0 ; i < vals.length; i++) {
        System.out.println("val[" + i + "]  " + a[i] + " -> " + r[i]);
     } 
  } 
}

