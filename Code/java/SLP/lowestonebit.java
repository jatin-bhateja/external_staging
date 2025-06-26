

class lowestonebit {
  public static int LEN;

  public static int workload(int [] a) {
     int retval = 0;
     for (int j =  0 ; j < LEN ; j++) {
        retval += Long.lowestOneBit(a[j]);
     }
     return retval;
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

     for (int i = 0 ; i < 70000; i++)
        res += workload(a);
     
     res = 0;
     System.out.println("Warmup complete");
     long t1 = System.currentTimeMillis();
     for (int i = 0 ; i < 120000 ; i++)
        res += workload(a);
     long t2 = System.currentTimeMillis();
     System.out.println("Measurement complete");     

     System.out.println("[Time] " + (t2-t1) + " ms [Res] " + res); 
  }
}
