

import jdk.incubator.vector.*;
import java.util.Arrays;

public class test {
  public static final VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_256;

  public static void copyMem_base(byte [] dst, byte [] src) {
     int i = 0;
     for (; i < SPECIES.loopBound(src.length); i+=SPECIES.length()) {
         ByteVector.fromArray(SPECIES, src, i)
                   .intoArray(dst, i);
     }      
     int tail = src.length - i;
     if (tail > 0) { 
         VectorMask mask = VectorMask.fromLong(SPECIES, (1 << tail) - 1);
         ByteVector.fromArray(SPECIES, src, i, mask)
                   .intoArray(dst, i, mask);
     }
  }

  public static void main(String [] args) {
     int res = 0;
     int length = Integer.parseInt(args[0]);
     byte [] src = new byte[length];
     byte [] dst = new byte[length];
     Arrays.fill(src, (byte)123); 
    
     for (int i = 0; i < 100000; i++) {
        copyMem_base(dst, src);
     }
     long t1 = System.currentTimeMillis();
     for (int i = 0; i < 100000; i++) {
        copyMem_base(dst, src);
     }
     long t2 = System.currentTimeMillis();

     for (int val: dst) {
        res += val;
     }
     System.out.println("[time]  " + (t2-t1) + " ms  [res] " + res);
  }
}
