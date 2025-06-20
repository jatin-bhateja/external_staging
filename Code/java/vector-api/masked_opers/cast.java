
import java.nio.ByteOrder;
import jdk.incubator.vector.*;

class cast {
  public static int N = 256;
  public static final VectorSpecies BSPECIES = ByteVector.SPECIES_128;
  //public static final VectorSpecies BSPECIES = ByteVector.SPECIES_64;
  public static final VectorSpecies FSPECIES = FloatVector.SPECIES_512;

  public static long workload(long mask) {
    VectorMask<Byte> mv = VectorMask.fromLong(BSPECIES, 0x55);
    return mv.cast(FSPECIES).toLong();
  }

  public static void main(String [] args) {
     long Res = 0;
     for(int i = 0 ; i < 9000000 ;i++) {
         Res += workload(i);
     }
     Res = 0;
     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 5000000 ;i++) {
         Res += workload(i);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[Time ] " + (t2-t1) + " ms  [Res] " +  Res);
  }
}
