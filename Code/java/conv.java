
class conv {
   public static long f1 = 10L;
   public static byte micro() {
     byte b = (byte)f1;
     return b;
   }
   public static void main(String [] args) {
      byte res = 0;
      for(int i = 0 ; i < 10000000; i++)
         res += micro();
      System.out.println(res);
   }
}
