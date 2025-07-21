
import jdk.incubator.vector.*;

public class mask_cast {
   public static long micro() {
      return VectorMask.fromLong(IntVector.SPECIES_128, 0x5555555555L)
                       .cast(DoubleVector.SPECIES_256)
                       .toLong();
   }

   public static void main(String [] args) {
      long res = 0;
      for (int i = 0; i < 100000; i++) {
          res += micro();
      }
      System.out.println("[res] " + res);
   }
}
