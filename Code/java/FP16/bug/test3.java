
import java.util.Arrays;

/*
*/
public class test3 {
   public static void micro(byte [] dst, float [] src) {
       for (int i = 0; i < dst.length; i++) {
           dst[i] = (byte)(src[i]);
       }
   }
   public static void main(String [] args) {
       byte [] dst = new byte[4096];
       float [] src = new float[4096];
       Arrays.fill(src, 10.0f); 
       for (int i = 0; i < 10000; i++) {
           micro(dst, src);
       } 
       System.out.println("[res] " + Arrays.toString(Arrays.copyOfRange(dst, 0, 16)));
   }
}
