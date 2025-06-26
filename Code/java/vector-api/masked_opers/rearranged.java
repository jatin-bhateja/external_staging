
import jdk.incubator.vector.*;

public class rearranged {
  public static VectorSpecies<Integer> ISPECIES = IntVector.SPECIES_128;

  public static void workload(int [] arr, int [] shuf, int [] res) {
     VectorShuffle<Integer> shufv = VectorShuffle.fromArray(ISPECIES, shuf, 0);
     IntVector vec = IntVector.fromArray(ISPECIES, arr, 0);
     vec.rearrange(shufv).intoArray(res, 0);
  }

  public static void main(String [] args) {
     int [] arr = new int[4];
     int [] res = new int[4];
     int [] shuf = {3,2,1,0};
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = (int)i;

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       workload(arr, shuf, res);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       workload(arr, shuf, res);

     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);

     for (var elem : res) {
       System.out.println(elem + " ");
     }
  }
}
