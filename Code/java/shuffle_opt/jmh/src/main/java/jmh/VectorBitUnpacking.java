/*
 * Copyright (C) 2023, Intel Corporation. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in
 *     the documentation and/or other materials provided with the
 *     distribution.
 *   * Neither the name of Intel Corporation nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

package bytebit.packing;

import java.util.Random;
import jdk.incubator.vector.*;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

@OutputTimeUnit(TimeUnit.MILLISECONDS)
@State(Scope.Thread)
@Fork(jvmArgsPrepend = {"--add-modules=jdk.incubator.vector"})
public class VectorBitUnpacking {
    /*---------------------------------*/
    /* Packing related tables.       */
    /*---------------------------------*/
    static int [] rshift_table0_pack = { 0, 2, 1, 0, 2, 1 };
  
    static int [] lshift_table1_pack = { 3, 1, 2, 3, 1, 2 };
    static int [] lshift_table2_pack = { 6, 4, 5, 6, 4, 5 };
    static int [] lshift_table3_pack = { 0, 7, 0, 0, 7, 0 };
  
    static int [] and_mask_table0_pack = { 7, 1, 3, 7, 1, 3};
    static int [] and_mask_table1_pack = { 56, 14, 28, 56, 14, 28};
    static int [] and_mask_table2_pack = { 192, 112, 224, 192, 112, 224};
    static int [] and_mask_table3_pack = { 0, 128, 0, 0, 128, 0};
  
    static final VectorSpecies<Integer> I512 = IntVector.SPECIES_512;
    static final VectorSpecies<Byte> B64 = ByteVector.SPECIES_64;
  
    static final VectorMask<Integer> or_mask_pack = VectorMask.fromLong(I512, 18);
    static final VectorMask<Integer> in_mask_pack = VectorMask.fromLong(I512, 63);
    static final VectorMask<Byte> out_mask_pack = VectorMask.fromLong(B64, 63);
  
    static final Vector<Integer> and_mask_vec0_pack = IntVector.fromArray(I512, and_mask_table0_pack, 0, in_mask_pack);
    static final Vector<Integer> and_mask_vec1_pack = IntVector.fromArray(I512, and_mask_table1_pack, 0, in_mask_pack);
    static final Vector<Integer> and_mask_vec2_pack = IntVector.fromArray(I512, and_mask_table2_pack, 0, in_mask_pack);
    static final Vector<Integer> and_mask_vec3_pack = IntVector.fromArray(I512, and_mask_table3_pack, 0, in_mask_pack);
  
    static final Vector<Integer> rshift_vec0_pack = IntVector.fromArray(I512, rshift_table0_pack, 0, in_mask_pack);
  
    static final Vector<Integer> lshift_vec1_pack = IntVector.fromArray(I512, lshift_table1_pack, 0, in_mask_pack);
    static final Vector<Integer> lshift_vec2_pack = IntVector.fromArray(I512, lshift_table2_pack, 0, in_mask_pack);
    static final Vector<Integer> lshift_vec3_pack = IntVector.fromArray(I512, lshift_table3_pack, 0, in_mask_pack);
  
    /*---------------------------------*/
    /* Unpacking related tables.       */
    /*---------------------------------*/
  
    // Permutation tables.
    static int [] perm_table0_unpack = {
        0,63,0,63,0,63,2,63,
        2,63,2,63,4,63,4,63,
        6,63,6,63,6,63,8,63,
        8,63,8,63,10,63,10,63,
        12,63,12,63,12,63,14,63,
        14,63,14,63,16,63,16,63,
        18,63,18,63,18,63,20,63,
        20,63,20,63,22,63,22,63,
    };
    static int [] perm_table1_unpack = {
        0,63,0,63,2,63,0,63,
        0,63,4,63,0,63,0,63,
        0,63,0,63,8,63,0,63,
        0,63,10,63,0,63,0,63,
        0,63,0,63,14,63,0,63,
        0,63,16,63,0,63,0,63,
        0,63,0,63,20,63,0,63,
        0,63,22,63,0,63,0,63,
    };
    // Left shift tables.
    static short [] lshift_table1_unpack = {
        0,0,2,0,0,1,0,0,
        0,0,2,0,0,1,0,0,
        0,0,2,0,0,1,0,0,
        0,0,2,0,0,1,0,0,
    };
    // Right shift tables.
    static short [] rshift_table0_unpack = {
        0,3,6,1,4,7,2,5,
        0,3,6,1,4,7,2,5,
        0,3,6,1,4,7,2,5,
        0,3,6,1,4,7,2,5,
    };
    // AndMask tables.
    static short [] and_mask_table0_unpack = {
        7,7,3,7,7,1,7,7,
        7,7,3,7,7,1,7,7,
        7,7,3,7,7,1,7,7,
        7,7,3,7,7,1,7,7,
    };
    static short [] and_mask_table1_unpack = {
        0,0,7,0,0,7,0,0,
        0,0,7,0,0,7,0,0,
        0,0,7,0,0,7,0,0,
        0,0,7,0,0,7,0,0,
    };

    @Param({"1024", "2048", "4096"})
    static int size;
    static byte [] bytes; 
    static int  [] ints; 
  
    // Global Initializing declerations.
    static final VectorSpecies<Byte> B128 = ByteVector.SPECIES_128;
    static final VectorSpecies<Short> S512 = ShortVector.SPECIES_512;
    static final VectorSpecies<Byte> B512 = ByteVector.SPECIES_512;
    static final VectorMask<Byte> input_mask_unpack = VectorMask.fromLong(B128, 4095L);
  
    static final VectorMask<Short> or_mask_unpack = VectorMask.fromLong(S512, 606348324L);
  
    static final VectorShuffle<Byte> perm_mask0_unpack = VectorShuffle.fromArray(B512, perm_table0_unpack, 0);
    static final VectorShuffle<Byte> perm_mask1_unpack = VectorShuffle.fromArray(B512, perm_table1_unpack, 0);
  
    static final Vector<Short> and_vec0_unpack = ShortVector.fromArray(S512, and_mask_table0_unpack, 0);
    static final Vector<Short> and_vec1_unpack = ShortVector.fromArray(S512, and_mask_table1_unpack, 0);
  
    static final Vector<Short> lshift_cnt1_unpack = ShortVector.fromArray(S512, lshift_table1_unpack, 0);
  
    static final Vector<Short> rshift_cnt0_unpack = ShortVector.fromArray(S512, rshift_table0_unpack, 0);
  
    @Setup(Level.Invocation)
    public void bm_setup() {
        bytes  = new byte[size*3];
        for(int i = 0; i < bytes.length; i++) {
            bytes[i] = (byte)(i & 127);
        } 
        ints = new int[size*8];  
    }
  
    public static void scalar_unpack8Values(final byte[] in, final int inPos, final int[] out, final int outPos) {
      out[ 0 + outPos] =
          //             [_____210]
          //                  [210]
            ((((int)in[ 0 + inPos]) ) & 7);
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
  
    public static void vector_unpack8Values_vec(final byte[] in, final int inPos, final int[] out, final int outPos) {
       ByteVector byteVector = ByteVector.fromArray(B128, in, inPos, input_mask_unpack)
                                         .castShape(S512, 0)
                                         .reinterpretAsBytes();
  
       ShortVector tempRes0 = byteVector.rearrange(perm_mask0_unpack)
                 .reinterpretAsShorts()
                 .lanewise(VectorOperators.ASHR, rshift_cnt0_unpack)
                 .lanewise(VectorOperators.AND, and_vec0_unpack);
  
       ShortVector tempRes1 = byteVector.rearrange(perm_mask1_unpack)
                 .reinterpretAsShorts()
                 .lanewise(VectorOperators.LSHL, lshift_cnt1_unpack)
                 .lanewise(VectorOperators.AND, and_vec1_unpack);
  
       tempRes0  = tempRes0.lanewise(VectorOperators.OR, tempRes1, or_mask_unpack);
       tempRes0.castShape(I512, 0).reinterpretAsInts().intoArray(out, outPos);
       tempRes0.castShape(I512, 1).reinterpretAsInts().intoArray(out, outPos+16);
    }
  
   
    @Benchmark
    public void scalar_unpacking() {
        for(int i = 0, j = 0; i < bytes.length-3; i+=3, j+=8) {
            scalar_unpack8Values(bytes, i, ints, j);
        }
    }
  
    @Benchmark
    public void vector_unpacking() {
        int i = 0, j = 0;
        for(; i < bytes.length-12; i+=12, j+=32) {
            vector_unpack8Values_vec(bytes, i, ints, j);
        }
        for(; i < bytes.length-3; i+=3, j+=8) {
            scalar_unpack8Values(bytes, i, ints, j);
        }
    }
}
