
import jdk.incubator.vector.*;

class rotatel {
  public static VectorSpecies SPECIES = LongVector.SPECIES_256;
  public static VectorMask<Long> mask;
  public static final int COUNTER = 10;
 
  public static void micro1(long [] arr, long [] res, int k) {
      Vector<Long> shift = SPECIES.broadcast(2);
      for (int i = 0 ; i < COUNTER ; i++)  {
        for (int j = 0 ; j < arr.length ; j+=SPECIES.length()) {
           LongVector vec = LongVector.fromArray(SPECIES, arr, j);
           vec.lanewise(VectorOperators.ROR, shift, mask).intoArray(res,j);
        }
      }
  }

  public static void micro2(long [] arr, long [] res, int k) {
      for (int i = 0 ; i < COUNTER ; i++)  {
        for (int j = 0 ; j < arr.length ; j+=SPECIES.length()) {
           LongVector vec = LongVector.fromArray(SPECIES, arr, j);
           vec.lanewise(VectorOperators.ROR, k, mask).intoArray(res,j);
        }
      }
  }

  public static void micro3(long [] arr, long [] res, int k) {
      for (int i = 0 ; i < COUNTER ; i++)  {
        for (int j = 0 ; j < arr.length ; j+=SPECIES.length()) {
           LongVector vec = LongVector.fromArray(SPECIES, arr, j);
           vec.lanewise(VectorOperators.ROR, 34, mask).intoArray(res,j);
        }
      }
  }

  public static void workload(long [] arr, long [] res, int algo) {
    switch(algo) {
      case 1 : micro1(arr, res, 1); break;
      case 2 : micro2(arr, res, 2); break;
      case 3 : micro3(arr, res, 3); break;
      default: break;
    }
  } 

  public static void main(String [] args) {
     int algo = Integer.parseInt(args[0]);
     long [] arr = new long[1024];
     long [] res = new long[1024];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = 0xC000FFFF;

     mask = VectorMask.fromLong(SPECIES, 15);
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
