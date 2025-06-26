

import jdk.incubator.vector.*;

class test {
  public static void shuffle(double [] arr, double [] mask) {
     DoubleVector Mask = DoubleVector.fromArray(DoubleVector.species(Vector.Shape.S_256_BIT), mask, 0);
     DoubleVector BV = DoubleVector.fromArray(DoubleVector.species(Vector.Shape.S_256_BIT), arr, 0);
     BV.rearrange(Mask.toShuffle()).intoArray(arr,0);
  }

  public static void main(String [] args) {
     double [] arr = new double[32];
     double [] mask = new double[32];
     for(int i = 0 ; i < 32 ; i++)
       arr[i] = (double)(i + 10);
     for(int i = 0 ; i < 32 ; i++)
       mask[i] = (double)(32 - (i + 1));
     for( int i = 0 ; i < 100001 ; i++)
       shuffle(arr, mask);
     for(int i = 0 ; i < 32 ; i++)
       System.out.println(" " + arr[i] + " ");
  }
}
