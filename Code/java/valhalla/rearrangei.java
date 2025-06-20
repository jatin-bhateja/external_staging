

import jdk.incubator.vector.*;

class test {
  public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_128;

  public static void shuffle(int [] arr, int [] neworder) {
     VectorMask<Integer> mask = VectorMask.fromLong(SPECIES, 5);
     for (int i = 0;  i < SPECIES.loopBound(arr.length); i += SPECIES.length()) {
       IntVector IV = IntVector.fromArray(SPECIES, arr, i);
       VectorShuffle<Integer> shufflev = VectorShuffle.fromArray(SPECIES, neworder, i);
       IV.rearrange(shufflev, mask).intoArray(arr,i);
     }
  }

  public static void main(String [] args) {
     int [] arr = new int[32];
     int [] neworder = new int[32];
     for(int i = 0 ; i < 32 ; i++) {
       arr[i] = i;
       neworder[i] = i & 3;
     }
     for( int i = 0 ; i < 10000 ; i++)
       shuffle(arr, neworder);

     for(int i = 0 ; i < 32 ; i++)
       System.out.println(" " + arr[i] + " ");
  }
}
