package com.intel.lgiacchi;

import jdk.incubator.vector.*;
import org.openjdk.jmh.annotations.*;

import java.util.HashMap;
import java.util.concurrent.TimeUnit;

import static java.lang.Double.doubleToLongBits;
import static jdk.incubator.vector.VectorOperators.GE;
import static jdk.incubator.vector.VectorOperators.LE;

@Fork(value = 1, jvmArgs="--add-modules=jdk.incubator.vector")
@Threads(1)
@Warmup(iterations = 1, time = 10, timeUnit = TimeUnit.SECONDS)
@Measurement(iterations = 10, time = 10, timeUnit = TimeUnit.SECONDS)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
public class DoubleSelectiveStreamReaderBenchmark {

    static final int positionCount = 1024;
    static final boolean outputRequired = true;

    static double lower;
    static double upper;
    static double [] values;

    static VectorShuffle<Integer>[] shuffles;
    static VectorShuffle<Double>[] shufflesDouble;
    static VectorSpecies<Double> speciesDouble = VectorUtils.speciesDouble;
    static VectorSpecies<Integer> speciesInt = VectorUtils.speciesInt;

    // make the allocation static
    static double[] staticDValues = new double[DoubleVector.SPECIES_512.length()];

    @State(Scope.Thread)
    public static class MyState {
        public int[] positions;
        public int[] outputPositions;
        public int outputPositionCount;
        public long[] outputValues;

        @Param({"false", "true"})
        public boolean toFile = true;

        @Param({"1", "10"})
        public int selectivity = 10;

        public DoubleStream stream;

        public HashMap<Integer, DoubleVector> doubleValuesVectorMap = new HashMap<>();

        @Setup(Level.Trial)
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
            precalculateShuffles();
            stream.initialize(positionCount);
            lower = 25;
            upper = lower + selectivity;

            // initialize doubleValuesVectorMap
            initializeDoubleVectors();
        }

        @Setup(Level.Invocation)
        public void setupInvocation() {
            values = new double[DoubleVector.SPECIES_512.length()];
            outputPositionCount = 0;
            stream.reset();
        }

        private void initializeDoubleVectors() {
            int index = 0;
            int upperBound = speciesDouble.loopBound(positionCount);
            double[] values = new double[speciesDouble.length()];
            int loopCount = 0;
            for (; index < upperBound; index += speciesDouble.length()) {
                for (int j = 0; j < speciesDouble.length(); j++) {
                    values[j] = stream.getNext();
                }
                DoubleVector valuesVector = DoubleVector.fromArray(speciesDouble, values, 0);
                doubleValuesVectorMap.put(loopCount++, valuesVector);
            }
        }
    }

    static void precalculateShuffles() {
        // Precalculate all possible mask to shuffle conversions
        int numShuffles = 1 << speciesDouble.length();
        shuffles = new VectorShuffle[numShuffles];
        shufflesDouble = new VectorShuffle[numShuffles];
        for (int i = 0; i < numShuffles; i++) {
            VectorMask<Double> mask = VectorMask.fromLong(speciesDouble, i);
            int shuffleCount = 0;
            int[] shuffle = new int[speciesInt.length()];
            for (int j = 0; j < speciesDouble.length(); j++) {
                if (mask.laneIsSet(j)) {
                    shuffle[shuffleCount] = j;
                    shuffleCount++;
                }
            }
            VectorShuffle<Integer> shuffleVector = VectorShuffle.fromArray(speciesInt, shuffle, 0);
            shuffles[i] = shuffleVector;

            VectorShuffle<Double> shuffleVectorDouble = VectorShuffle.fromArray(speciesDouble, shuffle, 0);
            shufflesDouble[i] = shuffleVectorDouble;
        }
    }

    public boolean DoubleRange_testDouble(double value) {
        return value >= lower && value <= upper;
    }

    public VectorMask<Double> DoubleRange_testDoubleVector(DoubleVector values) {
        return values.compare(GE, lower).and(values.compare(LE, upper));
    }


    @Benchmark
    public void ReadWithFilter_DoubleRange_vector_laneisset(DoubleSelectiveStreamReaderBenchmark.MyState s) {
        int i = 0;
        int upperBound = speciesDouble.loopBound(positionCount);
        for (; i < upperBound; i += speciesDouble.length()) {
            for (int j = 0; j < speciesDouble.length(); j++) {
                values[j] = s.stream.getNext();
            }
            DoubleVector valuesVector = DoubleVector.fromArray(speciesDouble, values, 0);
            VectorMask<Double> passing = DoubleRange_testDoubleVector(valuesVector);
            for (int j = 0; j < speciesDouble.length(); j++) {
                if (passing.laneIsSet(j)) {
                    if (outputRequired) {
                        s.outputValues[s.outputPositionCount] = doubleToLongBits(values[j]);
                    }
                    s.outputPositions[s.outputPositionCount] = s.positions[i + j];
                    s.outputPositionCount++;
                }
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

    @Benchmark
    public void ReadWithFilter_DoubleRange_vector_shuffle(DoubleSelectiveStreamReaderBenchmark.MyState s) {
        int i = 0;
        int upperBound = speciesDouble.loopBound(positionCount);
        upperBound = upperBound - speciesInt.length() + speciesDouble.length();
        for (; i < upperBound; i += speciesDouble.length()) {
            for (int j = 0; j < speciesDouble.length(); j++) {
                values[j] = s.stream.getNext();
            }
            DoubleVector valuesVector = DoubleVector.fromArray(speciesDouble, values, 0);
            VectorMask<Double> passing = DoubleRange_testDoubleVector(valuesVector);

            int shuffleIndex = (int) (passing.toLong());
            if (outputRequired) {
                DoubleVector outputDoubleValuesVector = valuesVector.rearrange(shufflesDouble[shuffleIndex]);
                LongVector outputLongValuesVector = outputDoubleValuesVector.viewAsIntegralLanes();
                outputLongValuesVector.intoArray(s.outputValues, s.outputPositionCount);
            }

            IntVector positionsVector = IntVector.fromArray(speciesInt, s.positions, i);
            IntVector outputPositionsVector = positionsVector.rearrange(shuffles[shuffleIndex]);
            outputPositionsVector.intoArray(s.outputPositions, s.outputPositionCount);
            s.outputPositionCount += Integer.bitCount(shuffleIndex);
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

    @Benchmark
    public void ReadWithFilter_DoubleRange_vector_compress(DoubleSelectiveStreamReaderBenchmark.MyState s) {
        VectorSpecies<Integer> speciesInt = VectorUtils.getHalfIntVectorSpecies();
        int i = 0;
        int upperBound = speciesDouble.loopBound(positionCount);
        for (; i < upperBound; i += speciesDouble.length()) {
            for (int j = 0; j < speciesDouble.length(); j++) {
                values[j] = s.stream.getNext();
            }
            DoubleVector valuesVector = DoubleVector.fromArray(speciesDouble, values, 0);
            VectorMask<Double> passing = DoubleRange_testDoubleVector(valuesVector);
            if (outputRequired) {
                DoubleVector outputDoubleValuesVector = valuesVector.compress(passing);
                LongVector outputLongValuesVector = outputDoubleValuesVector.viewAsIntegralLanes();
                outputLongValuesVector.intoArray(s.outputValues, s.outputPositionCount);
            }
            IntVector positionsVector = IntVector.fromArray(speciesInt, s.positions, i);
            IntVector outputPositionsVector = positionsVector.compress(passing.cast(speciesInt));
            outputPositionsVector.intoArray(s.outputPositions, s.outputPositionCount);
            s.outputPositionCount += passing.trueCount();
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

    @Benchmark
    public void ReadWithFilter_DoubleRange_scalar(DoubleSelectiveStreamReaderBenchmark.MyState s) {
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

    @Benchmark
    public void ReadWithFilter_DoubleRange_vector_compress_checknopassing(DoubleSelectiveStreamReaderBenchmark.MyState s) {
        VectorSpecies<Integer> speciesInt = VectorUtils.getHalfIntVectorSpecies();
        int i = 0;
        int upperBound = speciesDouble.loopBound(positionCount);
        for (; i < upperBound; i += speciesDouble.length()) {
            for (int j = 0; j < speciesDouble.length(); j++) {
                // Extra range checks for indexed accesses which is saved in scalar method.
                values[j] = s.stream.getNext();
            }
            DoubleVector valuesVector = DoubleVector.fromArray(speciesDouble, values, 0);
            VectorMask<Double> passing = DoubleRange_testDoubleVector(valuesVector);
            int numPassing = passing.trueCount();
            //if (numPassing > 0) {
                //if (outputRequired) {
                    DoubleVector outputDoubleValuesVector = valuesVector.compress(passing);
                    LongVector outputLongValuesVector = outputDoubleValuesVector.viewAsIntegralLanes();
                    outputLongValuesVector.intoArray(s.outputValues, s.outputPositionCount);
                //}
                IntVector positionsVector = IntVector.fromArray(speciesInt, s.positions, i);
                IntVector outputPositionsVector = positionsVector.compress(passing.cast(speciesInt));
                outputPositionsVector.intoArray(s.outputPositions, s.outputPositionCount);
                s.outputPositionCount += numPassing;
            //}
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


    @Benchmark
    public void ReadWithFilter_DoubleRange_vector_compress_checknopassing_valuesVectorIniliatized
            (DoubleSelectiveStreamReaderBenchmark.MyState s) {
        VectorSpecies<Integer> speciesInt = VectorUtils.getHalfIntVectorSpecies();
        int i = 0;
        for (int key : s.doubleValuesVectorMap.keySet()) {
            DoubleVector valuesVector = s.doubleValuesVectorMap.get(key);
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
            i += speciesDouble.length();
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

    @Benchmark
    public void ReadWithFilter_DoubleRange_vector_compress_checknopassing_constantSpecies
            (DoubleSelectiveStreamReaderBenchmark.MyState s) {
        VectorSpecies<Integer> speciesInt = IntVector.SPECIES_256;
        int i = 0;
        int upperBound = DoubleVector.SPECIES_512.loopBound(positionCount);
        int speciesLength = DoubleVector.SPECIES_512.length();
        for (; i < upperBound; i += speciesLength) {
            for (int j = 0; j < speciesLength; j++) {
                values[j] = s.stream.getNext();
            }
            DoubleVector valuesVector = DoubleVector.fromArray(DoubleVector.SPECIES_512, values, 0);
            VectorMask<Double> passing = DoubleRange_testDoubleVector(valuesVector);
            int numPassing = passing.trueCount();
            //if (numPassing > 0) {
                //if (outputRequired) {
                    DoubleVector outputDoubleValuesVector = valuesVector.compress(passing);
                    LongVector outputLongValuesVector = outputDoubleValuesVector.viewAsIntegralLanes();
                    outputLongValuesVector.intoArray(s.outputValues, s.outputPositionCount);
                //}
                IntVector positionsVector = IntVector.fromArray(speciesInt, s.positions, i);
                IntVector outputPositionsVector = positionsVector.compress(passing.cast(speciesInt));
                outputPositionsVector.intoArray(s.outputPositions, s.outputPositionCount);
                s.outputPositionCount += numPassing;
            //}
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

    @Benchmark
    public void ReadWithFilter_DoubleRange_vector_compress_constantSpecies
            (DoubleSelectiveStreamReaderBenchmark.MyState s) {
        VectorSpecies<Integer> speciesInt = IntVector.SPECIES_256;
        int i = 0;
        int upperBound = DoubleVector.SPECIES_512.loopBound(positionCount);
        int speciesLength = DoubleVector.SPECIES_512.length();
        for (; i < upperBound; i += speciesLength) {
            for (int j = 0; j < speciesLength; j++) {
                staticDValues[j] = s.stream.getNext();
            }
            DoubleVector valuesVector = DoubleVector.fromArray(DoubleVector.SPECIES_512, staticDValues, 0);
            VectorMask<Double> passing = DoubleRange_testDoubleVector(valuesVector);
            if (outputRequired) {
                DoubleVector outputDoubleValuesVector = valuesVector.compress(passing);
                LongVector outputLongValuesVector = outputDoubleValuesVector.viewAsIntegralLanes();
                outputLongValuesVector.intoArray(s.outputValues, s.outputPositionCount);
            }
            IntVector positionsVector = IntVector.fromArray(speciesInt, s.positions, i);
            IntVector outputPositionsVector = positionsVector.compress(passing.cast(speciesInt));
            outputPositionsVector.intoArray(s.outputPositions, s.outputPositionCount);
            s.outputPositionCount += passing.trueCount();;
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
}
