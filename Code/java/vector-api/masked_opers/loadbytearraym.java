
import java.nio.ByteOrder;
import jdk.incubator.vector.*;

class loadbytearraym {
  public static int N = 256;
  public static VectorSpecies SPECIES = IntVector.SPECIES_512;

  public static void workload(int [] d, byte [] s) {
    VectorMask<Integer> mask = VectorMask.fromLong(SPECIES, 255);
    for(int i = 0, j = 0; i < s.length; i += SPECIES.vectorByteSize(), j += SPECIES.length()) {
        IntVector vec = IntVector.fromByteArray(SPECIES, s, i, ByteOrder.LITTLE_ENDIAN, mask);
        vec.intoArray(d, j);
    }
  }

  public static void main(String [] args) {
     int [] r = new int[N];
     byte [] s = new byte[N*4];
     for(int i = 0 ; i < s.length ; i++) {
         s[i] = (byte)i;
     }
     for(int i = 0 ; i < 900000 ;i++) {
         workload(r, s);
     }
     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 500000 ;i++) {
         workload(r, s);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[Time ] " + (t2-t1) + " ms");
     /*for(int i = 0; i  < SPECIES.length() ; i++) {
         System.out.println("r[" + i + "] = " + r[i]);
     }*/
  }
}
