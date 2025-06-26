
primitive class VectorPayloadMFInt128 extends VectorPayloadMF {
  int mfield4 = 0;
}

primitive final class Int128Vector extends IntVector {
   VectorPayloadMFInt128 payload;
   Object getPayLoad() {
      return payload;
   }
   public Int128Vector(Object obj) {
      this.payload = (VectorPayloadMFInt128)obj;
   }
}
