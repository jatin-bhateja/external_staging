import jdk.incubator.vector.*;
import java.util.Arrays;

public class compressV {
   public static final VectorSpecies<Byte> BSPECIES = ByteVector.SPECIES_512;
   public static void micro(byte [] dst, byte [] src, long mask) {
       VectorMask vmask = VectorMask.fromLong(BSPECIES, mask);
       ByteVector.fromArray(BSPECIES, src, 0)
                 .compress(vmask)
                 .intoArray(dst, 0);
   }
   public static void main(String [] args) {
       byte [] src = new byte[BSPECIES.length()];
       byte [] dst = new byte[BSPECIES.length()];
       for (int i = 0; i < src.length; i++) {
           src[i] = (byte)i;
       }
       for (int i = 0;i < 10000; i++) {
           micro(dst, src, 0xFFFF0000FFFF0000L);
       }
       System.out.println(Arrays.toString(dst));
   }
}
