
public class VectorSupport {
    public static abstract class VectorPayload  {
       abstract Object getPayLoad();
    }
    public static abstract class Vector<E> extends VectorPayload {
    }
    public static abstract class VectorShuffle<E> extends VectorPayload {
    }
    public static abstract class VectorMask<E> extends VectorPayload {
    }
    public static abstract class VectorSpecies<E> extends VectorPayload {
    }
}
