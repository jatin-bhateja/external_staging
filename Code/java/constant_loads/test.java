

import jdk.incubator.vector.*;

class test {
   public static int doSum(int index) {
     final int [] arr = {1,2,3,4};
     IntVector.IntSpecies I128 = IntVector.species(Vector.Shape.S_128_BIT);
     IntVector iv = IntVector.fromArray(I128, arr, 0);
     return iv.length();
   }
   public static void main(String [] args) {
     int Res = 0;
     for(int i = 0 ; i < 100000 ;i++)
       Res += doSum(i);
     System.out.println("Res = " + Res);
   }
}
