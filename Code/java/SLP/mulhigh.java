

class mulhigh {
  public static int LEN;

  public static int workload(int [] a, int [] r, int idx) {
     for (int i =  0 ; i < LEN ; i++) {
        r[i] = Math.multiplyHigh(a[i], Integer.MAX_VALUE);;
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
        a[i] = Integer.MAX_VALUE;

     for (int i = 0 ; i < 700000; i++)
        res += workload(a, r, i & 63);
     
     System.out.println("Warmup complete");
     long t1 = System.currentTimeMillis();
     for (int i = 0 ; i < 1200000 ; i++)
        res += workload(a, r, i & 63);
     long t2 = System.currentTimeMillis();
     System.out.println("Measurement complete");     

     for(int i = 0; i < 8 ; i++) {
       System.out.println("r[" + i + "] =  " + r[i]);
     }

     System.out.println("[Time] " + (t2-t1) + " ms [Res] " + res); 
  }
}
