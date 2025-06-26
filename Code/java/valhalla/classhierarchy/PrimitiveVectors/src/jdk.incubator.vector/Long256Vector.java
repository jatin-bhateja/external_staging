
primitive final class Long256Vector extends LongVector {
   VectorPayloadMFLong256 payload;
   Object getPayLoad() {
      return payload;
   }
   public Long256Vector(Object obj) {
      this.payload = (VectorPayloadMFLong256)obj;
   }
}
