

import jdk.incubator.vector.*;


class andm {
  public static boolean flag = true;

  public static void leaf(VectorMask vec) {
    if (flag) {
       System.out.println(vec);
       flag = false;
    }
  }

  public static void workload(boolean [] r, boolean [] a , boolean [] b, int idx) {
     VectorMask IV1 = VectorMask.fromArray(IntVector.SPECIES_256, a, 0);
     VectorMask IV2 = VectorMask.fromArray(IntVector.SPECIES_256, b, idx);
     IV1 = IV1.and(IV2);
     leaf(IV1);
     IV1.intoArray(r, 0);
  }

  public static void main(String [] args) {
     boolean [] a = {
       true, false, true , false,
       true, false, true , false,
     };
     boolean [] b = {
       true, false, true , false,
       true, false, true , false,
     };
     boolean [] r = new boolean[8];
     for(int i = 0 ; i < 900000 ;i++) {
       if ( i == 70000 ) 
          workload(r, a, b, -1);
       else
          workload(r, a, b, 0);
     }
     for(int i = 0; i  < 8 ; i++)
       System.out.println("r[" + i + "] = " + r[i]);
  }
}
