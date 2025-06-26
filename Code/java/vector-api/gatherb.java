

import jdk.incubator.vector.*;
import java.util.Arrays;

public class gatherb {
   public static final VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_512;

   public static void micro1(byte [] dst, byte [] src, int [] index) {
      ByteVector vec = ByteVector.broadcast(SPECIES, 0);
      for (int i = 0; i < SPECIES.length(); i++) {
         vec = vec.withLane(i, src[index[i]]);
      }
      vec.intoArray(dst, 0);
   }
   public static void micro2(byte [] dst, byte [] src, int [] index) {
       ByteVector.fromArray(SPECIES, src, 0, index, 0)
                 .intoArray(dst, 0);
   }
   public static void main(String [] args) {
      byte [] src = new byte[4096];
      byte [] dst = new byte[SPECIES.length()];
      int [] index = new int[SPECIES.length()];
      for (int i = 0; i < src.length; i++) {
          src[i] = (byte)i;
      }
      for (int i = 0; i < index.length; i++) {
          index[i] = i * 64;
      }

      for (int i = 0; i < 100000; i++) {
         micro1(dst, src, index);
      }
      long t1 = System.currentTimeMillis();
      for (int i = 0; i < 100000; i++) {
         micro1(dst, src, index);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[time micro1]  " + (t2-t1) + " ms  [dst] = " + Arrays.toString(dst));

      Arrays.fill(dst, (byte)0);
      for (int i = 0; i < 100000; i++) {
         micro2(dst, src, index);
      }
      t1 = System.currentTimeMillis();
      for (int i = 0; i < 100000; i++) {
         micro2(dst, src, index);
      }
      t2 = System.currentTimeMillis();
      System.out.println("[time micro2]  " + (t2-t1) + " ms  [dst] = " + Arrays.toString(dst));
   }
}
