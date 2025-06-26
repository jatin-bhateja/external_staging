
import jdk.incubator.vector.*;

class reinterpret {
  public static void workload(int [] arr, byte [] res) {
      IntVector IV = IntVector.fromArray(IntVector.SPECIES_256, arr, 0);
      Vector<Byte> BV = IV.reinterpret(ByteVector.SPECIES_256);
      ((ByteVector)(BV)).intoArray(res,0);
  }

  public static void main(String [] args) {
     int []  arr = new int[8];
     byte [] res = new byte[32];

     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = i+1;

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       workload(arr, res);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       workload(arr, res);

     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);

     for (var elem : res) {
       System.out.println(elem + " ");
     }
  }
}
