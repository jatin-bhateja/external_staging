
import jdk.incubator.vector.*;
import java.util.Arrays;

public class App {
    public static float[] src = { 1.0f, 2.0f, 3.0f, 4.0f, 5.0f, 6.0f, 7.0f, 8.0f, 9.0f, 10.0f, 11.0f, 12.0f, 13.0f, 14.0f, 15.0f, 16.0f };
    public static FloatVector vec = FloatVector.broadcast(FloatVector.SPECIES_512, 1.0f);
    public static void micro(float [] src, float [] dst) {
        var vec = FloatVector.fromArray(FloatVector.SPECIES_512, src, 0);
        vec.lanewise(VectorOperators.ADD, vec)
           .intoArray(dst, 0);
    }
    public static void main(String[] args) throws Exception {
        float[] dst = new float[16];
        for(int i = 0; i < 10000; i++) {
            micro(src, dst);
        }
        System.out.println(Arrays.toString(dst));
    }
}

