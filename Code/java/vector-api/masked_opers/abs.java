
import jdk.incubator.vector.*;

class abs {
  public static VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_256;
  public static void workload(byte [] arr, byte [] res) {
    VectorMask<Byte> mask = VectorMask.fromLong(SPECIES, 5);
    for(int i = 0; i < arr.length; i+=SPECIES.length()) {
      ByteVector vec = ByteVector.fromArray(SPECIES, arr, i);
      vec.lanewise(VectorOperators.ABS, mask).intoArray(res,i);
    }
  }

  public static void main(String [] args) {
     byte [] arr = new byte[1024];
     byte [] res = new byte[1024];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = (byte)-i;

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       workload(arr, res);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       workload(arr, res);

     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);

     for (int i = 0 ; i < SPECIES.length(); i++) {
       System.out.println(res[i] + " ");
     }
  }
}
