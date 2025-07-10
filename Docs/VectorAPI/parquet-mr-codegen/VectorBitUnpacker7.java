

//////////////////////////////////////////////////////////////////////////////////////
///////// AUTO-GENERATED PARQUET 7 BIT VECTORIZED INTEGER UNPACKING ALGORITHM /////////
//////////////////////////////////////////////////////////////////////////////////////


import jdk.incubator.vector.*;

public class VectorBitUnpacker7 {

  // Permutation tables.
  static int [] perm_table0 = {
     0,63,0,63,2,63,4,63,
     6,63,8,63,10,63,12,63,
     14,63,14,63,16,63,18,63,
     20,63,22,63,24,63,26,63,
     28,63,28,63,30,63,32,63,
     34,63,36,63,38,63,40,63,
     42,63,42,63,44,63,46,63,
     48,63,50,63,52,63,54,63, 
  };
  static int [] perm_table1 = {
     0,63,2,63,4,63,6,63,
     8,63,10,63,12,63,0,63,
     0,63,16,63,18,63,20,63,
     22,63,24,63,26,63,0,63,
     0,63,30,63,32,63,34,63,
     36,63,38,63,40,63,0,63,
     0,63,44,63,46,63,48,63,
     50,63,52,63,54,63,0,63, 
  };
  // Left shift tables.
  static  short [] lshift_table1 = {
     0,1,2,3,4,5,6,0,
     0,1,2,3,4,5,6,0,
     0,1,2,3,4,5,6,0,
     0,1,2,3,4,5,6,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // Right shift tables.
  static  short [] rshift_table0 = {
     0,7,6,5,4,3,2,1,
     0,7,6,5,4,3,2,1,
     0,7,6,5,4,3,2,1,
     0,7,6,5,4,3,2,1,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  // AndMask tables.
  static  short [] and_mask_table0 = {
     127,1,3,7,15,31,63,127,
     127,1,3,7,15,31,63,127,
     127,1,3,7,15,31,63,127,
     127,1,3,7,15,31,63,127,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0,
     0,0,0,0,0,0,0,0, 
  };
  static  short [] and_mask_table1 = {
     0,127,127,127,127,127,127,0,
     0,127,127,127,127,127,127,0,
     0,127,127,127,127,127,127,0,
     0,127,127,127,127,127,127,0,
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
  
  public static final VectorMask<Short> or_mask = VectorMask.fromLong(S512 ,2122219134L);
  
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
     tempRes0.castShape(I512, 1).reinterpretAsInts().intoArray(out, outPos+16);
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
     for(int i = 0, j = 0 ; i < in.length-7 ; i+=7, j+= 8) {
        packer.unpack8Values(in, i, out, j);
     }
  }
  
  public static void vector_packing(byte [] in , int [] out, int ctr) {
     int i = 0;
     int j = 0;
     for(; i < in.length-28; i+=28, j+=32) {
        VectorBitUnpacker7.unpack8Values_vec(in, i, out, j);
     }
     for(; i < in.length-7; i+=7, j+= 8) {
        packer.unpack8Values(in, i, out, j);
     }
  }

  public static final BytePacker packer =  ByteBitPackingLE.factory.newBytePacker(7); 
  public static final int SIZE = 512;

  public static void main(String [] args) {
      byte [] in = new byte[SIZE*7];
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

} // Class VectorBitUnpacker7
