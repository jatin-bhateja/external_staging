
primitive final class Long64Vector extends LongVector {
   VectorPayloadMFLong64 payload;
   Object getPayLoad() {
      return payload;
   }
   public Long64Vector(Object obj) {
      this.payload = (VectorPayloadMFLong64)obj;
   }
}
