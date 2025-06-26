

import jdk.incubator.vector.*;

class test {
  public static void workload(int [] a , int [] b, int [] r) {
     IntVector VA = IntVector.fromArray(IntVector.SPECIES_256, a, 0);
     IntVector VB = IntVector.fromArray(IntVector.SPECIES_256, b, 0);
     IntVector T1 = VA.add(VB);
     IntVector T2 = T1.add(T1);
     T2.add(10).intoArray(r, 0);    
  }

  public static void main(String [] args) {
    int temp = 0;
    int [] a = new int[8];
    int [] b = new int[8];
    int [] r = new int[8];

    for(int i = 0 ; i < 8 ; i++) {
       a[i] = i;
       b[i] = i + 10;
    }

    for(int i = 0 ; i < 1000000 ; i++)
      workload(a, b, r);

    System.out.println("Res = " + r[3]); 
  }
}
