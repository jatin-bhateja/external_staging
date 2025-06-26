
import java.util.function.Function;

public abstract sealed class LongVector extends AbstractVector<Long> permits Long64Vector, Long128Vector, Long256Vector, Long512Vector {

    public static VectorPayloadMF vectorPayloadFactory(int lanes) {
       int bits = Long.SIZE * lanes;
       switch(lanes) {
         case 64: return new VectorPayloadMFLong64();
         case 128: return new VectorPayloadMFLong128();
         case 256: return new VectorPayloadMFLong256();
         case 512: return new VectorPayloadMFLong512();
         default: assert false; return null;
       }
    }
 
    /*package-private*/
    static final class LongSpecies extends AbstractSpecies<Long> {
         private LongSpecies(int lanecount, Class<?> elemType,
                 Function<Object, LongVector> vectorFactory) {
             super(lanecount, elemType, vectorFactory);
         }
         @Override
         Object getPayLoad() { return null; }
    }

    public static Vector<Long> getVector(AbstractSpecies<Long> spec) {
       return spec.dummyVector();
    }

    /** Species representing {@link LongVector}s of {@link VectorShape#S_64_BIT VectorShape.S_64_BIT}. */
    public static final VectorSpecies<Long> SPECIES_64
        = new LongSpecies(1,
                         long.class,
                         Long64Vector::new);

    /** Species representing {@link LongVector}s of {@link VectorShape#S_128_BIT VectorShape.S_128_BIT}. */
    public static final VectorSpecies<Long> SPECIES_128
        = new LongSpecies(2,
                         long.class,
                         Long128Vector::new);

    /** Species representing {@link LongVector}s of {@link VectorShape#S_256_BIT VectorShape.S_256_BIT}. */
    public static final VectorSpecies<Long> SPECIES_256
        = new LongSpecies(4,
                         long.class,
                         Long256Vector::new);

    /** Species representing {@link LongVector}s of {@link VectorShape#S_512_BIT VectorShape.S_512_BIT}. */
    public static final VectorSpecies<Long> SPECIES_512
        = new LongSpecies(8,
                         long.class,
                         Long512Vector::new);

}
