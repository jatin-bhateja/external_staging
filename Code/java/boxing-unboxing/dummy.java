
import jdk.incubator.vector.*;
import jdk.incubator.vector.Vector.Shape;

class dummy {
  public static FloatVector.FloatSpecies S256 = FloatVector.species(Shape.S_256_BIT);

  public static void dummyAPI1(float [] arr, float [] res, float init) {
      FloatVector vec = FloatVector.fromArray(S256, arr, 0);
      vec.dummyUnboxingBcast(init).intoArray(res, 0);
  }
  public static void dummyAPI2(float [] arr, float [] res, float init) {
      FloatVector vec = FloatVector.fromArray(S256, arr, 0);
      vec.dummyBcast(init).intoArray(res, 0);
  }

  public static void main(String [] args) {
     float [] arr = new float[8];
     float [] res = new float[8];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = i+1;

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       dummyAPI1(arr, res, (float)i);

     long start1 = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       dummyAPI1(arr, res, (float)i);

     long time1 = System.currentTimeMillis() - start1;
     for (var elem : res) 
       System.out.println("res elem " + elem);
     System.out.println("Time (unboxing + oper + boxing) = " + time1);

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       dummyAPI2(arr, res, (float)i);

     long start2 = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       dummyAPI2(arr, res, (float)i);

     long time2 = System.currentTimeMillis() - start2;
     for (var elem : res) 
       System.out.println("res elem " + elem);
     System.out.println("Time (vector + oper) = " + time2);
  }
}
