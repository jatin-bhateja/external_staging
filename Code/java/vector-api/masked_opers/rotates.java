
import jdk.incubator.vector.*;

class rotates {
  public static VectorSpecies SPECIES = ShortVector.SPECIES_256;
  public static final int COUNTER = 10;
 
  public static void micro1(short [] arr, short [] res, int k) {
      Vector<Short> shift = SPECIES.broadcast(2);
      for (int i = 0 ; i < COUNTER ; i++)  {
        for (int j = 0 ; j < arr.length ; j+=SPECIES.length()) {
           ShortVector vec = ShortVector.fromArray(ShortVector.SPECIES_256, arr, j);
           vec.lanewise(VectorOperators.ROL, shift).intoArray(res,j);
        }
      }
  }

  public static void micro2(short [] arr, short [] res, int k) {
      for (int i = 0 ; i < COUNTER ; i++)  {
        for (int j = 0 ; j < arr.length ; j+=SPECIES.length()) {
           ShortVector vec = ShortVector.fromArray(ShortVector.SPECIES_256, arr, j);
           vec.lanewise(VectorOperators.ROL, k).intoArray(res,j);
        }
      }
  }

  public static void micro3(short [] arr, short [] res, int k) {
      for (int i = 0 ; i < COUNTER ; i++)  {
        for (int j = 0 ; j < arr.length ; j+=SPECIES.length()) {
           ShortVector vec = ShortVector.fromArray(ShortVector.SPECIES_256, arr, j);
           vec.lanewise(VectorOperators.ROL, 34).intoArray(res,j);
        }
      }
  }

  public static void workload(short [] arr, short [] res, int algo) {
    switch(algo) {
      case 1 : micro1(arr, res, 1); break;
      case 2 : micro2(arr, res, 2); break;
      case 3 : micro3(arr, res, 3); break;
      default: break;
    }
  } 

  public static void main(String [] args) {
     int algo = Integer.parseInt(args[0]);
     short [] arr = new short[1024];
     short [] res = new short[1024];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = 0x0FFF;

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
