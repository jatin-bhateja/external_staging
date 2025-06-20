import jdk.incubator.vector.*;
 
import java.nio.ByteBuffer;
 
class BitUnpack7Vector {
 
    public static void main(String [] args) throws Exception {
        test2();
        test1();
    }
 
    private static final short [] rshift_cnt_arr = {
            0,7,6,5,4,3,2,1,0,7,6,5,4,3,2,1,
            0,7,6,5,4,3,2,1,0,7,6,5,4,3,2,1,
    };
    private static final short [] lshift_cnt_arr = {
            0,1,2,3,4,5,6,1,0,1,2,3,4,5,6,1,
            0,1,2,3,4,5,6,1,0,1,2,3,4,5,6,1,
    };
    private static final short [] and_val_arr = {
            127,1,3,7,15,31,63,127,127,1,3,7,15,31,63,127,
            127,1,3,7,15,31,63,127,127,1,3,7,15,31,63,127
    };
    private static final int [] perm_pos0_arr = {
            0,63,0,63,2,63,4,63,6,63,8,63,10,63,12,63,
            14,63,14,63,16,63,18,63,20,63,22,63,24,63,26,63,
            28,63,28,63,30,63,32,63,34,63,36,63,38,63,40,63,
            42,63,42,63,44,63,46,63,48,63,50,63,52,63,54,63
    };
    private static final int [] perm_pos1_arr = {
            0,63,2,63,4,63,6,63,8,63,10,63,12,63,12,63,
            14,63,16,63,18,63,20,63,22,63,24,63,26,63,26,63,
            28,63,30,63,32,63,34,63,36,63,38,63,40,63,40,63,
            42,63,44,63,46,63,48,63,50,63,52,63,54,63,54,63
    };
    private static final VectorSpecies<Byte> B256 = ByteVector.SPECIES_256;
    private static final VectorSpecies<Byte> B512 = ByteVector.SPECIES_512;
    private static final VectorSpecies<Short> S512 = ShortVector.SPECIES_512;
    private static final VectorSpecies<Integer> I512 = IntVector.SPECIES_512;
    private static final VectorShuffle<Byte> perm_mask0 = VectorShuffle.fromArray(B512, perm_pos0_arr, 0);
    private static final VectorShuffle<Byte> perm_mask1 = VectorShuffle.fromArray(B512, perm_pos1_arr, 0);
    private static final VectorMask<Byte> inp_mask = VectorMask.fromLong(B256, 0xfffffff);
    private static final VectorMask<Short> or_mask = VectorMask.fromLong(S512, 0x7e7e7e7e7e7e7e7eL);
    private static final Vector<Short> rshift_cnt = ShortVector.fromArray(S512, rshift_cnt_arr, 0);
    private static final Vector<Short> lshift_cnt = ShortVector.fromArray(S512, lshift_cnt_arr, 0);
    private static final Vector<Short> and_vec = ShortVector.fromArray(S512, and_val_arr, 0);
 
 
 
 
    public static final int WITERS = 1000000;
    public static final int ITERS = 500000;
    public static int linputLen = 0;
 
/*
    public static void unpack8Values_vec(final ByteBuffer in, final int inPos, final int[] out, final int outPos) {
        ByteVector byteVector = ByteVector.fromByteBuffer(B256, in, inPos, in.order(), inp_mask)
                .castShape(S512, 0)
                .reinterpretAsBytes();
        ShortVector tempRes1 = byteVector.rearrange(perm_mask0)
                .reinterpretAsShorts()
                .lanewise(VectorOperators.ASHR, rshift_cnt)
                .lanewise(VectorOperators.AND, and_vec);
 
        ShortVector tempRes2 = byteVector.rearrange(perm_mask1)
                .reinterpretAsShorts()
                .lanewise(VectorOperators.LSHL, lshift_cnt)
                .lanewise(VectorOperators.AND, S512.broadcast(127));
 
        tempRes1 = tempRes1.lanewise(VectorOperators.OR, tempRes2, or_mask);
 
        tempRes1.castShape(I512, 0).reinterpretAsInts().intoArray(out, outPos);
        tempRes1.castShape(I512, 1).reinterpretAsInts().intoArray(out, outPos+16);
    }
 */
 
    public static void unpack8Values_vec(final byte[] in, final int inPos, final int[] out, final int outPos) {
        ByteVector byteVector = ByteVector.fromArray(B256, in, inPos, inp_mask)
                .castShape(S512, 0)
                .reinterpretAsBytes();
        ShortVector tempRes1 = byteVector.rearrange(perm_mask0)
                .reinterpretAsShorts()
                .lanewise(VectorOperators.ASHR, rshift_cnt)
                .lanewise(VectorOperators.AND, and_vec);
 
        ShortVector tempRes2 = byteVector.rearrange(perm_mask1)
                .reinterpretAsShorts()
                .lanewise(VectorOperators.LSHL, lshift_cnt)
                .lanewise(VectorOperators.AND, S512.broadcast(127));
 
        tempRes1 = tempRes1.lanewise(VectorOperators.OR, tempRes2, or_mask);
 
        tempRes1.castShape(I512, 0).reinterpretAsInts().intoArray(out, outPos);
        tempRes1.castShape(I512, 1).reinterpretAsInts().intoArray(out, outPos+16);
    }
 
    public static void unpack8Values(final ByteBuffer in, final int inPos, final int[] out, final int outPos) {
        out[ 0 + outPos] =
                //                 [_6543210]
                //                  [6543210]
                ((((int)in.get( 0 + inPos)) ) & 127);
        out[ 1 + outPos] =
                //                 [7_______]
                //           [______0]
                ((((int)in.get( 0 + inPos)) >>  7) & 1)
                        | //                 [__543210]
                        //                   [654321_]
                        ((((int)in.get( 1 + inPos)) <<  1) & 127);
        out[ 2 + outPos] =
                //                 [76______]
                //            [_____10]
                ((((int)in.get( 1 + inPos)) >>  6) & 3)
                        | //                 [___43210]
                        //                    [65432__]
                        ((((int)in.get( 2 + inPos)) <<  2) & 127);
        out[ 3 + outPos] =
                //                 [765_____]
                //             [____210]
                ((((int)in.get( 2 + inPos)) >>  5) & 7)
                        | //                 [____3210]
                        //                     [6543___]
                        ((((int)in.get( 3 + inPos)) <<  3) & 127);
        out[ 4 + outPos] =
                //                 [7654____]
                //              [___3210]
                ((((int)in.get( 3 + inPos)) >>  4) & 15)
                        | //                 [_____210]
                        //                      [654____]
                        ((((int)in.get( 4 + inPos)) <<  4) & 127);
        out[ 5 + outPos] =
                //                 [76543___]
                //               [__43210]
                ((((int)in.get( 4 + inPos)) >>  3) & 31)
                        | //                 [______10]
                        //                       [65_____]
                        ((((int)in.get( 5 + inPos)) <<  5) & 127);
        out[ 6 + outPos] =
                //                 [765432__]
                //                [_543210]
                ((((int)in.get( 5 + inPos)) >>  2) & 63)
                        | //                 [_______0]
                        //                        [6______]
                        ((((int)in.get( 6 + inPos)) <<  6) & 127);
        out[ 7 + outPos] =
                //                 [7654321_]
                //                 [6543210]
                ((((int)in.get( 6 + inPos)) >>  1) & 127);
    }
 
 
    public static void unpack8Values(final byte[] in, final int inPos, final int[] out, final int outPos) {
        out[ 0 + outPos] =
                //                 [_6543210]
                //                  [6543210]
                ((((int)in[ 0 + inPos]) ) & 127);
        out[ 1 + outPos] =
                //                 [7_______]
                //           [______0]
                ((((int)in[ 0 + inPos]) >>  7) & 1)
                        | //                 [__543210]
                        //                   [654321_]
                        ((((int)in[ 1 + inPos]) <<  1) & 127);
        out[ 2 + outPos] =
                //                 [76______]
                //            [_____10]
                ((((int)in[ 1 + inPos]) >>  6) & 3)
                        | //                 [___43210]
                        //                    [65432__]
                        ((((int)in[ 2 + inPos]) <<  2) & 127);
        out[ 3 + outPos] =
                //                 [765_____]
                //             [____210]
                ((((int)in[ 2 + inPos]) >>  5) & 7)
                        | //                 [____3210]
                        //                     [6543___]
                        ((((int)in[ 3 + inPos]) <<  3) & 127);
        out[ 4 + outPos] =
                //                 [7654____]
                //              [___3210]
                ((((int)in[ 3 + inPos]) >>  4) & 15)
                        | //                 [_____210]
                        //                      [654____]
                        ((((int)in[ 4 + inPos]) <<  4) & 127);
       out[ 5 + outPos] =
               //                 [76543___]
               //               [__43210]
               ((((int)in[ 4 + inPos]) >>  3) & 31)
                       | //                 [______10]
                       //                       [65_____]
                       ((((int)in[ 5 + inPos]) <<  5) & 127);
       out[ 6 + outPos] =
               //                 [765432__]
               //                [_543210]
               ((((int)in[ 5 + inPos]) >>  2) & 63)
                       | //                 [_______0]
                       //                        [6______]
                       ((((int)in[ 6 + inPos]) <<  6) & 127);
       out[ 7 + outPos] =
               //                 [7654321_]
               //                 [6543210]
               ((((int)in[ 6 + inPos]) >>  1) & 127);
   }
 
    public static int scalar_packing(byte [] in , int [] out, int ctr) {
        for(int i = 0, j = 0 ; i < in.length ; i+=7, j+=8) {
            unpack8Values(in, i, out, j);
        }
        return out[ctr];
    }
    public static int scalar_packing_byteBuffer(ByteBuffer in , int [] out, int ctr) {
        for(int i = 0, j = 0 ; i < in.capacity() ; i+=7, j+=8) {
            unpack8Values(in, i, out, j);
        }
        return out[ctr];
    }
 
    /*
    public static int vector_packing(ByteBuffer in , int [] out, int ctr) {
        int i = 0;
        int j = 0;
        int len = in.capacity();
        for(; i < (len-28); i+=28, j+=32) {
            unpack8Values_vec(in, i, out, j);
 
        }
        for(; i < len; i+=7, j+=8) {
            unpack8Values(in, i, out, j);
        }
        return out[ctr];
    }*/
 
    // The byte array's length is 1008 = 28 * 36.
    // he last iteration is running by parquet current api
    public static void vector_packing1(byte [] in , int [] out) {
        int i = 0;
        int j = 0;
        for(; i < in.length-28; i+=28, j+=32) {
            unpack8Values_vec(in, i, out, j);
        }
        for(; i < in.length; i+=7, j+=8) {
            unpack8Values(in, i, out, j);
        }
    }
 
    // The byte array's length is 1008 + 28,
    // I skip the last iteration, and get the same result.
    public static void vector_packing2(byte [] in2 , int [] out) {
        int i = 0;
        int j = 0;
        for(; i < in2.length-28; i+=28, j+=32) {
            unpack8Values_vec(in2, i, out, j);
        }
    }
 
    // The byte array's length is 1008 = 28 * 36.
    // he last iteration is running by java17 vector api
    public static void vector_packing3(byte [] in , int [] out) {
        int i = 0;
        int j = 0;
        for(; i < in.length; i+=28, j+=32) {
            unpack8Values_vec(in, i, out, j);
        }
    }
    private static void test1() throws Exception {
        // 1008 is a multiple of 28
        byte [] in = new byte[1008];
 
        // add 28 bits to bypass the last iteration slow issue
        byte [] in2 = new byte[1008 + 28];
 
        int [] out = new int[1152];
 
        int [] out1 = new int[1152];
        int [] out2 = new int[1152];
 
 
        for(int i = 0 ; i < in.length ;i++) {
            in[i] = (byte)i;
        }
        for(int i = 0 ; i < in.length ;i++) {
            in2[i] = (byte)i;
        }
 
        // preload start ========
        for (int i = 0; i < WITERS; i++) {
            vector_packing1(in, out);
        }
        for (int i = 0; i < WITERS; i++) {
            vector_packing2(in2, out);
        }
        // preload end ========
 
 
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < ITERS; i++) {
            vector_packing1(in, out1);
        }
        long t2 = System.currentTimeMillis();
        long vector1_spent_time = t2 - t1;
 
 
        long t3 = System.currentTimeMillis();
        for (int i = 0; i < ITERS; i++) {
            vector_packing2(in2, out2);
        }
        long t4 = System.currentTimeMillis();
        long vector2_spent_time = t4 - t3;
 
        System.out.println(String.format("test1 result: vector1_spent_time=%s, vector2_spent_time=%s", vector1_spent_time, vector2_spent_time));
 
        for(int i = 0 ; i < out1.length; i++) {
            if((out1[i] != out2[i]))
                System.out.println("test1 ====not equal out["+i+"] = "+out[i]+" "+out1[i]);
        }
    }
 
    private static void test2() throws Exception {
        // 1008 is a multiple of 28
        byte [] in = new byte[1008];
 
        // add 28 bits to bypass the last iteration slow issue
        byte [] in2 = new byte[1008 + 28];
 
        int [] out = new int[1152];
 
        int [] out1 = new int[1152];
        int [] out2 = new int[1152];
        int [] out3 = new int[1152];
 
 
        for(int i = 0 ; i < in.length ;i++) {
            in[i] = (byte)i;
        }
        for(int i = 0 ; i < in.length ;i++) {
            in2[i] = (byte)i;
        }
 
        // preload start ========
        for (int i = 0; i < WITERS; i++) {
            vector_packing1(in, out);
        }
        for (int i = 0; i < WITERS; i++) {
            vector_packing2(in2, out);
        }
        for (int i = 0; i < WITERS; i++) {
            vector_packing3(in, out);
        }
        // preload end ========
 
 
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < ITERS; i++) {
            vector_packing1(in, out1);
        }
        long t2 = System.currentTimeMillis();
        long vector1_spent_time = t2 - t1;
 
 
        long t3 = System.currentTimeMillis();
        for (int i = 0; i < ITERS; i++) {
            vector_packing2(in2, out2);
        }
        long t4 = System.currentTimeMillis();
        long vector2_spent_time = t4 - t3;
 
        long t5 = System.currentTimeMillis();
        for (int i = 0; i < ITERS; i++) {
            vector_packing3(in, out3);
        }
        long t6 = System.currentTimeMillis();
        long vector3_spent_time = t6 - t5;
 
        System.out.println(String.format("test2 result: vector1_spent_time=%s, vector2_spent_time=%s, vector3_spent_time=%s",
                vector1_spent_time, vector2_spent_time, vector3_spent_time));
 
        for(int i = 0 ; i < out1.length; i++) {
            if((out1[i] != out2[i]) || (out1[i] != out3[i]))
                System.out.println("====not equal out["+i+"] = "+out[i]+" "+out1[i]);
        }
    }
}
