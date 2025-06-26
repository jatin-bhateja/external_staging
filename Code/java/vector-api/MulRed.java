
import jdk.incubator.vector.*;
import java.util.Arrays;
import java.util.Random;

public class MulRed {
    static final int SIZE = 64;
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_MAX;
    static float[] a = new float[SIZE];

    float micro_bad() {
       FloatVector vec = FloatVector.broadcast(SPECIES, 1.0f);
       for (int i = 0; i < SIZE; i+= SPECIES.length()) {
           vec = FloatVector.fromArray(SPECIES, a, i)
                            .lanewise(VectorOperators.MUL, vec);
       }
       return vec.reduceLanes(VectorOperators.MUL);
    }

    float micro_good() {
       float res = 1.0f;
       for (int i = 0; i < SIZE; i+= SPECIES.length()) {
           res = res * FloatVector.fromArray(SPECIES, a, i)
                            .reduceLanes(VectorOperators.MUL);
       }
       return res;
    }

    public static void main(String args[]) {
        Random r = new Random(1024);
        for (int i = 0; i < SIZE; i++) {
            a[i] = r.nextFloat();
        }
        System.out.println("ARRAY => " + Arrays.toString(a));
        float res = 0.0f;
        MulRed obj = new MulRed();
        for (int i = 0; i < 10000; i++) {
           res += obj.micro_bad();
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 10000; i++) {
           res += obj.micro_bad();
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time micro_bad] " + (t2-t1) + " ms  [res] " + res);

        res = 0.0f;
        for (int i = 0; i < 10000; i++) {
           res += obj.micro_good();
        }
        t1 = System.currentTimeMillis();
        for (int i = 0; i < 10000; i++) {
           res += obj.micro_good();
        }
        t2 = System.currentTimeMillis();
        System.out.println("[time micro_good] " + (t2-t1) + " ms  [res] " + res);
    }
}
