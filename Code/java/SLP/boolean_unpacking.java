import jdk.incubator.vector.*;

//SPARK: https://github.com/apache/spark/pull/34611
public class boolean_unpacking {
  /*
   *  ByteVector.broadcast(SPECIES, src)
   *      .lanewise(VectorOperators.RSHL, ByteVector.iota(SPECIES))
   *      .lanewise(VectorOperators.AND, 1);
   *      .intoArray(byteData, rowId);
   *
   */
  public static void putBooleans(byte [] byteData, byte src) {
    // SLP should be running over straight line code also, not included in loop.
    for(int rowId = 0; rowId < byteData.length; rowId += 8) {
      byteData[rowId] = (byte)(src & 1);
      byteData[rowId + 1] = (byte)(src >>> 1 & 1);
      byteData[rowId + 2] = (byte)(src >>> 2 & 1);
      byteData[rowId + 3] = (byte)(src >>> 3 & 1);
      byteData[rowId + 4] = (byte)(src >>> 4 & 1);
      byteData[rowId + 5] = (byte)(src >>> 5 & 1);
      byteData[rowId + 6] = (byte)(src >>> 6 & 1);
      byteData[rowId + 7] = (byte)(src >>> 7 & 1);
    }
  }
  public static final VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_512;
  public static void putBooleansVector(byte [] byteData, byte src) {
    for(int rowId = 0; rowId < SPECIES.loopBound(byteData.length); rowId += SPECIES.length()) {
        ByteVector.broadcast(SPECIES, src)
         .lanewise(VectorOperators.LSHR, SPECIES.broadcast(0).addIndex(1))
         .lanewise(VectorOperators.AND, 1)
         .intoArray(byteData, rowId);
    }
  }
  public static void main(String [] args) {
     byte [] byteData = new byte[4096];
     byte src = Byte.parseByte(args[0]);
     for (int i = 0; i < 10000; i++) {
        putBooleans(byteData, src); 
     }
     long t1 = System.currentTimeMillis();
     for (int i = 0; i < 10000; i++) {
        putBooleans(byteData, src); 
     }
     long t2 = System.currentTimeMillis();
     int res = 0;
     for (byte b : byteData) {
        res += b;
     }
     System.out.println("[time spark boolean unpack] " + (t2-t1) + " ms [res] " + res);

     byte [] byteDataV = new byte[4096];
     for (int i = 0; i < 10000; i++) {
        putBooleansVector(byteDataV, src); 
     }
     t1 = System.currentTimeMillis();
     for (int i = 0; i < 10000; i++) {
        putBooleans(byteDataV, src); 
     }
     t2 = System.currentTimeMillis();
     res = 0;
     for (byte b : byteData) {
        res += b;
     }
     System.out.println("[time spark vectorAPI boolean unpack] " + (t2-t1) + " ms [res] " + res);
  } 
}
