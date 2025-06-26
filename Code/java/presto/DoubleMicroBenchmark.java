//package com.intel.microbenchmark;

import jdk.incubator.vector.*;

import static java.lang.Double.doubleToLongBits;
import static jdk.incubator.vector.VectorOperators.GE;
import static jdk.incubator.vector.VectorOperators.LE;
//import com.intel.lgiacchi.*; 

public class DoubleMicroBenchmark {

    static final int positionCount = 1024;
    static final boolean outputRequired = true;
    static int totalIters = 0;
    static int numPassingIters = 0;
    static int outputRequiredIters = 0;

    static double lower;
    static double upper;

    public static class MyState {
        public int[] positions;
        public int[] outputPositions;
        public int outputPositionCount;
        public long[] outputValues;

        public boolean toFile = false;

        public int selectivity = 10;

        public DoubleStream stream;

        public void setupTrial() {
            if (stream == null) {
                stream = new DoubleStream(true, true, true, toFile);
            }
            positions = new int[positionCount];
            outputValues = new long[positionCount];
            for (int i = 0; i < positionCount; i++) {
                positions[i] = i;
            }
            outputPositions = new int[positionCount];
            stream.initialize(positionCount);
            lower = 25;
            upper = lower + selectivity;
        }

        public void setupInvocation() {
            outputPositionCount = 0;
            stream.reset();
        }
    }

    private static boolean DoubleRange_testDouble(double value) {
        return value >= lower && value <= upper;
    }

    private static VectorMask<Double> DoubleRange_testDoubleVector(DoubleVector values) {
        return values.compare(GE, lower).and(values.compare(LE, upper));
    }

    private static void ReadWithFilter_DoubleRange_scalar(MyState s) {
        for (int i = 0; i < positionCount; i++) {
            double value = s.stream.getNext();
            if (DoubleRange_testDouble(value)) {
                if (outputRequired) {
                    s.outputValues[s.outputPositionCount] = doubleToLongBits(value);
                }
                s.outputPositions[s.outputPositionCount] = s.positions[i];
                s.outputPositionCount++;
            }
        }
    }

    private static void ReadWithFilter_DoubleRange_vector_compress_checknopassing_constantSpecies
            (MyState s) {
        int speciesLength = DoubleVector.SPECIES_512.length();
        double[] values = new double[speciesLength];
        int i = 0;
        int upperBound = DoubleVector.SPECIES_512.loopBound(positionCount);
        for (; i < upperBound; i += speciesLength) {
            totalIters++;
            for (int j = 0; j < speciesLength; j++) {
                values[j] = s.stream.getNext();
            }
            DoubleVector valuesVector = DoubleVector.fromArray(DoubleVector.SPECIES_512, values, 0);
            VectorMask<Double> passing = DoubleRange_testDoubleVector(valuesVector);
            int numPassing = passing.trueCount();
            if (numPassing > 0) {
                numPassingIters++;
                if (outputRequired) {
                    outputRequiredIters++;
                    DoubleVector outputDoubleValuesVector = valuesVector.compress(passing);
                    LongVector outputLongValuesVector = outputDoubleValuesVector.viewAsIntegralLanes();
                    //LongVector outputLongValuesVector = outputDoubleValuesVector.reinterpretAsLongs();
                    //LongVector outputLongValuesVector = (LongVector)outputDoubleValuesVector.convertShape(VectorOperators.D2L, LongVector.SPECIES_512, 0); 
                    outputLongValuesVector.intoArray(s.outputValues, s.outputPositionCount);
                }
                IntVector positionsVector = IntVector.fromArray(IntVector.SPECIES_256, s.positions, i);
                IntVector outputPositionsVector = positionsVector.compress(passing.cast(IntVector.SPECIES_256));
                outputPositionsVector.intoArray(s.outputPositions, s.outputPositionCount);
                s.outputPositionCount += numPassing;
           }
        }
        for (; i < positionCount; i++) {
            double value = s.stream.getNext();
            if (DoubleRange_testDouble(value)) {
                if (outputRequired) {
                    s.outputValues[s.outputPositionCount] = doubleToLongBits(value);
                }
                s.outputPositions[s.outputPositionCount] = s.positions[i];
                s.outputPositionCount++;
            }
        }
    }

    private static void ReadWithFilter_DoubleRange_vector_compress_constantSpecies
            (MyState s) {
        VectorSpecies<Integer> speciesInt = IntVector.SPECIES_256;
        int speciesLength = DoubleVector.SPECIES_512.length();
        double[] values = new double[speciesLength];
        int i = 0;
        int upperBound = DoubleVector.SPECIES_512.loopBound(positionCount);
        for (; i < upperBound; i += speciesLength) {
            for (int j = 0; j < speciesLength; j++) {
                values[j] = s.stream.getNext();
            }
            DoubleVector valuesVector = DoubleVector.fromArray(DoubleVector.SPECIES_512, values, 0);
            VectorMask<Double> passing = DoubleRange_testDoubleVector(valuesVector);
            int numPassing = passing.trueCount();
            if (numPassing > 0) {
                if (outputRequired) {
                    DoubleVector outputDoubleValuesVector = valuesVector.compress(passing);
                    LongVector outputLongValuesVector = outputDoubleValuesVector.viewAsIntegralLanes();
                    outputLongValuesVector.intoArray(s.outputValues, s.outputPositionCount);
                }
                IntVector positionsVector = IntVector.fromArray(speciesInt, s.positions, i);
                IntVector outputPositionsVector = positionsVector.compress(passing.cast(speciesInt));
                outputPositionsVector.intoArray(s.outputPositions, s.outputPositionCount);
                s.outputPositionCount += numPassing;
            }
        }
        for (; i < positionCount; i++) {
            double value = s.stream.getNext();
            if (DoubleRange_testDouble(value)) {
                if (outputRequired) {
                    s.outputValues[s.outputPositionCount] = doubleToLongBits(value);
                }
                s.outputPositions[s.outputPositionCount] = s.positions[i];
                s.outputPositionCount++;
            }
        }
    }

    public static void main (String[] args) {
        int algo = Integer.parseInt(args[0]);
        MyState s = new MyState();
        s.setupTrial();
        final long WARMUP_COUNT = 1000_000;
        final long ITERATION_COUNT = 10000;
  
        if (algo == 0) {
          // do Scalar warmup
          for (long i = 0; i < WARMUP_COUNT; i++) {
              DoubleMicroBenchmark.ReadWithFilter_DoubleRange_scalar(s);
              s.setupInvocation();
          }
          System.out.println("Scalar warmup complete.");
  
          long sTime = System.nanoTime();
          for (long i = 0; i < ITERATION_COUNT; i++) {
              DoubleMicroBenchmark.ReadWithFilter_DoubleRange_scalar(s);
              s.setupInvocation();
          }
  
          long eTime = System.nanoTime();
          System.out.printf("Scalar Elapsed time = %d nano seconds", (eTime - sTime));
          System.out.println();
        } else {
          // do Vector warmup
          for (long i = 0; i < WARMUP_COUNT; i++) {
              DoubleMicroBenchmark.ReadWithFilter_DoubleRange_vector_compress_checknopassing_constantSpecies(s);
              s.setupInvocation();
          }
          System.out.println("Vector warmup complete.");
  
          long sTime = System.nanoTime();
          for (long i = 0; i < ITERATION_COUNT; i++) {
              DoubleMicroBenchmark.ReadWithFilter_DoubleRange_vector_compress_checknopassing_constantSpecies(s);
              s.setupInvocation();
          }
  
          long eTime = System.nanoTime();
          System.out.printf("Vector Elapsed time = %d nano seconds\n", (eTime - sTime));
          System.out.printf("\ntotalIters = " + totalIters);
          System.out.printf("\nnumPassingIters = " + numPassingIters);
          System.out.printf("\noutputRequiredIters = " + outputRequiredIters);
          System.out.printf("\n");
        }
    }
}
