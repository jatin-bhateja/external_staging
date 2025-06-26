
import jdk.incubator.vector.*;

class reinterpret {
  public static void workload(byte [] arr, short [] res) {
      ByteVector BV = ByteVector.fromArray(ByteVector.SPECIES_128, arr, 0);
      Vector<Short> SV = BV.cast(ShortVector.SPECIES_256);
      ((ShortVector)(SV)).intoArray(res,0);
  }

  public static void main(String [] args) {
     byte []  arr = new byte[16];
     short [] res = new short[16];

     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = (byte)(i+1);

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
