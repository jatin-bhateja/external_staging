
import jdk.incubator.vector.*;

class rotateb {
  public static VectorSpecies SPECIES = ByteVector.SPECIES_512;
  public static final int COUNTER = 10;
 
  public static void micro1(byte [] arr, byte [] res, int k) {
      Vector<Byte> shift = SPECIES.broadcast(2);
      for (int i = 0 ; i < COUNTER ; i++)  {
        for (int j = 0 ; j < arr.length ; j+=SPECIES.length()) {
           ByteVector.fromArray(ByteVector.SPECIES_256, arr, j)
           .lanewise(VectorOperators.ROR, shift).intoArray(res,j);
        }
      }
  }

  public static void micro2(byte [] arr, byte [] res, int k) {
      for (int i = 0 ; i < COUNTER ; i++)  {
        for (int j = 0 ; j < arr.length ; j+=SPECIES.length()) {
           ByteVector.fromArray(ByteVector.SPECIES_256, arr, j)
           .lanewise(VectorOperators.ROR, k).intoArray(res,j);
        }
      }
  }

  public static void micro3(byte [] arr, byte [] res, int k) {
      for (int i = 0 ; i < COUNTER ; i++)  {
        for (int j = 0 ; j < arr.length ; j+=SPECIES.length()) {
           ByteVector.fromArray(ByteVector.SPECIES_256, arr, j)
           .lanewise(VectorOperators.ROR, 34).intoArray(res,j);
        }
      }
  }

  public static void workload(byte [] arr, byte [] res, int algo) {
    switch(algo) {
      case 1 : micro1(arr, res, 1); break;
      case 2 : micro2(arr, res, 2); break;
      case 3 : micro3(arr, res, 3); break;
      default: break;
    }
  } 

  public static void main(String [] args) {
     int algo = Integer.parseInt(args[0]);
     byte [] arr = new byte[1024];
     byte [] res = new byte[1024];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = 0x0F;

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
