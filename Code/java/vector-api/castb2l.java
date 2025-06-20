
import jdk.incubator.vector.*;
import java.util.Arrays;

class castb2l {
  public static final VectorSpecies<Long> L128 = LongVector.SPECIES_PREFERRED;
  public static final VectorSpecies<Byte> B128 = ByteVector.SPECIES_PREFERRED;

  public static void workload(long [] dst, byte [] src, int i, int j) {
     ByteVector.fromArray(ByteVector.SPECIES_128, src, i)
               .convertShape(VectorOperators.B2L, L128, 0)
               .reinterpretAsLongs()
               .intoArray(dst, j);
  }

  public static void main(String [] args) {
     long [] dst = new long[2*4096];
     byte [] src = new byte[16*4096];
     for (int i = 0; i < src.length; i++) {
        src[i] = (byte)i;
     }
     
     for (int ctr = 0; ctr < 1000; ctr++) {
        for (int i = 0, j = 0; i < src.length ; i += B128.length(), j += L128.length()) {
           workload(dst, src, i, j);
        }
     }

     // Perf
     long start = System.currentTimeMillis();
     for (int ctr = 0; ctr < 1000; ctr++) {
        for (int i = 0, j = 0; i < src.length ; i += B128.length(), j += L128.length()) {
           workload(dst, src, i, j);
        }
     }
     long time = System.currentTimeMillis() - start;

     System.out.println("[Time] = " + time + " ms ");
     System.out.println(Arrays.toString(Arrays.copyOfRange(dst, 0, 16)));
  }
}
