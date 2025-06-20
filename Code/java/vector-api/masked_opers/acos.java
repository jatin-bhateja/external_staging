
import jdk.incubator.vector.*;

class acos {
  public static VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;
  public static void workload(float [] arr, float [] res) {
      FloatVector vec = FloatVector.fromArray(SPECIES, arr, 0);
      vec.lanewise(VectorOperators.ACOS).intoArray(res,0);
  }

  public static void main(String [] args) {
     float [] arr = new float[8];
     float [] res = new float[8];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = -i;

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
