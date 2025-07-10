

//////////////////////////////////////////////////////////////////////////////////////
///////// AUTO-GENERATED PARQUET 14 BIT VECTORIZED INTEGER UNPACKING ALGORITHM /////////
//////////////////////////////////////////////////////////////////////////////////////


import jdk.incubator.vector.*;

public class VectorBitUnpacker14 {

  // Permutation tables.
  static int [] perm_table0 = {
     0,63,2,63,6,63,10,63,
     14,63,16,63,20,63,24,63,
     28,63,30,63,34,63,38,63,
     42,63,44,63,48,63,52,63,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static int [] perm_table1 = {
     2,63,4,63,8,63,12,63,
     16,63,18,63,22,63,26,63,
     30,63,32,63,36,63,40,63,
     44,63,46,63,50,63,54,63,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static int [] perm_table2 = {
     0,63,6,63,10,63,0,63,
     0,63,20,63,24,63,0,63,
     0,63,34,63,38,63,0,63,
     0,63,48,63,52,63,0,63,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // Left shift tables.
  static  short [] lshift_table1 = {
     8,2,4,6,8,2,4,6,
     8,2,4,6,8,2,4,6,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  short [] lshift_table2 = {
     0,10,12,0,0,10,12,0,
     0,10,12,0,0,10,12,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // Right shift tables.
  static  short [] rshift_table0 = {
     0,6,4,2,0,6,4,2,
     0,6,4,2,0,6,4,2,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // AndMask tables.
  static  short [] and_mask_table0 = {
     255,3,15,63,255,3,15,63,
     255,3,15,63,255,3,15,63,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  short [] and_mask_table1 = {
     16383,1023,4095,16383,16383,1023,4095,16383,
     16383,1023,4095,16383,16383,1023,4095,16383,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  short [] and_mask_table2 = {
     0,16383,16383,0,0,16383,16383,0,
     0,16383,16383,0,0,16383,16383,0,
     0,0,0,0,0,0,0,0,
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
  public static final VectorMask<Byte> input_mask = VectorMask.fromLong(B256,  268435455L);
  
  public static final VectorSpecies<Short> S256 = ShortVector.SPECIES_256;
  public static final VectorMask<Short> or_mask = VectorMask.fromLong(S512 ,26214L);
  
  public static final VectorShuffle<Byte> perm_mask0 = VectorShuffle.fromArray(B512, perm_table0, 0);
  public static final VectorShuffle<Byte> perm_mask1 = VectorShuffle.fromArray(B512, perm_table1, 0);
  public static final VectorShuffle<Byte> perm_mask2 = VectorShuffle.fromArray(B512, perm_table2, 0);
  
  public static final Vector<Short> and_vec0 = ShortVector.fromArray(S512, and_mask_table0, 0);
  public static final Vector<Short> and_vec1 = ShortVector.fromArray(S512, and_mask_table1, 0);
  public static final Vector<Short> and_vec2 = ShortVector.fromArray(S512, and_mask_table2, 0);
  
  public static final Vector<Short> lshift_cnt1 = ShortVector.fromArray(S512, lshift_table1, 0);
  public static final Vector<Short> lshift_cnt2 = ShortVector.fromArray(S512, lshift_table2, 0);
  
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

     ShortVector tempRes2 = byteVector.rearrange(perm_mask2)
               .reinterpretAsShorts()
               .lanewise(VectorOperators.LSHL, lshift_cnt2)
               .lanewise(VectorOperators.AND, and_vec2);

     tempRes0  = tempRes0.lanewise(VectorOperators.OR, tempRes1);

     tempRes0  = tempRes0.lanewise(VectorOperators.OR, tempRes2, or_mask);
     tempRes0.castShape(I512, 0).reinterpretAsInts().intoArray(out, outPos);
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
     for(int i = 0, j = 0 ; i < in.length-14 ; i+=14, j+= 8) {
        packer.unpack8Values(in, i, out, j);
     }
  }
  
  public static void vector_packing(byte [] in , int [] out, int ctr) {
     int i = 0;
     int j = 0;
     for(; i < in.length-28; i+=28, j+=16) {
        VectorBitUnpacker14.unpack8Values_vec(in, i, out, j);
     }
     for(; i < in.length-14; i+=14, j+= 8) {
        packer.unpack8Values(in, i, out, j);
     }
  }

  public static final BytePacker packer =  ByteBitPackingLE.factory.newBytePacker(14); 
  public static final int SIZE = 512;

  public static void main(String [] args) {
      byte [] in = new byte[SIZE*7];
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

} // Class VectorBitUnpacker14
