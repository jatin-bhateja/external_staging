
import jdk.incubator.vector.*;
import java.util.Arrays;

public class test {
   public static final VectorSpecies<Long> VSP = LongVector.SPECIES_256;
   public static final VectorMask<Long> MASK = VectorMask.fromLong(VSP, -1);

   public static long micro(long [] src1, long [] src2) {
        return LongVector.fromArray(VSP, src1, 0)
                         .lanewise(VectorOperators.UMAX, LongVector.fromArray(VSP, src2, 0), MASK)
                         .reduceLanes(VectorOperators.ADD);
   } 

   // 127 : -128 -> 255 : 0
   public static void main(String [] args) {
       long [] src1 = new long [32];
       long [] src2 = new long [32];
       Arrays.fill(src1, (long)0); 
       Arrays.fill(src2, (long)1); 
       long res = 0;
       for (int i = 0; i < 100000; i++) {
           res += micro(src1, src2);
       } 
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 100000; i++) {
           res += micro(src1, src2);
       } 
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2-t1) + "ms [res] " + res);
   }

}
