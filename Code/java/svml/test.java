
import jdk.incubator.vector.*;
import java.util.stream.IntStream;

public class test {

    public static VectorSpecies<Float> FSP = FloatVector.SPECIES_256;

    public static float micro(float [] vals, int ctr) {
        return FloatVector.fromArray(FSP, vals, ctr)
                          .lanewise(VectorOperators.TANH)
                          .reduceLanes(VectorOperators.ADD);
    }

    public static void main(String [] args) {
        float res = 0.0f;
        float [] vals = new float[1024];
        IntStream.range(0, vals.length).forEach(i -> { vals[i] = (float)i; });
        for (int i = 0; i < 10000; i++) {
            res += micro(vals, i & 511); 
        }
        System.out.println("[res] " + res);
    }
}
