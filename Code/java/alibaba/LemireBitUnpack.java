
import jdk.incubator.vector.*;

class LemireBitUnpack { 

  public static void unpack8Values(final byte[] in, final int inPos, final int[] out, final int outPos) {
        out[ 0 + outPos] =
                //            [______10]
                //                  [10]
                ((((int)in[ 0 + inPos]) ) & 3);
        out[ 1 + outPos] =
                //            [____32__]
                //                [10]
                ((((int)in[ 0 + inPos]) >>  2) & 3);
        out[ 2 + outPos] =
                //            [__54____]
                //              [10]
                ((((int)in[ 0 + inPos]) >>  4) & 3);
        out[ 3 + outPos] =
                //            [76______]
                //            [10]
                ((((int)in[ 0 + inPos]) >>  6) & 3);
        out[ 4 + outPos] =
                //            [______10]
                //                  [10]
                ((((int)in[ 1 + inPos]) ) & 3);
        out[ 5 + outPos] =
                //            [____32__]
                //                [10]
                ((((int)in[ 1 + inPos]) >>  2) & 3);
        out[ 6 + outPos] =
                //            [__54____]
                //              [10]
                ((((int)in[ 1 + inPos]) >>  4) & 3);
        out[ 7 + outPos] =
                //            [76______]
                //            [10]
                ((((int)in[ 1 + inPos]) >>  6) & 3);

    }

    public static VectorShuffle<Byte> perm_mask;
    public static Vector<Byte> mask;
    public static int [] perm_index;

    // Expression : ((((int)in[ 0 + inPos]) >>  2) & 3);
    // Dissection:
    // a. in[0 + inPos] -> byte type
    // b. (int)in[0 + inPos] -> sign-extend byte to integer.
    // c. logical shift right by 2.
    // d. logical AND by 3.

    // -4       =  11111100 = 0xFC
    // (int)-4  =             0xFFFFFFFC
    // Logical shift right by 0, 2, 4, 6 will never be accessing bit position 8-31. Operator '>>' expects int operands.
    // Logical AND by 3. 

    // out[0]{31:0} = in[0]{1:0}
    // out[1]{31:0} = in[0]{3:2}
    // out[2]{31:0} = in[0]{5:4}
    // out[3]{31:0} = in[0]{7:6}
    // out[4]{31:0} = in[1]{1:0}
    // out[5]{31:0} = in[1]{3:2}
    // out[6]{31:0} = in[1]{5:4}
    // out[7]{31:0} = in[1]{7:6}

    // Vectorized algorithm is working on following logic:-
    // 2 bytes feeds 8 ints. 
    // 8 bytes feeds 8 x 4 = 32 ints (512 bit vector size cap)
    // So 8 bytes can feed 32 shorts (512 bits).
    // Then unpack 32 shots in two packed 16 integers (2x512 bits)

    public static final VectorSpecies<Byte> BSPECIES = ByteVector.SPECIES_64;
    public static final VectorSpecies<Short> SSPECIES = ShortVector.SPECIES_512;
    public static final VectorSpecies<Integer> ISPECIES = IntVector.SPECIES_512;
    public static final VectorSpecies<Long> LSPECIES = LongVector.SPECIES_512;

    public static final int ITERS = 100000;

    public static void unpack8Values_vec(final byte[] in, final int inPos, final int[] out, final int outPos) {
        ByteVector byteVector = ByteVector.fromArray(BSPECIES, in, inPos);
        ShortVector tempRes = byteVector.castShape(LSPECIES, 0)
                             .reinterpretAsBytes()
                             .rearrange(perm_mask)
                             .reinterpretAsShorts()
                             .lanewise(VectorOperators.LSHR,
                                       LSPECIES.broadcast(0x0006000400020000L)
                                       .reinterpretAsShorts())
                             .lanewise(VectorOperators.AND, 3);
        tempRes.castShape(ISPECIES, 0).reinterpretAsInts().intoArray(out, outPos);
        tempRes.castShape(ISPECIES, 1).reinterpretAsInts().intoArray(out, outPos+16);
    }

    public static int scalar_packing(byte [] in , int [] out, int ctr) {
       for(int i = 0 ; i < in.length-2 ; i+=2) {
          unpack8Values(in, i, out, i*4); 
       }
       return out[ctr];
    }
    
    public static int vector_packing(byte [] in , int [] out, int ctr) {
       for(int i = 0 ; i < BSPECIES.loopBound(in.length) ; i+=BSPECIES.length()) {
          unpack8Values_vec(in, i, out, i*4); 
       }
       return out[ctr];
    }

    public static void main(String [] args) {
        int res = 0;
        byte [] in = new byte[1024];
        int [] out = new int[4096];
        for(int i = 0 ; i < in.length ;i++) {
           in[i] = (byte)i;
        }
        perm_index = new int[64];
        for(int i = 0; i < perm_index.length; i += 8) {
           perm_index[i] = i;
           perm_index[i+1] = 63;
           perm_index[i+2] = i;
           perm_index[i+3] = 63;
           perm_index[i+4] = i;
           perm_index[i+5] = 63;
           perm_index[i+6] = i;
           perm_index[i+7] = 63;
        }

        perm_mask = VectorShuffle.fromArray(ByteVector.SPECIES_512, perm_index, 0); 
        mask = LSPECIES.broadcast(0x000000FF000000FFL).reinterpretAsBytes();
        
        for(int i = 0; i < ITERS; i++) {
          res += scalar_packing(in, out, i & 1023); 
        } 
        res = 0;
        long t1 = System.currentTimeMillis();
        for(int i = 0; i < ITERS; i++) {
          res += scalar_packing(in, out, i & 1023); 
        } 
        long t2 = System.currentTimeMillis();
        System.out.println("[Res] " + res + " [Scalar Time] " + (t2-t1) + " ms");
       
        for(int i = 0; i < ITERS; i++) {
          res += vector_packing(in, out, i & 1023); 
        } 
        res = 0;
        t1 = System.currentTimeMillis();
        for(int i = 0; i < ITERS; i++) {
          res += vector_packing(in, out, i & 1023); 
        } 
        t2 = System.currentTimeMillis();
        System.out.println("[Res] " + res + " [Vector Time] " + (t2-t1) + " ms");
    }
}
