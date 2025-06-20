
import jdk.incubator.vector.*;
import java.util.Arrays;

public class castShape {
    public static void micro(long [] dst, float [] src) {
        FloatVector.fromArray(FloatVector.SPECIES_128, src, 0)
                   .castShape(LongVector.SPECIES_256, 0)
                   .reinterpretAsLongs()
                   .intoArray(dst, 0);
    }

    public static void main(String [] args) {
        float [] src =  {1.0f, 2.0f, 3.0f, 4.0f};
        long  [] dst = new long[4];

        for (int i = 0; i < 100000; i++) {
            micro(dst, src);
        }
        System.out.println("[res] " + Arrays.toString(dst));
    }  
}
