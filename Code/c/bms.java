
@Benchmark
public void microFloat128ToByte128() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2B, ByteVector.SPECIES_128, 0)
            .reinterpretAsBytes()
            .intoArray(byte_res, i);
    }
}

@Benchmark
public void microFloat128ToByte256() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2B, ByteVector.SPECIES_256, 0)
            .reinterpretAsBytes()
            .intoArray(byte_res, i);
    }
}

@Benchmark
public void microFloat128ToByte512() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2B, ByteVector.SPECIES_512, 0)
            .reinterpretAsBytes()
            .intoArray(byte_res, i);
    }
}

@Benchmark
public void microFloat128ToShort128() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2S, ShortVector.SPECIES_128, 0)
            .reinterpretAsShorts()
            .intoArray(short_res, i);
    }
}

@Benchmark
public void microFloat128ToShort256() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2S, ShortVector.SPECIES_256, 0)
            .reinterpretAsShorts()
            .intoArray(short_res, i);
    }
}

@Benchmark
public void microFloat128ToShort512() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2S, ShortVector.SPECIES_512, 0)
            .reinterpretAsShorts()
            .intoArray(short_res, i);
    }
}

@Benchmark
public void microFloat128ToInteger128() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2I, IntVector.SPECIES_128, 0)
            .reinterpretAsInts()
            .intoArray(int_res, i);
    }
}

@Benchmark
public void microFloat128ToInteger256() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2I, IntVector.SPECIES_256, 0)
            .reinterpretAsInts()
            .intoArray(int_res, i);
    }
}

@Benchmark
public void microFloat128ToInteger512() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2I, IntVector.SPECIES_512, 0)
            .reinterpretAsInts()
            .intoArray(int_res, i);
    }
}

@Benchmark
public void microFloat128ToLong128() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2L, LongVector.SPECIES_128, 0)
            .reinterpretAsLongs()
            .intoArray(long_res, i);
    }
}

@Benchmark
public void microFloat128ToLong256() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2L, LongVector.SPECIES_256, 0)
            .reinterpretAsLongs()
            .intoArray(long_res, i);
    }
}

@Benchmark
public void microFloat128ToLong512() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2L, LongVector.SPECIES_512, 0)
            .reinterpretAsLongs()
            .intoArray(long_res, i);
    }
}

@Benchmark
public void microFloat256ToByte128() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2B, ByteVector.SPECIES_128, 0)
            .reinterpretAsBytes()
            .intoArray(byte_res, i);
    }
}

@Benchmark
public void microFloat256ToByte256() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2B, ByteVector.SPECIES_256, 0)
            .reinterpretAsBytes()
            .intoArray(byte_res, i);
    }
}

@Benchmark
public void microFloat256ToByte512() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2B, ByteVector.SPECIES_512, 0)
            .reinterpretAsBytes()
            .intoArray(byte_res, i);
    }
}

@Benchmark
public void microFloat256ToShort128() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2S, ShortVector.SPECIES_128, 0)
            .reinterpretAsShorts()
            .intoArray(short_res, i);
    }
}

@Benchmark
public void microFloat256ToShort256() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2S, ShortVector.SPECIES_256, 0)
            .reinterpretAsShorts()
            .intoArray(short_res, i);
    }
}

@Benchmark
public void microFloat256ToShort512() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2S, ShortVector.SPECIES_512, 0)
            .reinterpretAsShorts()
            .intoArray(short_res, i);
    }
}

@Benchmark
public void microFloat256ToInteger128() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2I, IntVector.SPECIES_128, 0)
            .reinterpretAsInts()
            .intoArray(int_res, i);
    }
}

@Benchmark
public void microFloat256ToInteger256() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2I, IntVector.SPECIES_256, 0)
            .reinterpretAsInts()
            .intoArray(int_res, i);
    }
}

@Benchmark
public void microFloat256ToInteger512() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2I, IntVector.SPECIES_512, 0)
            .reinterpretAsInts()
            .intoArray(int_res, i);
    }
}

@Benchmark
public void microFloat256ToLong128() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2L, LongVector.SPECIES_128, 0)
            .reinterpretAsLongs()
            .intoArray(long_res, i);
    }
}

@Benchmark
public void microFloat256ToLong256() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2L, LongVector.SPECIES_256, 0)
            .reinterpretAsLongs()
            .intoArray(long_res, i);
    }
}

@Benchmark
public void microFloat256ToLong512() {
    VectorSpecies<Float> SPECIES = FloatVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        FloatVector.fromArray(SPECIES, float_arr, i)
            .convertShape(VectorOperators.F2L, LongVector.SPECIES_512, 0)
            .reinterpretAsLongs()
            .intoArray(long_res, i);
    }
}

@Benchmark
public void microDouble128ToByte128() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2B, ByteVector.SPECIES_128, 0)
            .reinterpretAsBytes()
            .intoArray(byte_res, i);
    }
}

@Benchmark
public void microDouble128ToByte256() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2B, ByteVector.SPECIES_256, 0)
            .reinterpretAsBytes()
            .intoArray(byte_res, i);
    }
}

@Benchmark
public void microDouble128ToByte512() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2B, ByteVector.SPECIES_512, 0)
            .reinterpretAsBytes()
            .intoArray(byte_res, i);
    }
}

@Benchmark
public void microDouble128ToShort128() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2S, ShortVector.SPECIES_128, 0)
            .reinterpretAsShorts()
            .intoArray(short_res, i);
    }
}

@Benchmark
public void microDouble128ToShort256() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2S, ShortVector.SPECIES_256, 0)
            .reinterpretAsShorts()
            .intoArray(short_res, i);
    }
}

@Benchmark
public void microDouble128ToShort512() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2S, ShortVector.SPECIES_512, 0)
            .reinterpretAsShorts()
            .intoArray(short_res, i);
    }
}

@Benchmark
public void microDouble128ToInteger128() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2I, IntVector.SPECIES_128, 0)
            .reinterpretAsInts()
            .intoArray(int_res, i);
    }
}

@Benchmark
public void microDouble128ToInteger256() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2I, IntVector.SPECIES_256, 0)
            .reinterpretAsInts()
            .intoArray(int_res, i);
    }
}

@Benchmark
public void microDouble128ToInteger512() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2I, IntVector.SPECIES_512, 0)
            .reinterpretAsInts()
            .intoArray(int_res, i);
    }
}

@Benchmark
public void microDouble128ToLong128() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2L, LongVector.SPECIES_128, 0)
            .reinterpretAsLongs()
            .intoArray(long_res, i);
    }
}

@Benchmark
public void microDouble128ToLong256() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2L, LongVector.SPECIES_256, 0)
            .reinterpretAsLongs()
            .intoArray(long_res, i);
    }
}

@Benchmark
public void microDouble128ToLong512() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_128;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2L, LongVector.SPECIES_512, 0)
            .reinterpretAsLongs()
            .intoArray(long_res, i);
    }
}

@Benchmark
public void microDouble256ToByte128() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2B, ByteVector.SPECIES_128, 0)
            .reinterpretAsBytes()
            .intoArray(byte_res, i);
    }
}

@Benchmark
public void microDouble256ToByte256() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2B, ByteVector.SPECIES_256, 0)
            .reinterpretAsBytes()
            .intoArray(byte_res, i);
    }
}

@Benchmark
public void microDouble256ToByte512() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2B, ByteVector.SPECIES_512, 0)
            .reinterpretAsBytes()
            .intoArray(byte_res, i);
    }
}

@Benchmark
public void microDouble256ToShort128() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2S, ShortVector.SPECIES_128, 0)
            .reinterpretAsShorts()
            .intoArray(short_res, i);
    }
}

@Benchmark
public void microDouble256ToShort256() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2S, ShortVector.SPECIES_256, 0)
            .reinterpretAsShorts()
            .intoArray(short_res, i);
    }
}

@Benchmark
public void microDouble256ToShort512() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2S, ShortVector.SPECIES_512, 0)
            .reinterpretAsShorts()
            .intoArray(short_res, i);
    }
}

@Benchmark
public void microDouble256ToInteger128() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2I, IntVector.SPECIES_128, 0)
            .reinterpretAsInts()
            .intoArray(int_res, i);
    }
}

@Benchmark
public void microDouble256ToInteger256() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2I, IntVector.SPECIES_256, 0)
            .reinterpretAsInts()
            .intoArray(int_res, i);
    }
}

@Benchmark
public void microDouble256ToInteger512() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2I, IntVector.SPECIES_512, 0)
            .reinterpretAsInts()
            .intoArray(int_res, i);
    }
}

@Benchmark
public void microDouble256ToLong128() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2L, LongVector.SPECIES_128, 0)
            .reinterpretAsLongs()
            .intoArray(long_res, i);
    }
}

@Benchmark
public void microDouble256ToLong256() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2L, LongVector.SPECIES_256, 0)
            .reinterpretAsLongs()
            .intoArray(long_res, i);
    }
}

@Benchmark
public void microDouble256ToLong512() {
    VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_256;
    for (int i = 0; i < SPECIES.loopBound(SIZE); i += SPECIES.length()) {
        DoubleVector.fromArray(SPECIES, double_arr, i)
            .convertShape(VectorOperators.D2L, LongVector.SPECIES_512, 0)
            .reinterpretAsLongs()
            .intoArray(long_res, i);
    }
}
