
import java.util.Arrays;
import jdk.incubator.vector.*;
public class load_masked {
    public static final VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_256;
    public static final VectorMask<Double> mask = VectorMask.fromLong(SPECIES, 1);
    public static void micro (double [] dst, double [] src) {
        DoubleVector.fromArray(SPECIES, src, 0, mask).intoArray(dst, 0);
    }
    public static void main(String [] args) {
        double [] src = {1.0, 1.0, 1.0, 1.0};
        double [] dst = new double[4];
        for (int i = 0; i < 10000; i++) {
            micro(dst, src);
        }
        System.out.println(Arrays.toString(dst));
    }
}

