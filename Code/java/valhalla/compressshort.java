
import java.util.Arrays;
import jdk.incubator.vector.*;

public class compressbyte {
   public static VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_256; 

   public static VectorMask<Byte> MASK = VectorMask.fromLong(SPECIES, 127);

   public static void micro(byte [] dst, byte [] src) {
      ByteVector.fromArray(SPECIES, src, Integer.max(0, -(dst.length)))
                .compress(MASK)
                .intoArray(dst, 0);
   }

   public static void main(String [] args) {
      byte [] src = new byte[32];
      byte [] dst = new byte[32]; 
      Arrays.fill(src, (byte)4);

      for (int i = 0; i < 10000; i++) {
          micro(dst, src);
      }
      
      System.out.println(Arrays.toString(dst));
   }
}
