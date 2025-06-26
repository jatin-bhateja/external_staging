
import jdk.incubator.vector.*;
import java.util.Arrays;

public class test {
   public static final VectorSpecies<Long> LSP = LongVector.SPECIES_PREFERRED;

   // 32x32 = 64 bits
   // MULDQ = 32x32 = 64 bit preserved.
   public static void micro_muldq(long [] res, long [] src1, long [] src2) {
      for (int i = 0; i < LSP.loopBound(res.length); i += LSP.length()) {
         var vec1 = LongVector.fromArray(LSP, src1, i);
         var vec2 = LongVector.fromArray(LSP, src2, i);
         vec1.and(0xFFFF_FFFFL)
             .mul(vec2.lanewise(VectorOperators.LSHR, 32))
             .intoArray(res, i);
      } 
   }

   public static void main(String [] args) {
      long [] res = new long [1024];
      long [] src1 = new long [1024];
      long [] src2 = new long [1024];
      Arrays.fill(src1, 1L);  
      Arrays.fill(src2, 1L);  
      for (int i = 0; i < 100000; i++) {
         micro_muldq(res, src1, src2);
      }
      long t1 = System.currentTimeMillis();
      for (int i = 0; i < 100000; i++) {
         micro_muldq(res, src1, src2);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[time] " + (t2-t1) + " ms  [res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 8)));
   }
}
