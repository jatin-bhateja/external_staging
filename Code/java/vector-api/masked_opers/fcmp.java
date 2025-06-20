
import jdk.incubator.vector.*;

class fcmp {
  public static VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;

  public static VectorMask workload(float [] arr, float [] res) {
      boolean [] mask_arr = {true, true, true, true, false, false, false, false};
      VectorMask<Float> mask = VectorMask.fromArray(SPECIES, mask_arr, 0);
      FloatVector vec = FloatVector.fromArray(SPECIES, arr, 0);
      //VectorMask<Float> mv = vec.compare(VectorOperators.EQ, vec);
      return vec.compare(VectorOperators.EQ, vec);
      //return mv.allTrue() == true ? 1 : 0;
  }

  public static void main(String [] args) {
     int ret = 0;
     float [] arr = new float[8];
     float [] res = new float[8];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = -i;

     VectorMask val = null;
     // Warmup
     for (int i = 0 ; i < 700000 ; i++) {
       val = workload(arr, res);
       ret += val.firstTrue();
     }
     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++) {
       val = workload(arr, res);
       ret += val.firstTrue();
     }
     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time + " Res = " + ret);
  }
}
