

import jdk.incubator.vector.*;


class test {
  public static void workload(float [] r, float [] a, float [] b) {
     FloatVector AV = FloatVector.fromArray(FloatVector.SPECIES_256, a, 0);
     FloatVector BV = FloatVector.fromArray(FloatVector.SPECIES_256, a, 0);
     FloatVector MV = AV.max(BV);
     MV.neg().intoArray(r, 0);
  }

  public static void main(String [] args) {
     float [] a = new float[8];
     float [] b = new float[8];
     float [] r = new float[8];

     for (int i = 0; i < 7 ;i++) {
        a[i] =  i * i;
        b[i] =  i + 1.0f;
     }

     for(int i = 0 ; i < 100000 ;i++) {
       workload(r, a, b);
     }

     for (int i = 0; i < 7 ;i++) {
       System.out.println("r["+i+"] = " + r[i]);
     }
  }
}
