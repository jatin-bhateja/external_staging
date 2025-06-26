
import jdk.incubator.vector.*;

class Lemire3BitUnpack {
 
   public static short [] rshift_cnt_arr = {
     0,3,6,1,4,7,2,5,0,3,6,1,4,7,2,5,
     0,3,6,1,4,7,2,5,0,3,6,1,4,7,2,5,
   };

   public static short [] lshift_cnt_arr = {
     0,3,2,1,4,1,2,5,0,3,2,1,4,1,2,5,
     0,3,2,1,4,1,2,5,0,3,2,1,4,1,2,5,
   };

   public static short [] and_val_arr = {
     7,7,3,7,7,1,7,7,7,7,3,7,7,1,7,7,
     7,7,3,7,7,1,7,7,7,7,3,7,7,1,7,7,
   };

   public static int [] perm_pos0_arr = {
     0,63,0,63,0,63,2,63,2,63,2,63,4,63,4,63,
     6,63,6,63,6,63,8,63,8,63,8,63,10,63,10,63,
     12,63,12,63,12,63,14,63,14,63,14,63,16,63,16,63,
     18,63,18,63,18,63,20,63,20,63,20,63,22,63,22,63
   };

   public static int [] perm_pos1_arr = {
     0,63,0,63,2,63,2,63,2,63,4,63,4,63,4,63,
     6,63,6,63,8,63,8,63,8,63,10,63,10,63,10,63,
     12,63,12,63,14,63,14,63,14,63,16,63,16,63,16,63,
     18,63,18,63,20,63,20,63,20,63,22,63,22,63,22,63
   };

   public static VectorShuffle<Byte> perm_mask0;
   public static VectorShuffle<Byte> perm_mask1;
   public static VectorMask<Byte> inp_mask;
   public static VectorMask<Short> or_mask;
   public static jdk.incubator.vector.Vector<Short> rshift_cnt;
   public static jdk.incubator.vector.Vector<Short> lshift_cnt;
   public static jdk.incubator.vector.Vector<Short> and_vec;
 
   public static final VectorSpecies<Byte> B128 = ByteVector.SPECIES_128;
   public static final VectorSpecies<Byte> B512 = ByteVector.SPECIES_512;
   public static final VectorSpecies<Short> S512 = ShortVector.SPECIES_512;
   public static final VectorSpecies<Integer> I512 = IntVector.SPECIES_512;

   public static final int ITERS = 100000;

   /*  
   // Vectorized algorithm is based on the approach of adding partial redundancies in LHS expression
   // of all other assignments except 2nd and 5th to cover up for extra shift operation in the LHS
   // expression these assignments.
   // Towards the end using predicated vector OR operation we can scrap the effect of redundancies on RHS expression 
   //
   // Logic:
   // 3 bytes are feeding 8 int values.
   // by induction
   // 12 bytes can feed 32 int values (cap of 512 bit vector hit)
   // thus
   // 12 bytes can feed 32 short values (512 bit vector)
   // LHS expression of each assignment is now composed of macro expression involving shift and logical AND operations.
   // As the final step perform predicated vector OR operation to filter out redundant shifts.
   //
   // Following is the transformed version of scalar method which is easy to vectorize.
   // using VectorAPIs. 
   //
   public static void unpack8ValuesVectorVIEW(final byte[] in, final int inPos, final int[] out, final int outPos) {
           out[ 0 + outPos] =
                   //             [_____210]
                   //                  [210]
                   ((((int)in[ 0 + inPos]) >> 0) & 7)
                          |
                   ((((int)in[ 0 + inPos]) << 0) & 7); // OR masked off
           out[ 1 + outPos] =
                   //             [__543___]
                   //               [210]
                   ((((int)in[ 0 + inPos]) >>  3) & 7)
                          |
                   ((((int)in[ 0 + inPos]) <<  3) & 7); // OR masked off
           out[ 2 + outPos] =
                   //             [76______]
                   //            [_10]
                   ((((int)in[ 0 + inPos]) >>  6) & 3)
                           | //             [_______0]
                           //                    [2__]
                   ((((int)in[ 1 + inPos]) <<  2) & 7); // OR masked on
           out[ 3 + outPos] =
                   //             [____321_]
                   //                 [210]
                   ((((int)in[ 1 + inPos]) >>  1) & 7)
                           |
                   ((((int)in[ 1 + inPos]) <<  1) & 7); // OR masked off
           out[ 4 + outPos] =
                   //             [_654____]
                   //              [210]
                   ((((int)in[ 1 + inPos]) >>  4) & 7)
                           |
                   ((((int)in[ 1 + inPos]) <<  4) & 7); // OR masked off
           out[ 5 + outPos] =
                   //             [7_______]
                   //           [__0]
                   ((((int)in[ 1 + inPos]) >>  7) & 1)
                           | //             [______10]
           //                   [21_]
                   ((((int)in[ 2 + inPos]) <<  1) & 7); // OR masked on
           out[ 6 + outPos] =
                   //             [___432__]
                   //                [210]
                   ((((int)in[ 2 + inPos]) >>  2) & 7)
                           |
                   ((((int)in[ 2 + inPos]) <<  2) & 7); // OR masked off
           out[ 7 + outPos] =
                   //             [765_____]
                   //             [210]
                   ((((int)in[ 2 + inPos]) >>  5) & 7)
                           |
                   ((((int)in[ 2 + inPos]) <<  5) & 7); // OR masked off
       }
   */

   public static void unpack8Values_vec(final byte[] in, final int inPos, final int[] out, final int outPos) {
     ByteVector byteVector = ByteVector.fromArray(B128, in, inPos, inp_mask)
                             .castShape(S512, 0)
                             .reinterpretAsBytes();

     ShortVector tempRes1 = byteVector.rearrange(perm_mask0)
                            .reinterpretAsShorts()
                            .lanewise(VectorOperators.ASHR, rshift_cnt)
                            .lanewise(VectorOperators.AND, and_vec); 

     ShortVector tempRes2 = byteVector.rearrange(perm_mask1)
                            .reinterpretAsShorts()
                            .lanewise(VectorOperators.LSHL, lshift_cnt)
                            .lanewise(VectorOperators.AND, S512.broadcast(7));
     
     tempRes1 = tempRes1.lanewise(VectorOperators.OR, tempRes2, or_mask);

     tempRes1.castShape(I512, 0).reinterpretAsInts().intoArray(out, outPos);
     tempRes1.castShape(I512, 1).reinterpretAsInts().intoArray(out, outPos+16);
   }


   public static void unpack8Values(final byte[] in, final int inPos, final int[] out, final int outPos) {
        out[ 0 + outPos] =
                //             [_____210]
                //                  [210]
                ((((int)in[ 0 + inPos]) >> 0) & 7);
        out[ 1 + outPos] =
                //             [__543___]
                //               [210]
                ((((int)in[ 0 + inPos]) >>  3) & 7);
        out[ 2 + outPos] =
                //             [76______]
                //            [_10]
                ((((int)in[ 0 + inPos]) >>  6) & 3)
                        | //             [_______0]
                        //                    [2__]
                        ((((int)in[ 1 + inPos]) <<  2) & 7);
        out[ 3 + outPos] =
                //             [____321_]
                //                 [210]
                ((((int)in[ 1 + inPos]) >>  1) & 7);
        out[ 4 + outPos] =
                //             [_654____]
                //              [210]
                ((((int)in[ 1 + inPos]) >>  4) & 7);
        out[ 5 + outPos] =
                //             [7_______]
                //           [__0]
                ((((int)in[ 1 + inPos]) >>  7) & 1)
                        | //             [______10]
        //                   [21_]
                ((((int)in[ 2 + inPos]) <<  1) & 7);
        out[ 6 + outPos] =
                //             [___432__]
                //                [210]
                ((((int)in[ 2 + inPos]) >>  2) & 7);
        out[ 7 + outPos] =
                //             [765_____]
                //             [210]
                ((((int)in[ 2 + inPos]) >>  5) & 7);
    }

    public static int scalar_packing(byte [] in , int [] out, int ctr) {
       for(int i = 0, j = 0 ; i < in.length-3 ; i+=3, j+=8) {
          unpack8Values(in, i, out, j);
       }
       return out[ctr];
    }
    
    public static int vector_packing(byte [] in , int [] out, int ctr) {
       int i = 0;
       int j = 0;
       for(; i < in.length-12; i+=12, j+=32) {
          unpack8Values_vec(in, i, out, j);
       }
       for(; i < in.length-3; i+=3, j+=8) {
          unpack8Values(in, i, out, j);
       }
       return out[ctr];
    }

    public static void main(String [] args) {
        int res = 0;
        byte [] in = new byte[1024];
        int [] out = new int[2729];
        for(int i = 0 ; i < in.length ;i++) {
           in[i] = (byte)i;
        }

        inp_mask = VectorMask.fromLong(B128, 4095);
        or_mask = VectorMask.fromLong(S512, 0x2424242424242424L);
        perm_mask0 = VectorShuffle.fromArray(B512, perm_pos0_arr, 0);
        perm_mask1 = VectorShuffle.fromArray(B512, perm_pos1_arr, 0);
        lshift_cnt = ShortVector.fromArray(S512, lshift_cnt_arr, 0);
        rshift_cnt = ShortVector.fromArray(S512, rshift_cnt_arr, 0);
        and_vec = ShortVector.fromArray(S512, and_val_arr, 0);
        
        for(int i = 0; i < ITERS; i++) {
          res += scalar_packing(in, out, i % out.length); 
        } 
        res = 0;
        long t1 = System.currentTimeMillis();
        for(int i = 0; i < ITERS; i++) {
          res += scalar_packing(in, out, i % out.length); 
        } 
        long t2 = System.currentTimeMillis();
        System.out.println("[Res] " + res + " [Scalar Time] " + (t2-t1) + " ms");
        //for(int i = 0 ; i < 16; i++) {
        //  System.out.println("out["+i+"] = "+out[i]);
        //}

        for(int i = 0; i < ITERS; i++) {
          res += vector_packing(in, out, i % out.length); 
        } 
        res = 0;
        t1 = System.currentTimeMillis();
        for(int i = 0; i < ITERS; i++) {
          res += vector_packing(in, out, i % out.length); 
        } 
        t2 = System.currentTimeMillis();
        System.out.println("[Res] " + res + " [Vector Time] " + (t2-t1) + " ms");
        //for(int i = 0 ; i < 16; i++) {
        //  System.out.println("out["+i+"] = "+out[i]);
        //}
    }
}
