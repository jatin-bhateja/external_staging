import module jdk.incubator.vector;
import java.util.Arrays;

public class compressV {
   public static final VectorSpecies<Integer> ISPECIES = IntVector.SPECIES_PREFERRED;

   public static void micro(int [] dst, int [] src, long mask) {
       VectorMask vmask = VectorMask.fromLong(ISPECIES, mask);
       for (int i = 0; i < ISPECIES.loopBound(dst.length); i += ISPECIES.length()) {
           IntVector.fromArray(ISPECIES, src, i)
                    .compress(vmask)
                    .intoArray(dst, i);
       }
   }

   public static void main(String [] args) {
       int [] src = new int[1024];
       int [] dst = new int[1024];
       for (int i = 0; i < src.length; i++) {
           src[i] = i;
       }
       
       for (int i = 0;i < 50000; i++) {
           micro(dst, src, 0xFL);
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0;i < 50000; i++) {
           micro(dst, src, 0xFL);
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2 - t1) + " ms  [res] " + Arrays.toString(Arrays.copyOfRange(dst, 0, 7)));
   }
}
