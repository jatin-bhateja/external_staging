
//java --add-modules=jdk.incubator.vector --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED -XX:CompileCommand=DontInline,optimized_shuffle_checkIndex::*  optimized_shuffle_checkIndex 0
//java --add-modules=jdk.incubator.vector --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED -XX:CompileCommand=DontInline,optimized_shuffle_checkIndex::*  optimized_shuffle_checkIndex 1

import jdk.incubator.vector.*;

public class optimized_shuffle_checkIndex {
   public static byte [] payload_shuffle = {0, 1, 2, 3, 4 ,5 ,6 ,7};
   public static int [] payload_index = {0, 1, 2, 3, 4 ,5 ,6 ,7};

   public static final VectorShuffle<Integer> shufvec = VectorShuffle.fromArray(IntVector.SPECIES_256, payload_index, 0);
   public static final Vector<Byte> shufvec2 = ByteVector.fromArray(ByteVector.SPECIES_64, payload_shuffle, 0);

   public static int micro_new_shuffle_checkIndex() {
        int res = 0;
        VectorMask<Byte> vecmask = shufvec2.compare(VectorOperators.LT, ByteVector.SPECIES_64.zero());
        if (vecmask.anyTrue()) {
            throw new AssertionError("OOB");
        }
        return vecmask.trueCount();
   }

   public static int micro_old_shuffle_checkIndex() {
        int res = 0;
        VectorMask<Integer> vecmask = shufvec.toVector().compare(VectorOperators.LT, IntVector.SPECIES_256.zero());
        if (vecmask.anyTrue()) {
            throw new AssertionError("OOB");
        }
        return vecmask.trueCount();
   }

   public static void main(String [] args) {
        int algo = Integer.parseInt(args[0]);
        if (algo == 0 || algo == -1) {
            int res = 0;
            for(int i = 0; i < 10000; i++) {
               res += micro_old_shuffle_checkIndex();
            }
            long t1 = System.currentTimeMillis();
            for(int i = 0; i < 10000; i++) {
               res += micro_old_shuffle_checkIndex();
            }
            long t2 = System.currentTimeMillis();
            System.out.println("[time old] " + (t2-t1) + " ms  [res] " + res);
        }
        if (algo == 1 || algo == -1) {
            int res = 0;
            for(int i = 0; i < 10000; i++) {
               res += micro_new_shuffle_checkIndex();
            }
            long t1 = System.currentTimeMillis();
            for(int i = 0; i < 10000; i++) {
               res += micro_new_shuffle_checkIndex();
            }
            long t2 = System.currentTimeMillis();
            System.out.println("[time new] " + (t2-t1) + " ms  [res] " + res);
        }
   }

}
