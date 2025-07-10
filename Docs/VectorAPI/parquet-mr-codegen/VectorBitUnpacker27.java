

//////////////////////////////////////////////////////////////////////////////////////
///////// AUTO-GENERATED PARQUET 27 BIT VECTORIZED INTEGER UNPACKING ALGORITHM /////////
//////////////////////////////////////////////////////////////////////////////////////


import jdk.incubator.vector.*;

public class VectorBitUnpacker27 {

  // Permutation tables.
  static int [] perm_table0 = {
     0,3,6,10,13,16,20,23,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static int [] perm_table1 = {
     1,4,7,11,14,17,21,24,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static int [] perm_table2 = {
     2,5,8,12,15,18,22,25,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static int [] perm_table3 = {
     3,6,9,13,16,19,23,26,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static int [] perm_table4 = {
     0,0,10,0,0,20,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // Left shift tables.
  static  int [] lshift_table1 = {
     8,5,2,7,4,1,6,3,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] lshift_table2 = {
     16,13,10,15,12,9,14,11,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] lshift_table3 = {
     24,21,18,23,20,17,22,19,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] lshift_table4 = {
     0,0,26,0,0,25,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // Right shift tables.
  static  int [] rshift_table0 = {
     0,3,6,1,4,7,2,5,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // AndMask tables.
  static  int [] and_mask_table0 = {
     255,31,3,127,15,1,63,7,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] and_mask_table1 = {
     65535,8191,1023,32767,4095,511,16383,2047,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] and_mask_table2 = {
     16777215,2097151,262143,8388607,1048575,131071,4194303,524287,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] and_mask_table3 = {
     134217727,134217727,67108863,134217727,134217727,33554431,134217727,134217727,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] and_mask_table4 = {
     0,0,134217727,0,0,134217727,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };


  // Global Initializing declerations.
  public static final VectorSpecies<Byte> B256 = ByteVector.SPECIES_256;
  public static final VectorSpecies<Integer> I256 = IntVector.SPECIES_256;
  public static final VectorMask<Byte> input_mask = VectorMask.fromLong(B256,  134217727L);
  
  public static final VectorMask<Integer> or_mask = VectorMask.fromLong(I256, 36L);
  
  public static final VectorShuffle<Byte> perm_mask0 = VectorShuffle.fromArray(B256, perm_table0, 0);
  public static final VectorShuffle<Byte> perm_mask1 = VectorShuffle.fromArray(B256, perm_table1, 0);
  public static final VectorShuffle<Byte> perm_mask2 = VectorShuffle.fromArray(B256, perm_table2, 0);
  public static final VectorShuffle<Byte> perm_mask3 = VectorShuffle.fromArray(B256, perm_table3, 0);
  public static final VectorShuffle<Byte> perm_mask4 = VectorShuffle.fromArray(B256, perm_table4, 0);
  
  public static final Vector<Integer> and_vec0 = IntVector.fromArray(I256, and_mask_table0, 0);
  public static final Vector<Integer> and_vec1 = IntVector.fromArray(I256, and_mask_table1, 0);
  public static final Vector<Integer> and_vec2 = IntVector.fromArray(I256, and_mask_table2, 0);
  public static final Vector<Integer> and_vec3 = IntVector.fromArray(I256, and_mask_table3, 0);
  public static final Vector<Integer> and_vec4 = IntVector.fromArray(I256, and_mask_table4, 0);
  
  public static final Vector<Integer> lshift_cnt1 = IntVector.fromArray(I256, lshift_table1, 0);
  public static final Vector<Integer> lshift_cnt2 = IntVector.fromArray(I256, lshift_table2, 0);
  public static final Vector<Integer> lshift_cnt3 = IntVector.fromArray(I256, lshift_table3, 0);
  public static final Vector<Integer> lshift_cnt4 = IntVector.fromArray(I256, lshift_table4, 0);
  
  public static final Vector<Integer> rshift_cnt0 = IntVector.fromArray(I256, rshift_table0, 0);
  

  public static void unpack8Values_vec(final byte[] in, final int inPos, final int[] out, final int outPos) {
    ByteVector byteVector = ByteVector.fromArray(B256, in, inPos, input_mask);

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

    IntVector tempRes3 = byteVector.rearrange(perm_mask3)
              .convertShape(VectorOperators.B2I, I256, 0)
              .reinterpretAsInts()
               .lanewise(VectorOperators.LSHL, lshift_cnt3)
              .lanewise(VectorOperators.AND, and_vec3);

    IntVector tempRes4 = byteVector.rearrange(perm_mask4)
              .convertShape(VectorOperators.B2I, I256, 0)
              .reinterpretAsInts()
               .lanewise(VectorOperators.LSHL, lshift_cnt4)
              .lanewise(VectorOperators.AND, and_vec4);

    tempRes0  = tempRes0.lanewise(VectorOperators.OR, tempRes1);

    tempRes0  = tempRes0.lanewise(VectorOperators.OR, tempRes2);

    tempRes0  = tempRes0.lanewise(VectorOperators.OR, tempRes3);

    tempRes0  = tempRes0.lanewise(VectorOperators.OR, tempRes4, or_mask);
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
     for(int i = 0, j = 0 ; i < in.length-27 ; i+=27, j+= 8) {
        packer.unpack8Values(in, i, out, j);
     }
  }
  
  public static void vector_packing(byte [] in , int [] out, int ctr) {
     int i = 0;
     int j = 0;
     for(; i < in.length-27; i+=27, j+=8) {
        VectorBitUnpacker27.unpack8Values_vec(in, i, out, j);
     }
  }

  public static final BytePacker packer =  ByteBitPackingLE.factory.newBytePacker(27); 
  public static final int SIZE = 512;

  public static void main(String [] args) {
      byte [] in = new byte[SIZE*27];
      int [] out = new int[SIZE*8];
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

} // Class VectorBitUnpacker27
