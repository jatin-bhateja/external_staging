

import jdk.incubator.vector.*;


class addlanes {
  public static int workload(boolean [] mask, int [] a) {
     IntVector IV = IntVector.fromArray(IntVector.SPECIES_256, a, 0);
     VectorMask<Integer> MV = IV.maskFromArray(mask, 0); 
     //return IV.addLanes(MV);
     return IV.addLanes();
  }

  public static void main(String [] args) {
     int r = 0;
     boolean [] mask = {
       true,true,true,true,
       true,true,true,true,
       true,true,true,true,
       true,true,true,true,
     };


/*
     int [] a = {
       512,512,512,512,
       512,512,512,512,
       512,512,512,512,
       512,512,512,512,
     };
*/

     int [] a = {
       1,1,1,1,
       1,1,1,1,
       1,1,1,1,
       1,1,1,1,
     };

     for(int i = 0 ; i < 100000 ;i++) {
       r += workload(mask, a);
     }

     System.out.println("r = " + r / 100000);
  }
}
