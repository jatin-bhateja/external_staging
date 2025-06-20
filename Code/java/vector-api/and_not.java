
import jdk.incubator.vector.*;

class test {
  public static void workload(int [] arr,  int [] res, int j) {
      boolean [] mask = {true, false, true, false};
      VectorMask<Integer> mv = VectorMask.fromArray(IntVector.SPECIES_128, mask,0);
      IntVector SV1 = IntVector.fromArray(IntVector.SPECIES_128, arr, 0);
      IntVector SV2 = IntVector.fromArray(IntVector.SPECIES_128, arr, 0);
      IntVector IV = SV1.lanewise(VectorOperators.AND_NOT, SV2, mv);
      IV.intoArray(res,0);
  }

  public static void main(String [] args) {
     int  [] arr = new int[4];
     int [] res = new int[4];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = (i+1);

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
