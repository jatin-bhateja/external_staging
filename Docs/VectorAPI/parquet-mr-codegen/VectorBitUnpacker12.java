

//////////////////////////////////////////////////////////////////////////////////////
///////// AUTO-GENERATED PARQUET 12 BIT VECTORIZED INTEGER UNPACKING ALGORITHM /////////
//////////////////////////////////////////////////////////////////////////////////////


import jdk.incubator.vector.*;

public class VectorBitUnpacker12 {

  // Permutation tables.
  static int [] perm_table0 = {
     0,63,2,63,6,63,8,63,
     12,63,14,63,18,63,20,63,
     24,63,26,63,30,63,32,63,
     36,63,38,63,42,63,44,63,
     48,63,50,63,54,63,56,63,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static int [] perm_table1 = {
     2,63,4,63,8,63,10,63,
     14,63,16,63,20,63,22,63,
     26,63,28,63,32,63,34,63,
     38,63,40,63,44,63,46,63,
     50,63,52,63,56,63,58,63,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // Left shift tables.
  static  short [] lshift_table1 = {
     8,4,8,4,8,4,8,4,
     8,4,8,4,8,4,8,4,
     8,4,8,4,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // Right shift tables.
  static  short [] rshift_table0 = {
     0,4,0,4,0,4,0,4,
     0,4,0,4,0,4,0,4,
     0,4,0,4,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // AndMask tables.
  static  short [] and_mask_table0 = {
     255,15,255,15,255,15,255,15,
     255,15,255,15,255,15,255,15,
     255,15,255,15,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  short [] and_mask_table1 = {
     4095,4095,4095,4095,4095,4095,4095,4095,
     4095,4095,4095,4095,4095,4095,4095,4095,
     4095,4095,4095,4095,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };


  // Global Initializing declerations.
  public static final VectorSpecies<Byte> B256 = ByteVector.SPECIES_256;
  public static final VectorSpecies<Integer> I512 = IntVector.SPECIES_512;
  public static final VectorSpecies<Short> S512 = ShortVector.SPECIES_512;
  public static final VectorSpecies<Byte> B512 = ByteVector.SPECIES_512;
  public static final VectorMask<Byte> input_mask = VectorMask.fromLong(B256,  1073741823L);
  public static final VectorMask<Integer> output_mask = VectorMask.fromLong(I512,  15L);
  
  public static final VectorMask<Short> or_mask = VectorMask.fromLong(S512 ,1048575L);
  
  public static final VectorShuffle<Byte> perm_mask0 = VectorShuffle.fromArray(B512, perm_table0, 0);
  public static final VectorShuffle<Byte> perm_mask1 = VectorShuffle.fromArray(B512, perm_table1, 0);
  
  public static final Vector<Short> and_vec0 = ShortVector.fromArray(S512, and_mask_table0, 0);
  public static final Vector<Short> and_vec1 = ShortVector.fromArray(S512, and_mask_table1, 0);
  
  public static final Vector<Short> lshift_cnt1 = ShortVector.fromArray(S512, lshift_table1, 0);
  
  public static final Vector<Short> rshift_cnt0 = ShortVector.fromArray(S512, rshift_table0, 0);
  

  public static void unpack8Values_vec(final byte[] in, final int inPos, final int[] out, final int outPos) {
     ByteVector byteVector = ByteVector.fromArray(B256, in, inPos, input_mask)
                                       .castShape(S512, 0)
                                       .reinterpretAsBytes();

     ShortVector tempRes0 = byteVector.rearrange(perm_mask0)
               .reinterpretAsShorts()
               .lanewise(VectorOperators.LSHR, rshift_cnt0)
               .lanewise(VectorOperators.AND, and_vec0);

     ShortVector tempRes1 = byteVector.rearrange(perm_mask1)
               .reinterpretAsShorts()
               .lanewise(VectorOperators.LSHL, lshift_cnt1)
               .lanewise(VectorOperators.AND, and_vec1);

     tempRes0  = tempRes0.lanewise(VectorOperators.OR, tempRes1, or_mask);
     tempRes0.castShape(I512, 0).reinterpretAsInts().intoArray(out, outPos);
     tempRes0.castShape(I512, 1).reinterpretAsInts().intoArray(out, outPos+16, output_mask);
  }

  public static final int ITERS = 500000;

  public static long addOutputs(int [] out) {
     long res = 0;
     // TODO: Tail should be a truely scalar code, currently scalar code is also processed in batches.
     // Check how parquet handels it and call those appropriate routines for tail processing.
     for(int i = 0; i < SIZE - 64; i++) {
        res += out[i];
     }
     return res;
  }
  
  public static void scalar_packing(byte [] in , int [] out, int ctr) {
     for(int i = 0, j = 0 ; i < in.length-12 ; i+=12, j+= 8) {
        packer.unpack8Values(in, i, out, j);
     }
  }
  
  public static void vector_packing(byte [] in , int [] out, int ctr) {
     int i = 0;
     int j = 0;
     for(; i < in.length-30; i+=30, j+=20) {
        VectorBitUnpacker12.unpack8Values_vec(in, i, out, j);
     }
     for(; i < in.length-12; i+=12, j+= 8) {
        packer.unpack8Values(in, i, out, j);
     }
  }

  public static final BytePacker packer =  ByteBitPackingLE.factory.newBytePacker(12); 
  public static final int SIZE = 512;

  public static void main(String [] args) {
      byte [] in = new byte[SIZE*3];
      int [] out = new int[SIZE*2];
      for(int i = 0 ; i < in.length ;i++) {
         in[i] = (byte)i;
      }

      for(int i = 0; i < ITERS; i++) {
         scalar_packing(in, out, i & (SIZE-1)); 
      } 
      long t1 = System.currentTimeMillis();
      for(int i = 0; i < ITERS; i++) {
         scalar_packing(in, out, i & (SIZE-1)); 
      } 
      long t2 = System.currentTimeMillis();
      long scalar_res = addOutputs(out);
      System.out.println("[Res] " + scalar_res + " [Scalar Time] " + (t2-t1) + " ms");

      for(int i = 0; i < ITERS; i++) {
         vector_packing(in, out, i & (SIZE-1)); 
      } 
      t1 = System.currentTimeMillis();
      for(int i = 0; i < ITERS; i++) {
         vector_packing(in, out, i & (SIZE-1)); 
      } 
      t2 = System.currentTimeMillis();
      long vector_res = addOutputs(out);
      String validation = vector_res == scalar_res ? "PASS" : "FAIL"; 
      System.out.println("[Res] " + vector_res + " [Vector Time] " + (t2-t1) + " ms   [Validation] " + validation); 
  }

} // Class VectorBitUnpacker12
