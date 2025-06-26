import jdk.incubator.vector.*;

class tailperf {
    public static int size;
    public static float [] queryVectorFloat;
    public static float [] inputVectorFloat;
    public static VectorSpecies SPECIES = FloatVector.SPECIES_MAX;

    public static float cosinesimilVectorFloatMax(int i) {
        float dotProduct = vecSum.reduceLanes(VectorOperators.ADD);
        float normInputVector = ySquareV.reduceLanes(VectorOperators.ADD);
        float normQueryVectorFloat = xSquareV.reduceLanes(VectorOperators.ADD);
        for (; i < queryVectorFloat.length; i++) {
            dotProduct += queryVectorFloat[i] * inputVectorFloat[i];
            normInputVector += inputVectorFloat[i] * inputVectorFloat[i];
            normQueryVectorFloat += queryVectorFloat[i] * queryVectorFloat[i];
        }
        float normalizedProduct = normQueryVectorFloat * normInputVector;
        return (float)(dotProduct / Math.sqrt(normalizedProduct));
    }

    public static float cosinesimilVectorFloatMax2(int i) {
        FloatVector vecX, vecY, vecSum, xSquareV, ySquareV;
        vecSum = FloatVector.zero(SPECIES);
        xSquareV = FloatVector.zero(SPECIES);
        ySquareV = FloatVector.zero(SPECIES);

        VectorMask tailMask = VectorMask.fromLong(SPECIES, -1L);
        tailMask = tailMask.indexInRange(i , size);

        vecX = FloatVector.fromArray(SPECIES, queryVectorFloat, i, tailMask);
        vecY = FloatVector.fromArray(SPECIES, inputVectorFloat, i, tailMask);
        vecSum = vecX.lanewise(VectorOperators.FMA, vecY, vecSum, tailMask);
        xSquareV = vecX.lanewise(VectorOperators.FMA, vecX, xSquareV, tailMask);
        ySquareV = vecY.lanewise(VectorOperators.FMA, vecY, ySquareV, tailMask);

        float dotProduct = vecSum.reduceLanes(VectorOperators.ADD);
        float normInputVector = ySquareV.reduceLanes(VectorOperators.ADD);
        float normQueryVectorFloat = xSquareV.reduceLanes(VectorOperators.ADD);

        float normalizedProduct = normQueryVectorFloat * normInputVector;
        return (float)(dotProduct / Math.sqrt(normalizedProduct));
    }

    public static void main(String [] args) {
        size = Integer.parseInt(args[0]);
        queryVectorFloat = new float[size];
        inputVectorFloat = new float[size];
        for (int i = 0 ; i < size; i++) {
            inputVectorFloat[i] = (float)i*2.0f;
        }

        float res = 0.0f;
        // Warmup
        for(int i = 0 ; i < 900000 ; i++)
            res += cosinesimilVectorFloatMax();

        res = 0.0f;
        long time1 = System.currentTimeMillis();
        for(int i = 0 ; i < 10000 ; i++)
            res += cosinesimilVectorFloatMax();
        long time2 = System.currentTimeMillis();
        System.out.println("[Algo 1 Time] " + (time2-time1) + "ms [Res] " + res);

        res = 0.0f;
        // Warmup
        for(int i = 0 ; i < 900000 ; i++)
            res += cosinesimilVectorFloatMax2();

        res = 0.0f;
        time1 = System.currentTimeMillis();
        for(int i = 0 ; i < 10000 ; i++)
            res += cosinesimilVectorFloatMax2();
        time2 = System.currentTimeMillis();
        System.out.println("[Algo 2 Time] " + (time2-time1) + "ms [Res] " + res);
    }
}
