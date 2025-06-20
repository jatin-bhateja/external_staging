
primitive class VectorPayloadMFInt512 extends VectorPayloadMF {
  int mfield16 = 0;
}

primitive final class Int512Vector extends IntVector {
   VectorPayloadMFInt512 payload;
   Object getPayLoad() {
      return payload;
   }
   public Int512Vector(Object obj) {
      this.payload = (VectorPayloadMFInt512)obj;
   }
}
