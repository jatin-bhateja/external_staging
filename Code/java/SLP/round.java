
class round {

  public static int round_scalar(float [] a,  int [] r, int ctr) {
     for (int j =  0 ; j < a.length ; j++) {
        r[j] = Math.round(a[j]);
     }
     return r[ctr];
  }

  public static void main(String [] args) {
     float [] a = new float[4096];
     int [] r = new int[4096];

     for (int i = 0 ; i < 4096; i++) {
        a[i] = 0.50000006f;
     }

     int res = 0;
     for (int i = 0 ; i < 100000 ; i++)
        res += round_scalar(a, r, i & 4095);
  
     long t1 = System.currentTimeMillis();
     res = 0;
     for (int i = 0 ; i < 500000 ; i++)
        res += round_scalar(a, r, i & 4095);
     long t2 = System.currentTimeMillis();
       
     System.out.println("[Time Scalar] " + (t2-t1) + " ms  [Res] " + res); 
     for(int i = 0 ; i <= 1; i++) {
        String s = String.format("a[" + i + "] = %10.10f r["+ i + "] = " + r[i], a[i]);
        System.out.println(s);
     }
  }
}
