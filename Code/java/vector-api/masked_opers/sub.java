
import jdk.incubator.vector.*;

class subv {
  public static VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_512;
  public static byte workload(byte [] arr1, byte [] res, int ctr) {
    byte val = 0;
    for (int i = 0 ; i < arr1.length; i+=SPECIES.length()) {
      ByteVector vec1 = ByteVector.fromArray(SPECIES, arr1, i);
      vec1.lanewise(VectorOperators.SUB, vec1).intoArray(res, i);
    }
    return res[ctr % res.length];
  }

  public static void main(String [] args) {
     int val = 0;
     byte [] arr1 = new byte[1024];
     byte [] res = new byte[1024];
     for (int i = 0 ; i < arr1.length ; i++) {
       arr1[i] = (byte)(i);
     }

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       val += (int)workload(arr1,res, i);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       val += (int)workload(arr1,res, i);

     long time = System.currentTimeMillis() - start;
     System.out.println("[Time] " + time + "ms [Res] " + val);
  }
}
