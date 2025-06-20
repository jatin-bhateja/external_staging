
import jdk.incubator.vector.*;
import java.util.Arrays;

public class test_const_inputs {
   public static short micro1(Float16 a) {
      // ConF is dumped as 32 bit IEEE 754 encoded value.
      return Float16.float16ToShortBits(Float16.add(a, Float16.valueOf(3.0f)));
   }

   public static short micro2() {
      return Float16.float16ToShortBits(Float16.multiply(Float16.valueOf(3.0f), Float16.valueOf(3.0f)));
   }

   public static short micro3(boolean cond) {
      Float16 val;
      if (cond) {
        val =  Float16.multiply(Float16.valueOf(3.0f), Float16.valueOf(3.0f));
      } else {
        val =  Float16.multiply(Float16.valueOf(5.0f), Float16.valueOf(5.0f));
      }
      // Phi (TypeInst [Float16])
      // ConF is dumped as 32 bit IEEE 754 encoded value.
      return Float16.float16ToShortBits(Float16.multiply(val, Float16.valueOf(3.0f)));
   }

   public static short micro4(boolean cond) {
      Float16 val;
      if (cond) {
        val =  Float16.add(Float16.valueOf(3.0f), Float16.valueOf(3.0f));
      } else {
        val =  Float16.add(Float16.valueOf(5.0f), Float16.valueOf(5.0f));
      }
      // Phi (TypeInst [Float16])
      return Float16.float16ToShortBits(Float16.add(val, val));
   }

   public static void main(String [] args) {
      short [] res = new short[100000];
      for (int i = 0; i < 100000; i++) {
         //res[i] = micro1(Float16.valueOf(i));
         res[i] = micro4((i & 0x1) == 0x1);
      }
      System.out.println("[res] " + Arrays.toString(Arrays.copyOfRange(res, 9990, 10000)));
   }
}
