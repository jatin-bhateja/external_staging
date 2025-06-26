
class test {
  public static double workload(long [] a ,  double [] r, int idx) {
     for (int j =  0 ; j < a.length ; j++)
        r[j] = a[j];
     return r[idx];
  }

  public static void main(String [] args) {
     long [] a = new long[1024];
     double [] r = new double[1024];

     //OFFSET = Integer.parseInt(args[0]);

     for (int i = 0 ; i < 8; i++)
        a[i] = -i;

     double res = 0.0;
     for (int i = 0 ; i < 100000 ; i++)
        res += workload(a, r, i & (r.length-1));

     res = 0.0f;
     long t1 = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
        res += workload(a, r, i & (r.length-1));
     long t2 = System.currentTimeMillis();

     System.out.println("[Time] " + (t2-t1) +  " ms   [Res] " + r[0]);
  }
}

