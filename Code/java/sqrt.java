
class sqrt {
   public static double micro(double val) {
     return Math.sqrt(val);
   }
   public static void main(String [] args) {
      double res = 0.0;
      for(int i = 0 ; i < 10000000; i++)
         res += micro((double)i);
      res = 0.0;
      long t1 = System.currentTimeMillis();
      for(int i = 0 ; i < 10000000; i++)
         res += micro((double)i);
      long time = System.currentTimeMillis() - t1;
      System.out.println("[Time] " + time + " ms   [Res] " + res);
   }
}
