
import jdk.incubator.vector.*;
import java.util.Arrays;
import java.util.stream.IntStream;

public class SaturatingAddVB {
    public static final int size = 4096;
    public static final VectorSpecies<Byte> SP = ByteVector.SPECIES_PREFERRED;
    public static final VectorMask<Byte> MASK = VectorMask.fromLong(SP, -1);

    public static void micro(byte [] res, byte [] src1, byte [] src2) {
       
       for (int i = 0; i < SP.loopBound(res.length); i += SP.length()) {
          ByteVector.fromArray(SP, src1, i)
                    .lanewise(VectorOperators.SATURATING_UADD,
                              ByteVector.fromArray(SP, src2, i), MASK)
                    .intoArray(res, i);
       }
    }
    public static void main(String[] args) throws Exception {
       byte [] res = new byte[size]; 
       byte [] src1 = new byte[size]; 
       byte [] src2 = new byte[size]; 
       long resv = 0;
       for (int i = 0; i < 1000; i++) {
          for (int j = 0; j < 256; j++) {
             Arrays.fill(src1, (byte)j); 
             for (int k = 0; k < 256; k++) {
                Arrays.fill(src2, (byte)k); 
                micro(res, src1, src2);
                resv += res[0]; 
             }
          }
       }
       resv = 0;
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 1000; i++) {
          for (int j = 0; j < 256; j++) {
             Arrays.fill(src1, (byte)j); 
             for (int k = 0; k < 256; k++) {
                Arrays.fill(src2, (byte)k); 
                micro(res, src1, src2);
                resv += res[0]; 
             }
          }
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2-t1) + " ms  [res] " + resv);
    }
}
