
import jdk.incubator.vector.*;

import java.util.Random;

class castb {
  public static int workload(byte [] res, float [] arr, int j) {
     for (int i = 0; i < arr.length; i += FloatVector.SPECIES_256.length()) {
       FloatVector FV = FloatVector.fromArray(FloatVector.SPECIES_256, arr, i);
       Vector<Byte> BV = FV.castShape(ByteVector.SPECIES_256, 0);
       ((ByteVector)BV).intoArray(res, i);
     }
     return res[j];
  }

  public static void main(String [] args) {
     Random RAND = new Random(1024);
     byte [] res = new byte[8192];
     float [] arr = new float[1024];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = 100000*RAND.nextFloat();

     int r = 0;
     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       r += workload(res, arr, i&7);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       r += workload(res, arr, i&7);

     long time = System.currentTimeMillis() - start;
     System.out.println("[Time] = " + time + " ms [Res] = " + r);

     for (int i = 0 ; i < ByteVector.SPECIES_512.length(); i++) {
       if (i < FloatVector.SPECIES_256.length()) {
         System.out.println("arr[" + i + "] = " + arr[i] + " res[" + i + " ] = " + res[i]);
       } else {
         System.out.println(" res[" + i + " ] = " + res[i]);
       }
     }
  }
}
