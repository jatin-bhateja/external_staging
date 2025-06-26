

import jdk.incubator.vector.*;


class addlanes {
  public static short workload(boolean [] mask, short [] a) {
     ShortVector IV = ShortVector.fromArray(ShortVector.SPECIES_128, a, 0);
     VectorMask<Short> MV = IV.maskFromArray(mask, 0); 
     return IV.addLanes(MV);
  }

  public static void main(String [] args) {
     long r = 0;
     boolean [] mask = {
       true,false,true,true,
       true,true,true,true,
     };

/*
     short [] a = {
       512,512,512,512,
       512,512,512,512,
       512,512,512,512,
       512,512,512,512,
     };
*/
     short [] a = {
       1,1,1,1,
       1,1,1,1,
     };

     for(int i = 0 ; i < 100000 ;i++) {
       r += (long)workload(mask, a);
     }

     System.out.println("r = " + r / 100000);
  }
}
