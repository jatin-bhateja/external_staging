
import jdk.incubator.vector.*;

class rotate {
  public static void workload(byte [] arr, byte [] res, int j) {
     ByteVector vec = ByteVector.fromArray(ByteVector.SPECIES_256, arr, 0);
     vec.lanewise(VectorOperators.ROL, ((byte)j)).intoArray(res,0);
  }

  public static void main(String [] args) {
     byte [] arr = new byte[64];
     byte [] res = new byte[64];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = (byte)(i+10);

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       workload(arr, res, i);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       workload(arr, res, i);
     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);

     for (var elem : res) {
       System.out.println(elem + " ");
     }
  }
}
