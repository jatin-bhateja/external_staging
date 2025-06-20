

import jdk.incubator.vector.*;


class mixed {
  public static void workload(int [] r, int [] a , int [] b) {
     IntVector IV1 = IntVector.fromArray(IntVector.SPECIES_256, a, 0);
     IntVector IV2 = IntVector.fromArray(IntVector.SPECIES_256, b, 0);
     IntVector IV3 = IntVector.fromArray(IntVector.SPECIES_256, a, 4);
     IntVector T1 = IV1.lanewise(VectorOperators.ADD, IV2);
     IntVector T2 = T1.lanewise(VectorOperators.SUB, IV3);
     ((IntVector)T2).intoArray(r, 0);
  }

  public static void main(String [] args) {
     int [] a = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
     int [] b = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
     int [] r = {0,0,0,0,0,0,0,0};
     for(int i = 0 ; i < 100000 ;i++)
       workload(r, a, b);
     
     for(int i = 0; i  < 8 ; i++)
       System.out.println("r[" + i + "] = " + r[i]);
  }
}
