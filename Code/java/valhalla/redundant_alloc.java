
primitive class VectorPayloadMF64B  {
   byte bstore;
   public VectorPayloadMF64B(byte val) {
      this.bstore = val;
   }
}

value class ByteVector64 {
   final VectorPayloadMF64B payload;
   public ByteVector64(VectorPayloadMF64B obj) {
      this.payload = obj;
   }
}

public class redundant_alloc  {
   public static VectorPayloadMF64B get_val(int i) {
      return new VectorPayloadMF64B((byte)i);
   }

   public static void main(String [] args) {
      int res = 0;
      for (int i = 0; i < 100000; i++) {
         res += new ByteVector64(get_val(i)).payload.bstore;
      }
      System.out.println(res);
   }
}
