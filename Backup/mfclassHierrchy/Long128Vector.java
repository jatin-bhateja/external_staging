
primitive class VectorPayloadMFLong128 extends VectorPayloadMF {
  int mfield2 = 0;
}

primitive class Long128Vector extends LongVector {
   VectorPayloadMFLong128 payload;
   Object getPayLoad() {
      return payload;
   }
   public Long128Vector(Object obj) {
      this.payload = (VectorPayloadMFLong128)obj;
   }
}
