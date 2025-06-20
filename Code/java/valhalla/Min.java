
import jdk.incubator.vector.*;
import java.util.Arrays;

public class Min {
    static final int SIZE = 1024;
    static final VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;
    static float[] a = new float[SIZE];
    static float[] b = new float[SIZE];
    static float[] r = new float[SIZE];;

    static void workload() {
       FloatVector av = FloatVector.fromArray(SPECIES,a, 0);
       FloatVector bv = FloatVector.fromArray(SPECIES,b, 0);
       av.min(bv).intoArray(r,0);
    }

    public static void main(String args[]) {
        for (int i = 0; i < SIZE; i++) {
            a[i] = 1f;
        }
        for (int i = 0; i < 1000000; i++)
            workload();
    }
}
