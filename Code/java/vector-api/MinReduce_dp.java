
import jdk.incubator.vector.DoubleVector;
import jdk.incubator.vector.Vector.Shape;
import jdk.incubator.vector.Vector;
import java.util.stream.IntStream;
import java.util.Arrays;

public class MinReduce_dp {
    static final int SIZE = 1024;
    static double[] a = new double[SIZE];
    static double r;

    static void workload(DoubleVector.DoubleSpecies SPECIES) {
       DoubleVector av = DoubleVector.fromArray(SPECIES, a, 0);
       r = av.minAll();
    }

    public static void main(String args[]) {
        DoubleVector.DoubleSpecies SPECIES;
        for (int i = 0; i < SIZE; i++) {
            a[i] = Double.NaN;
        }
        a[0] = 0.0;
        SPECIES = DoubleVector.species(Shape.S_128_BIT);
        for (int i = 0; i < 1000000; i++)
          workload(SPECIES);
/*
        SPECIES = DoubleVector.species(Shape.S_512_BIT);
        for (int i = 0; i < 1000000; i++)
          workload(SPECIES);
        SPECIES = DoubleVector.species(Shape.S_256_BIT);
        for (int i = 0; i < 1000000; i++)
          workload(SPECIES);

*/
        System.out.println("Res " + r);
    }
}
