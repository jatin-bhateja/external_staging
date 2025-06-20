
import java.util.function.Function;

abstract class AbstractSpecies<E> extends VectorSupport.VectorSpecies<E> implements VectorSpecies<E> {

    final int laneCount;
    Class<?> elemType;
    final Function<Object, ? extends AbstractVector<E>> vectorFactory;
    AbstractVector<E> dummyVector;

    AbstractSpecies(int laneCount, Class<?> elemType,
                    Function<Object, ? extends AbstractVector<E>> vectorFactory) {
        this.laneCount = laneCount;
        this.elemType = elemType;
        this.vectorFactory = vectorFactory;
    }

    AbstractVector<E> dummyVector() {
        // This JITs to a constant value:
        AbstractVector<E> dummy = dummyVector;
        if (dummy != null)  return dummy;
        // The rest of this computation is probably not JIT-ted.
        return makeDummyVector();
    }

    private AbstractVector<E> makeDummyVector() {
        Object za = AbstractVector.vectorPayloadFactory(laneCount, elemType);
        return dummyVector = vectorFactory.apply(za);
        // This is the only use of vectorFactory.
        // All other factory requests are routed
        // through the dummy vector.
    }
}
