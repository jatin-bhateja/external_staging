
import jdk.incubator.vector.*;

class rotate {
  public static void workload(byte [] arr, byte [] res) {
      for(int i = 0; i < ByteVector.SPECIES_128.loopBound(res.length); i += ByteVector.SPECIES_128.length()) {
        ByteVector vec = ByteVector.fromArray(ByteVector.SPECIES_128, arr, i);
        //vec.lanewise(VectorOperators.ROL, 5).intoArray(res,i);
        vec.lanewise(VectorOperators.ROL, vec).intoArray(res,i);
      }
  }

  public static void main(String [] args) {
     byte [] arr = new byte[2048];
     byte [] res = new byte[2048];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = (byte)(i+10);

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       workload(arr, res);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 200000 ; i++)
       workload(arr, res);
     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);

     for (int i = 0; i < ByteVector.SPECIES_128.length(); i++) {
       System.out.println(res[i]);
     }
  }
}
