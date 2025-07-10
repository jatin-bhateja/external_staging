

//////////////////////////////////////////////////////////////////////////////////////
///////// AUTO-GENERATED PARQUET 30 BIT VECTORIZED INTEGER UNPACKING ALGORITHM /////////
//////////////////////////////////////////////////////////////////////////////////////


import jdk.incubator.vector.*;

public class VectorBitUnpacker30 {

  // Permutation tables.
  static int [] perm_table0 = {
     0,3,7,11,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static int [] perm_table1 = {
     1,4,8,12,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static int [] perm_table2 = {
     2,5,9,13,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static int [] perm_table3 = {
     3,6,10,14,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static int [] perm_table4 = {
     0,7,11,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // Left shift tables.
  static  int [] lshift_table1 = {
     8,2,4,6,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] lshift_table2 = {
     16,10,12,14,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] lshift_table3 = {
     24,18,20,22,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] lshift_table4 = {
     0,26,28,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // Right shift tables.
  static  int [] rshift_table0 = {
     0,6,4,2,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // AndMask tables.
  static  int [] and_mask_table0 = {
     255,3,15,63,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] and_mask_table1 = {
     65535,1023,4095,16383,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] and_mask_table2 = {
     16777215,262143,1048575,4194303,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] and_mask_table3 = {
     1073741823,67108863,268435455,1073741823,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  int [] and_mask_table4 = {
     0,1073741823,1073741823,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };


  // Global Initializing declerations.
  public static final VectorSpecies<Byte> B128 = ByteVector.SPECIES_128;
  public static final VectorSpecies<Integer> I256 = IntVector.SPECIES_256;
  public static final VectorSpecies<Byte> B256 = ByteVector.SPECIES_128;
  public static final VectorMask<Byte> input_mask = VectorMask.fromLong(B128,  32767L);
  
  public static final VectorMask<Integer> or_mask = VectorMask.fromLong(I256, 6L);
  
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
     for(int i = 0, j = 0 ; i < in.length-30 ; i+=30, j+= 8) {
        packer.unpack8Values(in, i, out, j);
     }
  }
  
  public static void vector_packing(byte [] in , int [] out, int ctr) {
     int i = 0;
     int j = 0;
     for(; i < in.length-15; i+=15, j+=4) {
        VectorBitUnpacker30.unpack8Values_vec(in, i, out, j);
     }
  }

  public static final BytePacker packer =  ByteBitPackingLE.factory.newBytePacker(30); 
  public static final int SIZE = 512;

  public static void main(String [] args) {
      byte [] in = new byte[SIZE*15];
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

} // Class VectorBitUnpacker30
