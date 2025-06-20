
primitive class VectorPayloadMFInt256 extends VectorPayloadMF {
  int mfield8 = 0;
}

primitive final class Int256Vector extends IntVector {
   VectorPayloadMFInt256 payload;

   Object getPayLoad() {
      return payload;
   }

   public Int256Vector(Object obj) {
       this.payload = (VectorPayloadMFInt256)obj;
   }
}
