

import jdk.incubator.vector.*;


class add {
  public static void workload(boolean cond, int [] r, int [] a , int [] b) {
     IntVector IV1 = IntVector.fromArray(IntVector.SPECIES_256, a, 0);
     IntVector IV2 = IntVector.fromArray(IntVector.SPECIES_256, b, 0);
     IntVector IV3 = IntVector.fromArray(IntVector.SPECIES_256, a, 8);
     IntVector IV4 = IntVector.fromArray(IntVector.SPECIES_256, b, 8);

     IntVector T1;
     if (cond)
        T1 = IV1.add(IV2);
     else
        T1 = IV3.add(IV4);

     // Phi for T1
     if (cond)
        T1.add(10).intoArray(r,0);
     else
        T1.add(20).intoArray(r,0);

  }

  public static void main(String [] args) {
     int [] a = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,};
     int [] b = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,};
     int [] r = new int[32];
     for(int i = 0 ; i < 100000 ;i++) {
       workload(i % 2 == 0, r, a, b);
     }
     for(int i = 0; i  < 8 ; i++)
       System.out.println("r[" + i + "] = " + r[i]);
  }
}
