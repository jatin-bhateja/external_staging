
import jdk.incubator.vector.*;
import java.util.stream.IntStream;

public class newoper_test {
   public static final VectorSpecies<Byte> BSP = ByteVector.SPECIES_256;

   public static long micro(byte [] dst, byte [] src) {
       ByteVector vres = ByteVector.broadcast(BSP, (byte)0); 
       for (int i = 0; i < BSP.loopBound(dst.length); i += BSP.length()) {
           vres = ByteVector.fromArray(BSP, src, i)
                            .lanewise(VectorOperators.SADD, vres);
       }
       // Reduction using D&C may be expansive for non-subwords. 
       //   
       byte res = vres.lane(0);
       for (int i = 1; i < BSP.length(); i++) {
            res = VectorMath.addSaturating(res, vres.lane(i));
       } 
       return res;
   }

   public static void main(String [] args) {
       byte [] dst = new byte[1024];
       byte [] src1 = new byte[1024];
       IntStream.range(0, src1.length).forEach(i -> { src1[i] = (byte)i;});
       long res = 0;
       for (int i = 0; i < 100000; i++) {
           res += micro(dst, src1);
       }
       System.out.println("[res] " + res);
   }
}
