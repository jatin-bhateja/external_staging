

public class test {
   public static int micro(float f) {
      return Float.floatToRawIntBits(f);
   }
   public static void main(String [] args) {
      int res = 0;
      for (int i = 0; i < 90000000; i++) {
          res += micro((float)i);
      }
      long t1 = System.currentTimeMillis();
      for (int i = 0; i < 90000000; i++) {
          res += micro((float)i);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[res] " + res + " [time] " + (t2 - t1) + " ms ");
   }
}
