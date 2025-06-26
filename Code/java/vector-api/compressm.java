
import jdk.incubator.vector.*;

class compressm {
  public static final VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_256;

  static int micro(boolean [] arr, boolean [] r, int ctr) {
    for(int i = 0, j = 0; i < arr.length; i+= SPECIES.length()) {
        VectorMask mask = VectorMask.fromArray(SPECIES, arr, i);
        mask = mask.compress();
        mask.intoArray(r, j);
        j += mask.trueCount();
    }
    return r[ctr] ? 1 : 0;
  }

  static int micro_scalar(boolean [] arr, boolean [] r, int ctr) {
    for(int i = 0, j = 0; i < arr.length; i++) {
      if (arr[i]) {
         r[j++] = true;
      }
    }
    return r[ctr] ? 1 : 0;
  }

  public static void main(String [] args) {
     int val = 0;
     boolean [] arr =  new boolean[4096];
     boolean [] res =  new boolean[4096];
     for(int i = 0; i < arr.length; i++) {
       arr[i] = i % 2 == 0;
     }

     for(int i = 0 ; i < 100000 ;i++) {
         val += micro(arr, res, i & 1023);
     }

     val = 0;
     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 500000 ;i++) {
         val += micro(arr, res, i & 1023);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[Time] " + (t2-t1) +" ms" + " [Res] " + val);

     for(int i = 0 ; i < 100000 ;i++) {
         val += micro_scalar(arr, res, i & 1023);
     }

     val = 0;
     t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 500000 ;i++) {
         val += micro_scalar(arr, res, i & 1023);
     }
     t2 = System.currentTimeMillis();
     System.out.println("[Time] " + (t2-t1) +" ms" + " [Res] " + val);
  }
}
