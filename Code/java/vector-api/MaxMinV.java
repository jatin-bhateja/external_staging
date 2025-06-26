
import jdk.incubator.vector.*;
import jdk.incubator.vector.Vector.Shape;
import java.util.stream.IntStream;
import java.util.Arrays;

public class MaxMinV {
    static final FloatVector.FloatSpecies S64F =
            FloatVector.species(Shape.S_64_BIT);
    static final FloatVector.FloatSpecies S128F =
            FloatVector.species(Shape.S_128_BIT);
    static final FloatVector.FloatSpecies S256F =
            FloatVector.species(Shape.S_256_BIT);
    static final FloatVector.FloatSpecies S512F =
            FloatVector.species(Shape.S_512_BIT);

    static final DoubleVector.DoubleSpecies S64D =
            DoubleVector.species(Shape.S_64_BIT);
    static final DoubleVector.DoubleSpecies S128D =
            DoubleVector.species(Shape.S_128_BIT);
    static final DoubleVector.DoubleSpecies S256D =
            DoubleVector.species(Shape.S_256_BIT);
    static final DoubleVector.DoubleSpecies S512D =
            DoubleVector.species(Shape.S_512_BIT);

    static final int SIZE = 1024;
    static final int ITERATIONS = 100000;

    static float[] af = new float[SIZE];
    static float[] bf = new float[SIZE];
    static float[] rf = new float[SIZE];;

    static double[] ad = new double[SIZE];
    static double[] bd = new double[SIZE];
    static double[] rd = new double[SIZE];;

    static void workloadF_max(FloatVector.FloatSpecies FS, int ITERS) {
       FloatVector av;
       FloatVector bv;
       for (int i = 0, index = 0 ; i < ITERS; i++, index += FS.length()) {
         av = FloatVector.fromArray(FS, af, index);
         bv = FloatVector.fromArray(FS, bf, index);
         av.max(bv).intoArray(rf,index);
       }
    }

    static void workloadF_min(FloatVector.FloatSpecies FS, int ITERS) {
       FloatVector av;
       FloatVector bv;
       for (int i = 0, index = 0 ; i < ITERS; i++, index += FS.length()) {
         av = FloatVector.fromArray(FS, af, index);
         bv = FloatVector.fromArray(FS, bf, index);
         av.min(bv).intoArray(rf,index);
       }
    }

    static void workloadD_max(DoubleVector.DoubleSpecies DS, int ITERS) {
       DoubleVector av;
       DoubleVector bv;
       for (int i = 0, index = 0 ; i < ITERS; i++, index += DS.length()) {
         av = DoubleVector.fromArray(DS, ad, index);
         bv = DoubleVector.fromArray(DS, bd, index);
         av.max(bv).intoArray(rd,index);
       }
    }

    static void workloadD_min(DoubleVector.DoubleSpecies DS, int ITERS) {
       DoubleVector av;
       DoubleVector bv;
       for (int i = 0, index = 0 ; i < ITERS; i++, index += DS.length()) {
         av = DoubleVector.fromArray(DS, ad, index);
         bv = DoubleVector.fromArray(DS, bd, index);
         av.min(bv).intoArray(rd,index);
       }
    }

    static void setup_data() {
        for (int i = 0; i < SIZE; i++) {
            af[i] = 1.0f;
        }
        for (int i = 0; i < SIZE; i++) {
            bf[i] = 2.0f;
        }
        af[5] = Float.NaN;
        bf[8] = -0.0f;
        af[8] = 0.0f;

        for (int i = 0; i < SIZE; i++) {
            ad[i] = 1.0;
        }
        for (int i = 0; i < SIZE; i++) {
            bd[i] = 2.0;
        }
        ad[5] = Double.NaN;
        bd[7] = -0.0;
        ad[7] = 0.0;
    }

    static void printresultF() {
      for (int i = 0; i < 20 ; i++)
        System.out.println("rf["+i+"] = "+rf[i]);
    }

    static void printresultD() {
      for (int i = 0; i < 20 ; i++)
        System.out.println("rd["+i+"] = "+rd[i]);
    }

    static void workloads() {
       for (int i = 0; i < ITERATIONS; i++)
       workloadF_max(S64F,8);   
       printresultF();
       for (int i = 0; i < ITERATIONS; i++)
       workloadF_max(S128F,4);   
       printresultF();
       for (int i = 0; i < ITERATIONS; i++)
       workloadF_max(S256F,2);   
       printresultF();
       for (int i = 0; i < ITERATIONS; i++)
       workloadF_max(S512F,1);   
       printresultF();

       for (int i = 0; i < ITERATIONS; i++)
       workloadF_min(S64F,8);   
       printresultF();
       for (int i = 0; i < ITERATIONS; i++)
       workloadF_min(S128F,4);   
       printresultF();
       for (int i = 0; i < ITERATIONS; i++)
       workloadF_min(S256F,2);   
       printresultF();
       for (int i = 0; i < ITERATIONS; i++)
       workloadF_min(S512F,1);   
       printresultF();

       for (int i = 0; i < ITERATIONS; i++)
       workloadD_max(S64D,8);   
       printresultD();
       for (int i = 0; i < ITERATIONS; i++)
       workloadD_max(S128D,4);   
       printresultD();
       for (int i = 0; i < ITERATIONS; i++)
       workloadD_max(S256D,2);   
       printresultD();
       for (int i = 0; i < ITERATIONS; i++)
       workloadD_max(S512D,1);   
       printresultD();

       for (int i = 0; i < ITERATIONS; i++)
       workloadD_min(S64D,8);   
       printresultD();
       for (int i = 0; i < ITERATIONS; i++)
       workloadD_min(S128D,4);   
       printresultD();
       for (int i = 0; i < ITERATIONS; i++)
       workloadD_min(S256D,2);   
       printresultD();
       for (int i = 0; i < ITERATIONS; i++)
       workloadD_min(S512D,1);   
       printresultD();
    }

    public static void main(String args[]) {
       setup_data();
       workloads();
    }
}
