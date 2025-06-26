
import java.util.function.Function;

public abstract sealed class IntVector extends AbstractVector<Integer> permits Int64Vector, Int128Vector, Int256Vector, Int512Vector {

    public static VectorPayloadMF vectorPayloadFactory(int lanes) {
       int bits = Integer.SIZE * lanes;    
       switch(lanes) {
          case 64: return new VectorPayloadMFInt64();
          case 128: return new VectorPayloadMFInt128();
          case 256: return new VectorPayloadMFInt256();
          case 512: return new VectorPayloadMFInt512(); 
          default: assert false; return null;
       }
    }
 
    /*package-private*/
    static final class IntSpecies extends AbstractSpecies<Integer> {
         private IntSpecies(int lanecount, Class<?> elemType,
                 Function<Object, IntVector> vectorFactory) {
             super(lanecount, elemType, vectorFactory);
         }
         @Override
         Object getPayLoad() { return null; }
    }

    public static Vector<Integer> getVector(AbstractSpecies<Integer> spec) {
       return spec.dummyVector(); 
    }

    /** Species representing {@link IntVector}s of {@link VectorShape#S_64_BIT VectorShape.S_64_BIT}. */
    public static final VectorSpecies<Integer> SPECIES_64
        = new IntSpecies(2,
                         int.class,
                         Int64Vector::new);

    /** Species representing {@link IntVector}s of {@link VectorShape#S_128_BIT VectorShape.S_128_BIT}. */
    public static final VectorSpecies<Integer> SPECIES_128
        = new IntSpecies(4,
                         int.class,
                         Int128Vector::new);

    /** Species representing {@link IntVector}s of {@link VectorShape#S_256_BIT VectorShape.S_256_BIT}. */
    public static final VectorSpecies<Integer> SPECIES_256
        = new IntSpecies(8,
                         int.class,
                         Int256Vector::new);

    /** Species representing {@link IntVector}s of {@link VectorShape#S_512_BIT VectorShape.S_512_BIT}. */
    public static final VectorSpecies<Integer> SPECIES_512
        = new IntSpecies(16,
                         int.class,
                         Int512Vector::new);

}
