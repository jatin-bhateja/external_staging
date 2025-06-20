
import java.nio.ByteOrder;

abstract class VectorPayloadMF {
}

abstract class AbstractVector<E> extends Vector<E> {
    static final ByteOrder NATIVE_ENDIAN = ByteOrder.nativeOrder();

    static VectorPayloadMF vectorPayloadFactory(int lanes, Class<?> elemType) {
       if (elemType == int.class) {
          return IntVector.vectorPayloadFactory(lanes);
       } else if (elemType == long.class) {
          return LongVector.vectorPayloadFactory(lanes);
       } else {
         assert false;
         return null;
       }
    } 
}
