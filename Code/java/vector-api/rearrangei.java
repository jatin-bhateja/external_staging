

import jdk.incubator.vector.*;

class test {
  public static void shuffle(int [] arr, int [] mask) {
     IntVector Mask = IntVector.fromArray(IntVector.species(Vector.Shape.S_256_BIT), mask, 0);
     IntVector BV = IntVector.fromArray(IntVector.species(Vector.Shape.S_256_BIT), arr, 0);
     BV.rearrange(Mask.toShuffle()).intoArray(arr,0);
  }

  public static void main(String [] args) {
     int [] arr = new int[32];
     int [] mask = new int[32];
     for(int i = 0 ; i < 32 ; i++)
       arr[i] = i + 10;
     for(int i = 0 ; i < 32 ; i++)
       mask[i] = 32 - (i + 1);
     for( int i = 0 ; i < 100001 ; i++)
       shuffle(arr, mask);
     for(int i = 0 ; i < 32 ; i++)
       System.out.println(" " + arr[i] + " ");
  }
}
