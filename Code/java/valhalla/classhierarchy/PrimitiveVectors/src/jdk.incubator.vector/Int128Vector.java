
primitive final class Int128Vector extends IntVector {
   VectorPayloadMFInt128 payload;
   Object getPayLoad() {
      return payload;
   }
   public Int128Vector(Object obj) {
      this.payload = (VectorPayloadMFInt128)obj;
   }
}
