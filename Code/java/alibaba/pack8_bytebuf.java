
import java.nio.ByteBuffer;
import jdk.incubator.vector.*;

class LimereUnpack8Values { 

   public static void unpack8Values_ByteBuffer(final ByteBuffer in, final int inPos, final int[] out, final int outPos) {
     out[0 + outPos] =
     // [76543210]
     // [76543210]
     ((((int) in.get(0 + inPos))) & 255);
     out[1 + outPos] =
     // [76543210]
     // [76543210]
     ((((int) in.get(1 + inPos))) & 255);
     out[2 + outPos] =
     // [76543210]
     // [76543210]
     ((((int) in.get(2 + inPos))) & 255);
     out[3 + outPos] =
     // [76543210]
     // [76543210]
     ((((int) in.get(3 + inPos))) & 255);
     out[4 + outPos] =
     // [76543210]
     // [76543210]
     ((((int) in.get(4 + inPos))) & 255);
     out[5 + outPos] =
     // [76543210]
     // [76543210]
     ((((int) in.get(5 + inPos))) & 255);
     out[6 + outPos] =
     // [76543210]
     // [76543210]
     ((((int) in.get(6 + inPos))) & 255);
     out[7 + outPos] =
     // [76543210]
     // [76543210]
     ((((int) in.get(7 + inPos))) & 255);
   }

   public static void unpack8Values(final byte[] in, final int inPos, final int[] out, final int outPos) {
     out[0 + outPos] =
     // [76543210]
     // [76543210]
     ((((int) in[0 + inPos])) & 255);
     out[1 + outPos] =
     // [76543210]
     // [76543210]
     ((((int) in[1 + inPos])) & 255);
     out[2 + outPos] =
     // [76543210]
     // [76543210]
     ((((int) in[2 + inPos])) & 255);
     out[3 + outPos] =
     // [76543210]
     // [76543210]
     ((((int) in[3 + inPos])) & 255);
     out[4 + outPos] =
     // [76543210]
     // [76543210]
     ((((int) in[4 + inPos])) & 255);
     out[5 + outPos] =
     // [76543210]
     // [76543210]
     ((((int) in[5 + inPos])) & 255);
     out[6 + outPos] =
     // [76543210]
     // [76543210]
     ((((int) in[6 + inPos])) & 255);
     out[7 + outPos] =
     // [76543210]
     // [76543210]
     ((((int) in[7 + inPos])) & 255);
   }

   public static final VectorSpecies<Byte> BSPECIES = ByteVector.SPECIES_128;
   public static final VectorSpecies<Integer> ISPECIES = IntVector.SPECIES_512;

   public static void vec_unpack8Values(final ByteBuffer in, final int inPos, final int[] out, final int outPos) {
      ByteVector bvec = ByteVector.fromByteBuffer(BSPECIES, in, inPos, java.nio.ByteOrder.LITTLE_ENDIAN);
      bvec.castShape(ISPECIES, 0)
          .lanewise(VectorOperators.AND, 255)
          .reinterpretAsInts()
          .intoArray(out, outPos);
   }

   public static int scalar_packing(byte [] in , int [] out, int ctr) {
       for(int i = 0 ; i < in.length; i+=8) {
          unpack8Values(in, i, out, i);
       }
       return out[ctr];
   }

   public static int vector_packing(ByteBuffer in , int [] out, int ctr) {
       int i = 0;
       int j = 0;
       for(; i < BSPECIES.loopBound(in.capacity()); i+=BSPECIES.length()) {
          vec_unpack8Values(in, i, out, i);
       }
       for(; i < in.capacity(); i+=8) {
          unpack8Values_ByteBuffer(in, i, out, i);
       }
       return out[ctr];
   }

   public static void main(String [] args) {
      int LEN = Integer.parseInt(args[0]);
      assert LEN > 0 && ((LEN & LEN-1) == 0);
      
      int  [] out = new int[LEN];
      byte [] in  = new byte[LEN];
      ByteBuffer in_buff = ByteBuffer.allocateDirect(LEN);
      for(int i = 0 ; i < in.length; i++) {
        in[i] = (byte)i;
        in_buff = in_buff.put((byte)i);
      }
      in_buff.rewind();

      for(int i = 0; i < 100000; i++) {
         scalar_packing(in, out, i&(in.length-1)); 
      }
      long t1 = System.currentTimeMillis();
      for(int i = 0; i < 100000; i++) {
         scalar_packing(in, out, i&(in.length-1)); 
      }
      long t2 = System.currentTimeMillis();
      int res = 0;
      for(int i = 0; i < out.length; i++) {
         res += out[i];
      }
      System.out.println("[Scalar Time] " + (t2-t1) + " [Res] " + res);

      for(int i = 0; i < 100000; i++) {
         vector_packing(in_buff, out, i&(in.length-1)); 
      }
      t1 = System.currentTimeMillis();
      for(int i = 0; i < 100000; i++) {
         vector_packing(in_buff, out, i&(in.length-1)); 
      }
      t2 = System.currentTimeMillis();
      res = 0;
      for(int i = 0; i < out.length; i++) {
         res += out[i];
      }
      System.out.println("[Vector Time] " + (t2-t1) + " [Res] " + res);
   }
}
