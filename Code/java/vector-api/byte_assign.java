

import java.util.Arrays;

public class byte_assign {
   public static byte [] src;
   public static int [] dst;

   public static int micro() {
      dst[0] = (int)src[0];
      dst[1] = (int)src[1];
      return dst[0] * 10;
   }

   public static void main(String [] args) {
      int res = 0;
      dst = new int[2];
      src = new byte[2];
      src[0] = 1;
      src[1] = 2;
      for (int i = 0; i < 10000; i++) {
          res += micro();
      }
      System.out.println("[res] " + res + " " + Arrays.toString(dst));   
   }
}
