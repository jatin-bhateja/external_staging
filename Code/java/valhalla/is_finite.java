
import jdk.incubator.vector.*;
import java.util.Arrays;

public class is_finite {
    public static final int INVOC_COUNT = 10000;
    public static final VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_128;
  
    public static void micro(boolean [] res, double [] a, boolean [] mask) {
    //public static long micro(boolean [] res, double [] a, boolean [] mask) {
        VectorMask<Double> vmask = VectorMask.fromArray(SPECIES, mask, 0);

        for (int ic = 0; ic < INVOC_COUNT; ic++) {
            for (int i = 0; i < a.length; i += SPECIES.length()) {
                DoubleVector av = DoubleVector.fromArray(SPECIES, a, i);
                VectorMask<Double> mv = av.test(VectorOperators.IS_FINITE, vmask);
                mv.intoArray(res, i);
                //res += mv.toLong(); 
            }
        }
        //return res;
    }

    public static double [] cornerCases = { Double.MAX_VALUE, Double.MIN_VALUE, Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY, Double.NaN, 0.0, -0.0};

    public static void main(String [] args) {
        double [] arr = new double[1024];
        boolean [] res = new boolean[1024];
        boolean [] mask = new boolean[2];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = cornerCases[i % cornerCases.length];
        }
        mask[0] = false;
        mask[1] = false;
        //for (int i = 0; i < 1000; i++) {
            micro(res, arr, mask);
        //}
        for (int i = 0; i < 16; i++) {
            System.out.println("[elem : mask : res] = " + arr[i] + ":" + mask[i&1] + ":" + res[i]);
        }
        mask[0] = true;
        mask[1] = false;
            micro(res, arr, mask);
        //System.out.println("[inp] " + Arrays.toString(Arrays.copyOfRange(arr, 0, 16)));
        //System.out.println("[mask] " + Arrays.toString(mask));
        for (int i = 0; i < 16; i++) {
            System.out.println("[elem : mask : res] = " + arr[i] + ":" + mask[i&1] + ":" + res[i]);
        }
    }
}
