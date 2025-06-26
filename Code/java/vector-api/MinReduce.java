
import jdk.incubator.vector.FloatVector;
import jdk.incubator.vector.Vector.Shape;
import jdk.incubator.vector.Vector;
import java.util.stream.IntStream;
import java.util.Arrays;

public class MinReduce {
    static final int SIZE = 1024;
    static float[] a = new float[SIZE];
    static float r;

    static void workload(FloatVector.FloatSpecies SPECIES) {
       FloatVector av = FloatVector.fromArray(SPECIES, a, 0);
       r = av.minAll();
    }

    public static void main(String args[]) {
        FloatVector.FloatSpecies SPECIES;
        for (int i = 0; i < SIZE; i++) {
            a[i] = 1.0f + i;
        }
        a[7] = -5.0f;

/*
        SPECIES = FloatVector.species(Shape.S_64_BIT);
        for (int i = 0; i < 1000000; i++)
          workload(SPECIES);

        SPECIES = FloatVector.species(Shape.S_128_BIT);
        for (int i = 0; i < 1000000; i++)
          workload(SPECIES);
*/

        SPECIES = FloatVector.species(Shape.S_256_BIT);
        for (int i = 0; i < 1000000; i++)
          workload(SPECIES);

/*
        SPECIES = FloatVector.species(Shape.S_512_BIT);
        for (int i = 0; i < 1000000; i++)
          workload(SPECIES);
*/

        System.out.println("Res " + r);
    }
}
