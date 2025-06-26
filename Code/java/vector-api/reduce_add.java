

import jdk.incubator.vector.*;


class add {
  public static void workload(float [] r, float [] a) {
    int j = 0;
    for (int i = 0 ; i < a.length ; i += FloatVector.SPECIES_256.length()) {
      FloatVector IV1 = FloatVector.fromArray(FloatVector.SPECIES_256, a, i);
      r[j++] = IV1.reduceLanes(VectorOperators.ADD);
    }
  }

  public static void main(String [] args) {
    float [] a = {1.0f,2.0f,3.0f,4.0f,5.0f,6.0f,7.0f,8.0f,9.0f,10.0f,11.0f,12.0f,13.0f,14.0f,15.0f,16.0f};
    float [] r = {0.0f,0.0f};
    for(int i = 0 ; i < 100000 ;i++) {
      workload(r, a);
    }
    for(int i = 0; i  < r.length ; i++)
      System.out.println("r[" + i + "] = " + r[i]);
  }
}
