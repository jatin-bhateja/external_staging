
class roundF {

  public static int round_scalar(float [] a,  int [] r, int ctr) {
     for (int j =  0 ; j < a.length - 1 ; j++) {
        r[j] = (int)Math.sqrt(a[j]);
     }
     return r[ctr];
  }

  public static void main(String [] args) {
     float [] a = new float[4096];
     int [] r = new int[4096];

     for (int i = 0 ; i < 4096; i++)
        a[i] = 0.50000006f;
        //a[i] = 0.4999994f;

/*     a[0] = +0x1.fffffep-2f;
     a[1] = +0x1.0p-1f;
     a[2] = +0x1.000002p-1f;
     a[3] = -0x1.fffffep-2f;
     a[4] = -0x1.0p-1f;
     a[5] = -0x1.000002p-1f;
*/
     int res = 0;
     for (int i = 0 ; i < 100000 ; i++)
        res += round_scalar(a, r, i & 4095);
  
     long t1 = System.currentTimeMillis();
     res = 0;
     for (int i = 0 ; i < 500000 ; i++)
        res += round_scalar(a, r, i & 4095);
     long t2 = System.currentTimeMillis();
       
     System.out.println("[Time Scalar] " + (t2-t1) + " ms  [Res] " + res); 
     for(int i = 0 ; i <= 17; i++) {
        String s = String.format("a[" + i + "] = %10.10f r["+ i + "] = " + r[i], a[i]);
        System.out.println(s);
     }
  }
}
