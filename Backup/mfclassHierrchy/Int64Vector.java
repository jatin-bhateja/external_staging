
primitive class VectorPayloadMFInt64 extends VectorPayloadMF {
  int mfield2 = 0;
}

primitive class Int64Vector extends IntVector {
  VectorPayloadMFInt64 payload;
  Object getPayLoad() {
     return payload;
  }

  public Int64Vector(Object obj) {
     this.payload = (VectorPayloadMFInt64)obj;
  } 
}
