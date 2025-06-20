
import jdk.incubator.vector.*;
import java.util.stream.IntStream;

public class mask_perf1 {
   public static VectorSpecies<Integer> I512 = IntVector.SPECIES_512;
   public static VectorSpecies<Byte> B512 = ByteVector.SPECIES_512;

   public static void micro1(int [] indices, int alength) {
      for (int i = 0, j = 0; i < indices.length; i += I512.length()) {
          var ivec = IntVector.fromArray(I512, indices, i);
          if (ivec.compare(VectorOperators.LT, 0)
             .or(ivec.compare(VectorOperators.GT, alength))
             .anyTrue()) {
             throw new IndexOutOfBoundsException();
         }
      } 
   }

   public static void micro2(int [] indices, int alength) {
      for (int i = 0; i < indices.length; i++) {
          if ((indices[i] < 0 || indices[i] > alength)) {
             throw new IndexOutOfBoundsException();
          }
      }
   }
   
   public static void main(String [] args) {
      int [] indices = IntStream.range(0, 64).toArray();
      for (int i = 0; i < 100000; i++) {
         micro1(indices, 124);
      }
      long t1 = System.currentTimeMillis();
      for (int i = 0; i < 100000; i++) {
         micro1(indices, 124);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[time micro1] " + (t2 - t1) + " ms "); 

      for (int i = 0; i < 100000; i++) {
         micro2(indices, 124);
      }

      t1 = System.currentTimeMillis();
      for (int i = 0; i < 100000; i++) {
         micro2(indices, 124);
      }
      t2 = System.currentTimeMillis();
      System.out.println("[time micro2] " + (t2 - t1) + " ms "); 
   }
}
