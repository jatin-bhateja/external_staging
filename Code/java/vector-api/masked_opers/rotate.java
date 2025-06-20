
import jdk.incubator.vector.*;

class rotate {
  public static VectorSpecies SPECIES = IntVector.SPECIES_256;
  public static final int COUNTER = 10;
  public static VectorMask<Integer> mask;
 
  public static void micro1(int [] arr, int [] res, int k) {
      Vector<Integer> shift = SPECIES.broadcast(2);
      for (int i = 0 ; i < COUNTER ; i++)  {
        for (int j = 0 ; j < arr.length ; j+=SPECIES.length()) {
           IntVector vec = IntVector.fromArray(SPECIES, arr, j);
           vec.lanewise(VectorOperators.ROL, shift, mask).intoArray(res,j);
        }
      }
  }

  public static void micro2(int [] arr, int [] res, int k) {
      for (int i = 0 ; i < COUNTER ; i++)  {
        for (int j = 0 ; j < arr.length ; j+=SPECIES.length()) {
           IntVector vec = IntVector.fromArray(SPECIES, arr, j);
           vec.lanewise(VectorOperators.ROL, k, mask).intoArray(res,j);
        }
      }
  }

  public static void micro3(int [] arr, int [] res, int k) {
      for (int i = 0 ; i < COUNTER ; i++)  {
        for (int j = 0 ; j < arr.length ; j+=SPECIES.length()) {
           IntVector vec = IntVector.fromArray(SPECIES, arr, j);
           vec.lanewise(VectorOperators.ROL, 10, mask).intoArray(res,j);
        }
      }
  }

  public static void workload(int [] arr, int [] res, int algo) {
    switch(algo) {
      case 1 : micro1(arr, res, 1); break;
      case 2 : micro2(arr, res, 2); break;
      case 3 : micro3(arr, res, 3); break;
      default: break;
    }
  } 

  public static void main(String [] args) {
     int algo = Integer.parseInt(args[0]);
     int [] arr = new int[1024];
     int [] res = new int[1024];
     mask = VectorMask.fromLong(SPECIES, 15);
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = 0xC000FFFF;

     // Warmup
     for (int i = 0 ; i < 10000 ; i++)
       workload(arr, res, algo);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 10000 ; i++)
       workload(arr, res, algo);
     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);

     for (int i = 0 ; i < SPECIES.length() ; i++) {
       System.out.println(res[i] + " ");
     }
  }
}
