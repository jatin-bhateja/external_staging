
import jdk.incubator.vector.*;
import jdk.incubator.vector.Vector.Shape;
import java.util.stream.IntStream;
import java.util.Arrays;

public class Reduce {
    static final FloatVector.FloatSpecies S64F =
            FloatVector.species(Shape.S_64_BIT);
    static final FloatVector.FloatSpecies S128F =
            FloatVector.species(Shape.S_128_BIT);

    static final FloatVector.FloatSpecies S256F =
            FloatVector.species(Shape.S_256_BIT);
    static final FloatVector.FloatSpecies S512F =
            FloatVector.species(Shape.S_512_BIT);

    static final DoubleVector.DoubleSpecies S128D =
            DoubleVector.species(Shape.S_128_BIT);
    static final DoubleVector.DoubleSpecies S256D =
            DoubleVector.species(Shape.S_256_BIT);
    static final DoubleVector.DoubleSpecies S512D =
            DoubleVector.species(Shape.S_512_BIT);

    static final int SIZE = 128;
    static final int ITERATIONS = 100000;

    static float[] af = new float[SIZE];
    static float[] rf = new float[SIZE];;

    static double[] ad = new double[SIZE];
    static double[] rd = new double[SIZE];;

    static void workloadF_maxAll(FloatVector.FloatSpecies FS) {
       FloatVector av;
       int ITERS = SIZE / FS.length();
       for (int i = 0, index = 0 ; i < ITERS; i++, index += FS.length()) {
         av = FloatVector.fromArray(FS, af, index);
         rf[i] = av.maxAll();
       }
    }

    static void workloadF_minAll(FloatVector.FloatSpecies FS) {
       FloatVector av;
       int ITERS = SIZE / FS.length();
       for (int i = 0, index = 0 ; i < ITERS; i++, index += FS.length()) {
         av = FloatVector.fromArray(FS, af, index);
         rf[i] = av.minAll();
       }
    }

    static void workloadD_maxAll(DoubleVector.DoubleSpecies DS) {
       DoubleVector av;
       int ITERS = SIZE / DS.length();
       for (int i = 0, index = 0 ; i < ITERS; i++, index += DS.length()) {
         av = DoubleVector.fromArray(DS, ad, index);
         rd[i] = av.maxAll();
       }
    }

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
        af[i] = 1.0f + i;
      }
      af[5] = Float.NaN;
      af[8] = -0.0f;
      af[9] = 0.0f;

      for (int i = 0; i < SIZE; i++) {
        ad[i] = 1.0 + i;
      }
      ad[5] = Double.NaN;
      ad[8] = -0.0;
      ad[9] = 0.0;
    }

    static void printresultF(FloatVector.FloatSpecies FS) {
      for (int i = 0; i < SIZE / FS.length() ; i++)
        System.out.println("rf["+i+"] = "+rf[i]);
    }

    static void printresultD(DoubleVector.DoubleSpecies DS) {
      for (int i = 0; i < SIZE/ DS.length() ; i++)
        System.out.println("rd["+i+"] = "+rd[i]);
    }

    static void workloads() {
       for (int i = 0; i < ITERATIONS; i++)
         workloadF_maxAll(S64F);   
       System.out.println("workloadF_64_maxAll");
       printresultF(S64F);

       for (int i = 0; i < ITERATIONS; i++)
         workloadF_maxAll(S128F);   
       System.out.println("workloadF_128_maxAll");
       printresultF(S128F);

       for (int i = 0; i < ITERATIONS; i++)
         workloadF_maxAll(S256F);   
       System.out.println("workloadF_256_maxAll");
       printresultF(S256F);

       for (int i = 0; i < ITERATIONS; i++)
         workloadF_maxAll(S512F);   
       System.out.println("workloadF_512_maxAll");
       printresultF(S512F);

       for (int i = 0; i < ITERATIONS; i++)
         workloadF_minAll(S64F);   
       System.out.println("workloadF_64_minAll");
       printresultF(S64F);

       for (int i = 0; i < ITERATIONS; i++)
         workloadF_minAll(S128F);   
       System.out.println("workloadF_128_minAll");
       printresultF(S128F);

       for (int i = 0; i < ITERATIONS; i++)
         workloadF_minAll(S256F);   
       System.out.println("workloadF_256_minAll");
       printresultF(S256F);

       for (int i = 0; i < ITERATIONS; i++)
         workloadF_minAll(S512F);   
       System.out.println("workloadF_512_minAll");
       printresultF(S512F);

       for (int i = 0; i < ITERATIONS; i++)
         workloadD_maxAll(S128D);   
       System.out.println("workloadF_128_maxAll");
       printresultD(S128D);

       for (int i = 0; i < ITERATIONS; i++)
         workloadD_maxAll(S256D);   
       System.out.println("workloadF_256_maxAll");
       printresultD(S256D);

       for (int i = 0; i < ITERATIONS; i++)
         workloadD_maxAll(S512D);   
       System.out.println("workloadF_512_maxAll");
       printresultD(S512D);

       for (int i = 0; i < ITERATIONS; i++)
         workloadD_minAll(S128D);   
       System.out.println("workloadF_128_minAll");
       printresultD(S128D);

       for (int i = 0; i < ITERATIONS; i++)
         workloadD_minAll(S256D);   
       System.out.println("workloadF_256_minAll");
       printresultD(S256D);

       for (int i = 0; i < ITERATIONS; i++)
         workloadD_minAll(S512D);   
       System.out.println("workloadF_512_minAll");
       printresultD(S512D);
    }

    public static void main(String args[]) {
       setup_data();
       workloads();
    }
}
