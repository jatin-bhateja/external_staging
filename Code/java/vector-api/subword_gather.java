
import jdk.incubator.vector.*;
import java.util.Arrays;

public class subword_gather {
   public static final VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_512;

   public static void micro (byte [] dst, byte [] src, int [] index, int ctr) {
      VectorMask<Byte> mask = VectorMask.fromLong(SPECIES, -1);
      for (int i = 0; i < 64; i += SPECIES.length()) {
         ByteVector vec = ByteVector.fromArray(SPECIES, src, 1, index, i);
         vec.intoArray(dst, i);
      }
   }

   public static void main(String [] args) {
      long res = 0;
      byte [] src = {
         1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
         17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
         33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48,
         49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64,
         1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
         17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
         33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48,
         49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64,
      };
      byte [] dst = new byte[src.length];
      int  [] index  =  {
        10, 0, 1, 9, 10, 11, 7, 11, 4, 12, 5, 0, 12, 9, 9, 7,
        14, 13, 5, 13, 9, 8, 6, 15, 10, 4, 5, 14, 12, 8, 13, 1,
        14, 0, 13, 0, 7, 13, 14, 14, 6, 10, 7, 7, 14, 15, 0, 11,
        1, 10, 5, 9, 10, 11, 12, 0, 15, 14, 8, 3, 7, 15, 15, 12
      };
      for (int i = 0; i < 1000000; i++) {
         micro(dst, src, index, i & (SPECIES.length() - 1));
      }
      long t1 = System.currentTimeMillis();
      for (int i = 0; i < 1000000; i++) {
         micro(dst, src, index, i & (SPECIES.length() - 1));
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
      System.out.println("source = "  + Arrays.toString(src));
      System.out.println("index = "  + Arrays.toString(index));
      System.out.println("dst = " + Arrays.toString(Arrays.copyOfRange(dst, 0, 63)));
   }
}
