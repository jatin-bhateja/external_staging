
import jdk.incubator.vector.*;

class index {
  public static VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_512;

  public static VectorMask micro(int offset, int alength, ByteVector iota, int vlength) {
     int indexLimit = Math.max(0, Math.min(alength - offset, vlength));
     VectorMask badMask =
         iota.compare(VectorOperators.GE, iota.broadcast(indexLimit));
     if (offset < 0) {
         int firstGoodIndex = -Math.max(offset, -vlength);
         VectorMask badMask2 =
             iota.compare(VectorOperators.LT, iota.broadcast(firstGoodIndex));
         if (indexLimit >= vlength) {
             badMask = badMask2; 
         } else {
             badMask = badMask.or(badMask2);
         }
     }
     return badMask;
  }

  public static void main(String [] args) {
    byte [] arr = new byte[1024];
    byte [] res = new byte[1024];
    int ret = 0;
    for (int i = 0 ; i < arr.length ; i++)
      arr[i] = (byte)i;

    ByteVector vec = ByteVector.fromArray(SPECIES, arr, 0);
    // Warmup
    for (int i = -100000 ; i < 700000 ; i++) {
      VectorMask mask =  micro(i, SPECIES.length(), vec , SPECIES.length());
      ret += mask.trueCount();
    }

    // Perf
    long start = System.currentTimeMillis();
    for (int i = -10000 ; i < 10000 ; i++) {
      VectorMask mask =  micro(i, SPECIES.length(), vec , SPECIES.length());
      ret += mask.trueCount();
    }
    long time = System.currentTimeMillis() - start;
    System.out.println("[Time] " + time + " ms  [Res] " + ret );
  }
}
