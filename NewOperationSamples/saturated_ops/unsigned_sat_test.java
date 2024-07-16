

public class unsigned_sat_test {
   public static short toSigned(short b) {
      return (short)(b + Short.MIN_VALUE);
   }
   public static short toUnsigned(short b) {
      return (short)(b ^ (1 << 7));
   }
   public static void main(String [] args) {
      for (int i = 0; i < 65536; i++) {
         short a = (short)i;
         for (int j = 0; j < 65536; j++) {
            short b = (short)j;
            short r = (short)(a + b);
            int uir = Short.toUnsignedInt(r);
            int uia = Short.toUnsignedInt((short)a);
            int uib = Short.toUnsignedInt((short)b);
            int uor = Short.toUnsignedInt((short)( a | b));
            if ((uia + uib) > 65535) {
               boolean overflow = Short.compareUnsigned(r, (short)(a | b)) < 0;
               if (overflow == false) {
                 System.out.println("expected = overflow(true) " + " actual = overflow(" + overflow + ") "); 
               }
            }
         } 
      }
   }

}
