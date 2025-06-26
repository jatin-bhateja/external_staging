

import jdk.incubator.vector.*;


class mixed {
  public static void workload(int [] r, int [] a , int [] b) {
     IntVector IV1 = IntVector.fromArray(IntVector.SPECIES_256, a, 0);
     IntVector IV2 = IntVector.fromArray(IntVector.SPECIES_256, b, 0);
     IntVector IV3 = IntVector.fromArray(IntVector.SPECIES_256, a, 4);
     IntVector IV4 = IntVector.fromArray(IntVector.SPECIES_256, b, 4);
     IntVector T1 = IV1.add(IV2);
     IntVector T2 = IV3.add(IV4);
     IntVector T3 = T1.add(T2);
     Vector<Integer> T4 = T3.reshape(IntVector.SPECIES_128);
     Vector<Integer> T5 = IntVector.broadcast(IntVector.SPECIES_128,10);
     IntVector T6 = ((IntVector)T4).mul(T5);
     Vector<Integer> T7 = T6.reshape(IntVector.SPECIES_256);
     ((IntVector)T7).intoArray(r, 0);
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
