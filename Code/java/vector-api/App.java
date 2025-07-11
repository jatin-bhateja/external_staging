
import jdk.incubator.vector.*;
import java.util.Arrays;

public class App {
    public static void main(String[] args) throws Exception {
        float[] src = { 1.0f, 2.0f, 3.0f, 4.0f, 5.0f, 6.0f, 7.0f, 8.0f, 9.0f, 10.0f, 11.0f, 12.0f, 13.0f, 14.0f, 15.0f,
                16.0f };
        float[] dst = new float[16];
        var vec = FloatVector.fromArray(FloatVector.SPECIES_512, src, 0);
        vec = vec.lanewise(VectorOperators.MUL, vec);
        vec.intoArray(dst, 0);
        System.out.println(Arrays.toString(dst));
    }
}
