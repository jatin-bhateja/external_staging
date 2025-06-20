import java.util.Base64;
import java.util.Arrays;

class Base64Micro {
  public static Base64.Decoder d = Base64.getDecoder();
  public static Base64.Encoder e = Base64.getEncoder();

  public static byte [] micro_decode(byte [] inp) {
      return d.decode(inp);
  }
  public static byte [] micro_encode(byte [] inp) {
      return e.encode(inp);
  }
  public static void main(String [] args) {
      byte [] arr = new byte[Integer.parseInt(args[0])];
      for (int i = 0; i < arr.length; i++) {
         arr[i] = (byte)i;
      }
      for(int i = 0; i < 10000; i++) {
         byte [] res = micro_encode(arr);
         byte [] orig = micro_decode(res); 
         if (0 != Arrays.compare(orig, arr)) {
             throw new AssertionError("Result mismatch!");
         }
      }
      long val = 0;
      byte [] res = micro_encode(arr);
      long t1 = System.currentTimeMillis();
      for(int i = 0; i < 10000; i++) {
         byte [] orig = micro_decode(res); 
         val += orig[4];
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[Time]  " + (t2-t1) + " ms  [Res] " + val);  
  }
}
