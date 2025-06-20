
primitive final class Long512Vector extends LongVector {
   VectorPayloadMFLong512 payload;
   @Override
   Object getPayLoad() {
      return payload;
   }
   public Long512Vector(Object obj) {
      this.payload = (VectorPayloadMFLong512)obj;
   }
}
