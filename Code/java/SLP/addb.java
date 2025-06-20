

class test {
  public static int LEN;
  public static int workload1(byte [] a , byte [] b,  byte [] r, int idx) {
     for (int j =  0 ; j < LEN ; j++) {
        r[j] = (byte)(a[j] + b[j]);
        r[j] = (byte)(r[j] + b[j]);
     }
     return r[idx];
  }

  public static int workload(byte [] a , byte [] b,  byte [] r, int idx) {
     for (int j =  0 ; j < LEN ; j++) {
        a[j] = (byte)(a[j] << 2);
        b[j] = (byte)(b[j] >> 2);
        r[j] = (byte)(a[j] + b[j]);
     }
     return r[idx];
  }

  public static void main(String [] args) {
     LEN = 1023;
     byte [] a = new byte[LEN];
     byte [] b = new byte[LEN];
     byte [] r = new byte[LEN];
   
     int res = 0;
     //OFFSET = Integer.parseInt(args[0]);

     for (int i = 0 ; i < LEN; i++)
        a[i] = (byte)i;
     for (int i = 0 ; i < LEN; i++)
        b[i] = (byte)i;

     for (int i = 0 ; i < 700000000; i++)
        res += workload(a, b, r, i & 63);
     
     System.out.println("Warmup complete");
     long t1 = System.currentTimeMillis();
     for (int i = 0 ; i < 1200000000 ; i++)
        res += workload(a, b, r, i & 63);
     long t2 = System.currentTimeMillis();
     System.out.println("Measurement complete");     

     System.out.println("[Time] " + (t2-t1) + " ms [Res] " + res); 
  }
}
