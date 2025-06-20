

import jdk.incubator.vector.*;

class test {
   public static void workload(int [] a, int [] b , int [] res) {
       assert a.length == b.length && a.length == res.length;
       int i = 0;
       for (; i < a.length ; i+=IntVector.SPECIES_256.length()) {
           IntVector IA = IntVector.fromArray(IntVector.SPECIES_256, a, i);
           IntVector IB = IntVector.fromArray(IntVector.SPECIES_256, b, i);
           IA.add(IB).intoArray(res,i);
       }
       for (; i < a.length; i++) {
           res[i] = a[i] + b[i];
       }
   }


   public static void main(String [] args) {
      int [] a = {1,2,3,4,5,6,7,8};
      int [] b = {1,2,3,4,5,6,7,8};
      int [] r = new int[8];
      for (int i = 0; i < 100000 ; i++) {
         workload(a, b, r);
      }
      System.out.println("Res = " + r[3]);
   }

}
