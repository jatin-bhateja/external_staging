

class test {
  public static int LEN;
  public static int workload1(int [] a , int [] b,  int [] r, int idx) {
     for (int j =  0 ; j < LEN ; j++) {
        r[j] = (int)(a[j] + b[j]);
        r[j] = (int)(r[j] + b[j]);
     }
     return r[idx];
  }

  public static int workload(int [] a , int [] b,  int [] r, int idx) {
     for (int j =  0 ; j < LEN ; j++) {
        a[j] = (int)(a[j] << 2);
        b[j] = (int)(b[j] >> 2);
        r[j] = (int)(a[j] + b[j]);
     }
     return r[idx];
  }

  public static void main(String [] args) {
     LEN = 1023;
     int [] a = new int[LEN];
     int [] b = new int[LEN];
     int [] r = new int[LEN];
   
     int res = 0;
     //OFFSET = Integer.parseInt(args[0]);

     for (int i = 0 ; i < LEN; i++)
        a[i] = (int)i;
     for (int i = 0 ; i < LEN; i++)
        b[i] = (int)i;

     for (int i = 0 ; i < 700000; i++)
        res += workload(a, b, r, i & 63);
     
     System.out.println("Warmup complete");
     long t1 = System.currentTimeMillis();
     for (int i = 0 ; i < 1200000 ; i++)
        res += workload(a, b, r, i & 63);
     long t2 = System.currentTimeMillis();
     System.out.println("Measurement complete");     

     System.out.println("[Time] " + (t2-t1) + " ms [Res] " + res); 
  }
}
