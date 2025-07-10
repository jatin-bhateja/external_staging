

//////////////////////////////////////////////////////////////////////////////////////
///////// AUTO-GENERATED PARQUET 18 BIT VECTORIZED INTEGER UNPACKING ALGORITHM /////////
//////////////////////////////////////////////////////////////////////////////////////


import jdk.incubator.vector.*;

public class VectorBitUnpacker18 {

  // Permutation tables.
  static int [] perm_table0 = {
     0,2,4,6,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static int [] perm_table1 = {
     1,3,5,7,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static int [] perm_table2 = {
     2,4,6,8,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // Left shift tables.
  static  int [] lshift_table1 = {
     8,6,4,2,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] lshift_table2 = {
     16,14,12,10,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // Right shift tables.
  static  int [] rshift_table0 = {
     0,2,4,6,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // AndMask tables.
  static  int [] and_mask_table0 = {
     255,63,15,3,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] and_mask_table1 = {
     65535,16383,4095,1023,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] and_mask_table2 = {
     262143,262143,262143,262143,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };


  // Global Initializing declerations.
  public static final VectorSpecies<Byte> B128 = ByteVector.SPECIES_128;
  public static final VectorSpecies<Integer> I256 = IntVector.SPECIES_256;
  public static final VectorSpecies<Byte> B256 = ByteVector.SPECIES_128;
  public static final VectorMask<Byte> input_mask = VectorMask.fromLong(B128,  511L);
  
  public static final VectorMask<Integer> or_mask = VectorMask.fromLong(I256, 15L);
  
  public static final VectorShuffle<Byte> perm_mask0 = VectorShuffle.fromArray(B256, perm_table0, 0);
  public static final VectorShuffle<Byte> perm_mask1 = VectorShuffle.fromArray(B256, perm_table1, 0);
  public static final VectorShuffle<Byte> perm_mask2 = VectorShuffle.fromArray(B256, perm_table2, 0);
  
  public static final Vector<Integer> and_vec0 = IntVector.fromArray(I256, and_mask_table0, 0);
  public static final Vector<Integer> and_vec1 = IntVector.fromArray(I256, and_mask_table1, 0);
  public static final Vector<Integer> and_vec2 = IntVector.fromArray(I256, and_mask_table2, 0);
  
  public static final Vector<Integer> lshift_cnt1 = IntVector.fromArray(I256, lshift_table1, 0);
  public static final Vector<Integer> lshift_cnt2 = IntVector.fromArray(I256, lshift_table2, 0);
  
  public static final Vector<Integer> rshift_cnt0 = IntVector.fromArray(I256, rshift_table0, 0);
  

  public static void unpack8Values_vec(final byte[] in, final int inPos, final int[] out, final int outPos) {
    ByteVector byteVector = ByteVector.fromArray(B128, in, inPos, input_mask);

    IntVector tempRes0 = byteVector.rearrange(perm_mask0)
              .convertShape(VectorOperators.B2I, I256, 0)
              .reinterpretAsInts()
               .lanewise(VectorOperators.LSHR, rshift_cnt0)
              .lanewise(VectorOperators.AND, and_vec0);

    IntVector tempRes1 = byteVector.rearrange(perm_mask1)
              .convertShape(VectorOperators.B2I, I256, 0)
              .reinterpretAsInts()
               .lanewise(VectorOperators.LSHL, lshift_cnt1)
              .lanewise(VectorOperators.AND, and_vec1);

    IntVector tempRes2 = byteVector.rearrange(perm_mask2)
              .convertShape(VectorOperators.B2I, I256, 0)
              .reinterpretAsInts()
               .lanewise(VectorOperators.LSHL, lshift_cnt2)
              .lanewise(VectorOperators.AND, and_vec2);

    tempRes0  = tempRes0.lanewise(VectorOperators.OR, tempRes1);

    tempRes0  = tempRes0.lanewise(VectorOperators.OR, tempRes2, or_mask);
    tempRes0.reinterpretAsInts().intoArray(out, outPos);
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
     for(int i = 0, j = 0 ; i < in.length-18 ; i+=18, j+= 8) {
        packer.unpack8Values(in, i, out, j);
     }
  }
  
  public static void vector_packing(byte [] in , int [] out, int ctr) {
     int i = 0;
     int j = 0;
     for(; i < in.length-9; i+=9, j+=4) {
        VectorBitUnpacker18.unpack8Values_vec(in, i, out, j);
     }
  }

  public static final BytePacker packer =  ByteBitPackingLE.factory.newBytePacker(18); 
  public static final int SIZE = 512;

  public static void main(String [] args) {
      byte [] in = new byte[SIZE*9];
      int [] out = new int[SIZE*4];
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

} // Class VectorBitUnpacker18
