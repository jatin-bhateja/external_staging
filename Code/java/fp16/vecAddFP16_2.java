import jdk.incubator.vector.*;
import static jdk.incubator.vector.Float16.*;

public class vecAddFP16_2 {
   public static float micro(short a) {
       Float16 fa = shortBitsToFloat16(a);
       return add(add(fa, valueOf(4.0f)), valueOf(10.f)).floatValue();
   }

   public static void main(String [] args) {
       float res = 0.0f;
       for (int i = 0 ; i < 1000000; i++) {
           res += micro(Float.floatToFloat16((float)i));
       }
       System.out.println("[res] " + res);
   }
}
