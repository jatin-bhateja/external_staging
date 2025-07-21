
import jdk.incubator.vector.*;

public class StoreMaskOptFloat {
    public static VectorSpecies<Float> FSP = FloatVector.SPECIES_PREFERRED;

    public static long micro(float [] src1, float [] src2) {
       return FloatVector.fromArray(FSP, src1, 0)
                         .compare(VectorOperators.GT,
                                  FloatVector.fromArray(FSP, src2, 0))
                         .toLong();
    }

    public static void main(String [] args) {
        long res = 0;
        float [] src1 = {1.0f, 2.0f, 3.0f, 4.0f, 5.0f, 6.0f, 7.0f, 8.0f};
        float [] src2 = {10.0f, 20.0f, 30.0f, 40.0f, 50.0f, 60.0f, 70.0f, 80.0f};
        for (int i = 0; i < 100000; i++) {
            res += micro(src1, src2); 
        }
        System.out.println("[res] " + res);
    }
}
