package com.intel.lgiacchi;

import jdk.incubator.vector.*;
import org.openjdk.jmh.annotations.*;
import java.util.stream.*;
import java.util.stream.LongStream.*;
import java.util.concurrent.TimeUnit;

import static jdk.incubator.vector.VectorOperators.GE;
import static jdk.incubator.vector.VectorOperators.LE;
import java.lang.foreign.*;

@Fork(value = 1)
@Threads(1)
@Warmup(iterations = 3, time = 10, timeUnit = TimeUnit.SECONDS)
@Measurement(iterations = 3, time = 10, timeUnit = TimeUnit.SECONDS)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
public class LongIntSimpleBenchmark {

    static final int SIZE = 4096;
    static final int positionCount = SIZE;
    static final long lstream [] = new long [SIZE];
    static final int istream [] = new int [SIZE];

    static long lower = 10;
    static long upper = 50;

    static final VectorSpecies<Long> speciesLong = LongVector.SPECIES_512;
    static final VectorSpecies<Integer> speciesInt = IntVector.SPECIES_512;

    @State(Scope.Thread)
    public static class MyState {
        public int[] positions = new int[SIZE];
        public int[] outputPositions = new int[SIZE];
        public int outputPositionCount;
        
        @Param({"10"})
        public int selectivity = 10;

        @Setup(Level.Trial)
        public void setupTrial() {
            lower = 25;
            upper = lower + selectivity;
            for (int i = 0; i < SIZE; i++) {
               lstream[i] = 0;
               istream[i] = 0;
               if (i % 32 == 0) {
                 lstream[i] = lower + 1;
                 istream[i] = (int)(lower + 1);
               }
            }
        }

        @Setup(Level.Invocation)
        public void setupInvocation() {
            outputPositionCount = 0;
        }
    }

    public boolean testLong(long value) {
        return value >= lower && value <= upper;
    }

    public VectorMask<Long> testLongVector(LongVector values) {
        return values.compare(GE, lower).and(values.compare(LE, upper));
    }

    public boolean testInt(int value) {
        return value >= lower && value <= upper;
    }

    public VectorMask<Integer> testIntVector(IntVector values) {
        return values.compare(GE, lower).and(values.compare(LE, upper));
    }

    @Benchmark
    public void scalar(MyState s) {
        for (int i = 0; i < positionCount; i++) {
            long value = lstream[i];
            if (testLong(value)) {
                s.outputPositions[s.outputPositionCount] = s.positions[i];
                s.outputPositionCount++;
            }
        }
    }

    @Benchmark
    public void iscalar(MyState s) {
        for (int i = 0; i < positionCount; i++) {
            int value = istream[i];
            if (testInt(value)) {
                s.outputPositions[s.outputPositionCount] = s.positions[i];
                s.outputPositionCount++;
            }
        }
    }

    @Benchmark
    public void vectorbase(MyState s) {
        int i = 0;
        int upperBound = speciesLong.loopBound(positionCount);
        for (; i < upperBound; i += speciesLong.length()) {
            LongVector valuesVector = LongVector.fromArray(speciesLong, lstream, i);
            VectorMask<Long> passing = testLongVector(valuesVector);

            IntVector positionsVector = IntVector.fromArray(speciesInt, s.positions, i);
            IntVector outputPositionsVector = positionsVector.compress(passing.cast(speciesInt));

            outputPositionsVector.intoArray(s.outputPositions, s.outputPositionCount);
            s.outputPositionCount += passing.trueCount();
//            VectorMask<Integer> ipassing = VectorMask.fromLong(speciesInt, (testLongVector(valuesVector).toLong()));
//            IntVector positionsVector = IntVector.fromArray(speciesInt, s.positions, i);
//            IntVector outputPositionsVector = positionsVector.compress(ipassing);
//            outputPositionsVector.intoArray(s.outputPositions, s.outputPositionCount);
//            s.outputPositionCount += ipassing.trueCount();
        }
        for (; i < positionCount; i++) {
            long value = lstream[i];
            if (testLong(value)) {
                s.outputPositions[s.outputPositionCount] = s.positions[i];
                s.outputPositionCount++;
            }
        }
    }

    @Benchmark
    public void ivectorbase (MyState s) {
        int i = 0;
        int upperBound = speciesInt.loopBound(positionCount);
        for (; i < upperBound; i += speciesInt.length()) {
            IntVector valuesVector = IntVector.fromArray(speciesInt, istream, i);
            VectorMask<Integer> passing = testIntVector(valuesVector);

            IntVector positionsVector = IntVector.fromArray(speciesInt, s.positions, i);
            IntVector outputPositionsVector = positionsVector.compress(passing);

            outputPositionsVector.intoArray(s.outputPositions, s.outputPositionCount);
            s.outputPositionCount += passing.trueCount();
        }
        for (; i < positionCount; i++) {
            int value = istream[i];
            if (testInt(value)) {
                s.outputPositions[s.outputPositionCount] = s.positions[i];
                s.outputPositionCount++;
            }
        }
    }
}
