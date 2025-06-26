
import jdk.incubator.vector.*;
import jdk.incubator.vector.Vector.Shape;
import java.util.stream.IntStream;
import java.util.Arrays;

public class test_r {
    static final DoubleVector.DoubleSpecies S256D =
            DoubleVector.species(Shape.S_256_BIT);

    static final int SIZE = 128;
    static final int ITERATIONS = 100000;

    static double[] ad = new double[SIZE];
    static double[] rd = new double[SIZE];;


    static void workloadD_minAll(DoubleVector.DoubleSpecies DS) {
       DoubleVector av;
       int ITERS = SIZE / DS.length();
       for (int i = 0, index = 0 ; i < ITERS; i++, index += DS.length()) {
         av = DoubleVector.fromArray(DS, ad, index);
         rd[i] = av.minAll();
       }
    }

    static void setup_data() {
      for (int i = 0; i < SIZE; i++) {
        ad[i] = 1.0 + i;
      }
      ad[5] = Double.NaN;
      ad[8] = -0.0;
      ad[9] = 0.0;
    }

    static void printresultD(DoubleVector.DoubleSpecies DS) {
      for (int i = 0; i < SIZE/ DS.length() ; i++)
        System.out.println("rd["+i+"] = "+rd[i]);
    }

    static void workloads() {
       for (int i = 0; i < ITERATIONS; i++)
         workloadD_minAll(S256D);   
       System.out.println("workloadF_256_maxAll");
       printresultD(S256D);
    }

    public static void main(String args[]) {
       setup_data();
       workloads();
    }
}
