
import jdk.incubator.vector.FloatVector;
import jdk.incubator.vector.Vector.Shape;
import jdk.incubator.vector.Vector;
import java.util.stream.IntStream;
import java.util.Arrays;

public class Shift {
    static final FloatVector.FloatSpecies SPECIES =
            FloatVector.species(Shape.S_256_BIT);

    static final int ITER = 1;
    static final int SIZE = 8;
    static float[] a = new float[SIZE];

    static void printvec(float [] vec) {
      System.out.println("vec = [ ");
      for (int i = 0 ; i < vec.length ; i++) 
         System.out.println(vec[i] + " ");
      System.out.println(" ]");
    }

    static void workload() {
      printvec(a);
      FloatVector av = SPECIES.fromArray(a, 0);
      av = av.rotateEL(2);
      av.intoArray(a,0);
      printvec(a);
      av.rotateER(2).intoArray(a,0);
      printvec(a);
    }

    public static void main(String args[]) {
        for (int i = 0; i < SIZE; i++) {
          a[i] = i + 1.0f;
        }
        for (int i = 0; i < ITER; i++)
          workload();
    }
}
