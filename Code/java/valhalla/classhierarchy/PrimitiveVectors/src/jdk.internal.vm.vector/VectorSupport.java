
public class VectorSupport {
    abstract class VectorPayloadMF {
    }
    primitive class VectorPayloadMFInt64 extends VectorPayloadMF {
        int mfield2 = 0;
    }
    primitive class VectorPayloadMFInt128 extends VectorPayloadMF {
        int mfield4 = 0;
    }
    primitive class VectorPayloadMFInt256 extends VectorPayloadMF {
       int mfield8 = 0;
    } 
    primitive class VectorPayloadMFInt512 extends VectorPayloadMF {
       int mfield16 = 0;
    }
    primitive class VectorPayloadMFLong64 extends VectorPayloadMF {
       int mfield = 0;
    }
    primitive class VectorPayloadMFLong128 extends VectorPayloadMF {
       int mfield2 = 0;
    }
    primitive class VectorPayloadMFLong256 extends VectorPayloadMF {
       int mfield4 = 0;
    }
    primitive class VectorPayloadMFLong512 extends VectorPayloadMF {
        int mfield8 = 0;
        public int getMfield8() {
            return mfield8;
        }
    }
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
