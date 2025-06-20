

import jdk.incubator.vector.*;
import java.util.Arrays;

public class phibox {
  public static final VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_128;

  public static Byte micro(int ctr, byte [] arr, byte [] res) {
     ByteVector fv1 = ByteVector.broadcast(SPECIES, 1);
     for(int iter = 0; iter < 1000; iter++) {
       // Phi:fv1
       for(int i = 0; i < res.length; i += SPECIES.length()) {
         // Phi:fv1
         ByteVector fv2 = ByteVector.fromArray(SPECIES, arr, i);
         fv1 = fv1.lanewise(VectorOperators.DIV, fv2); 
         fv1.intoArray(res, i);
       }
     }
     return res[ctr];
  }

  public static void main(String [] args) {
     byte val = 0;
     byte [] arr = new byte[1024];
     byte [] res  = new byte[1024];
     Arrays.fill(arr, (byte)1);
     for (int i = 0; i < 10000; i++) {
        val += micro(i & 1023, arr, res);
     }
     System.out.println(val);
  }
}
