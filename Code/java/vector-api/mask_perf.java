
import jdk.incubator.vector.*;
import java.util.stream.IntStream;

public class mask_perf {
   public static VectorSpecies<Integer> S512 = IntVector.SPECIES_512;
   public static VectorSpecies<Byte> B512 = ByteVector.SPECIES_512;

   public static void micro1(int [] indices, int alength, VectorMask<Byte> mask) {
      long lmask = mask.toLong();
      for (int i = 0, j = 0; i < indices.length; i += S512.length()) {
          var ivec = IntVector.fromArray(S512, indices, i);
          if (ivec.compare(VectorOperators.LT, 0)
             .or(ivec.compare(VectorOperators.GT, alength)
             .and(VectorMask.fromLong(S512, lmask >> (16 * j++))))
             .anyTrue()) {
             throw new IndexOutOfBoundsException();
         }
      }
   }

   public static void micro2(int [] indices, int alength, VectorMask<Byte> mask) {
      boolean [] bmask = mask.toArray(); 
      for (int i = 0; i < indices.length; i++) {
          if (bmask[i] && (indices[i] < 0 || indices[i] > alength)) {
             throw new IndexOutOfBoundsException();
          }
      }
   }
   
   public static void main(String [] args) {
      int [] indices = IntStream.range(0, 64).toArray();
      VectorMask<Byte> mask = VectorMask.fromLong(B512, 0xAAAABBBBCCCCDDDDL); 
      for (int i = 0; i < 100000; i++) {
         micro1(indices, 124, mask);
      }
      long t1 = System.currentTimeMillis();
      for (int i = 0; i < 100000; i++) {
         micro1(indices, 124, mask);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[time micro1] " + (t2 - t1) + " ms "); 

      for (int i = 0; i < 100000; i++) {
         micro2(indices, 124, mask);
      }

      t1 = System.currentTimeMillis();
      for (int i = 0; i < 100000; i++) {
         micro2(indices, 124, mask);
      }
      t2 = System.currentTimeMillis();
      System.out.println("[time micro2] " + (t2 - t1) + " ms "); 
   }
}
