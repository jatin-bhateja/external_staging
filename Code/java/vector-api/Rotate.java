
import jdk.incubator.vector.*;
import jdk.incubator.vector.Vector.Shape;

class rotate {
  public static IntVector.Species S256 = IntVector.SPECIES_256;

  public static void rotateVec(int [] arr, int [] res, int j) {
      IntVector vec = IntVector.fromArray(S256, arr, 0);
      vec.rotateEL(3).intoArray(res,0);
      //vec.rotateEL(j).intoArray(res,0);
  }

/*
  public static void rotateVecNew1(int [] arr, int [] res, int j) {
      int L = S256.length();
      IntVector vec = IntVector.fromArray(S256, arr, 0);
      int [] mask = new int[L];
      j = j % L;
      for (int i = 0 ; i < mask.length ; i++) {
        mask[i] = (L - j + i) % L;
      }
      vec.rearrange(IntVector.shuffleFromArray(S256,mask, 0)).intoArray(res,0); 
  }
*/

/*
  public static void rotateVecNew(int [] arr, int [] res, int [] mask, int j) {
      IntVector vec = IntVector.fromArray(S256, arr, 0);
      vec.rearrange(IntVector.shuffleFromArray(S256,mask, 0)).intoArray(res,0); 
  }
*/

  public static void main(String [] args) {
     int [] arr = new int[8];
     int [] res = new int[8];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = i+1;

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       rotateVec(arr, res, i);

     // Old Rotate
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       rotateVec(arr, res, i);
     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);

     for (var elem : res) {
       System.out.println(elem + " ");
     }
      
/*
     // warmup
     for (int i = 0 ; i < 700000 ; i++)
       rotateVecNew1(arr, res, i);

     // new rotate opt1
     start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       rotateVecNew1(arr, res, i);
     time = System.currentTimeMillis() - start;
     System.out.println("time = " + time);

     for (var elem : res) {
       System.out.println(elem + " ");
     }

     // warmup
     int mask [] = {-5,-6,-7,0,-1,-2,-3,-4};
     for (int i = 0 ; i < 700000 ; i++)
       rotateVecNew(arr, res, mask, i);

     // new rotate opt
     start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       rotateVecNew(arr, res, mask, i);
     time = System.currentTimeMillis() - start;
     System.out.println("time = " + time);

     for (var elem : res) {
       System.out.println(elem + " ");
     }
*/

  }
}
