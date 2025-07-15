class KnownBits {
    public long ZEROS;
    public long ONES;

    public KnownBits() {
        ZEROS = 0;
        ONES = 0;
    }

    public KnownBits(long con) {
        ZEROS = ~con & -1L;
        ONES =   con & -1L;
    }

    public void setZeroBit(int pos) {
        assert pos >= 0 && pos < 64;
        ZEROS |= (1L << pos);
    }

    public void setOneBit(int pos) {
        assert pos >= 0 && pos < 64;
        ONES |= (1L << pos);
    }

    public long getZeroBit(int pos) {
        assert pos >= 0 && pos < 64;
        return (ZEROS >> pos) & 0x1;
    }

    public long getOneBit(int pos) {
        assert pos >= 0 && pos < 64;
        return (ONES >> pos) & 0x1;
    }

    public long getMaxValue() {
        return ~ZEROS;    
    }
    public long getMinValue() {
        return ONES;
    } 

    public boolean conflicting() {
        return (ZEROS & ONES) != 0;
    }
    public boolean isConstant() {
        assert conflicting() == false;
        return (ZEROS | ONES) == -1L
    }
    public String toString() {
        System.out.println(" [KnownBits] ZEROS = "w + Long.toHexString(ZEROS) + " ONES = " + Long.toHexString(ONES));
    }

    public long getConstant() {
        assert isConstant();
        return ~ZEROS | ONES
    }

    public void sync(long con) {
        ONES = con & -1L;
        ZEROS = ~con & -1L;
    }
}


public class bit_compress_expand_KnownBits {
    // For a known source we can access lower order bits. But, unless mask
    // is constant, we cannot determine the exact number of source bits which
    // are read starting from the least significant bit position.
    // If both mask and source are constant values then expression is constant
    // folded.
    // There are still some hairline which can be put in place.
    //  - Result is always a non-negative value if Mask.MSB is known Zero.
    //  - If mask has a contiguous sequence of known bits starting from least
    //    significant bit, then we can compute known bits of result.  
    //    Q. Why is contiguity in knownbits a constraint ?
    //    A. Because, we sequentially read the lower order source bits and place
    //       them at result bit position corresponding to set mask bit positions.
    //       Thus, existence of a hole b/w known mask bits will disturb the placement
    //       of subsequent source bits after sequence of known mask bits.
    //   
    public KnownBits expand(KnownBits src, KnownBits mask) {
        assert src.conflicting() == false;
        assert mask.conflicting() == false;

        KnownBits res = new KnownBits();

        if (mask.isConstant() && src.isConstant()) {
            // Case 1: Both mask and source are known at compile time. 
            return res.sync(Long.expand(src.getConstant(), mask.getConstant()));
        } else if (mask.isConstant()) {
            // Case 2: unknown source, but known mask at compile time.
            long mask_value = mask.getConstant();
            for (int i = 0, j = 0; i < 64; i++) {
                if (((mask_value >>> i) & 1) == 1) {
                    res.ZEROS |= (src.ZEROS & (1 << j)) << i;
                    res.ONES  |= (src.ONES & (1 << j)) << i;
                    j++;
                }
            }
        } else if (src.isConstant()) {
            // Case 3: unknown mask, but known source at compile time.
            if (mask.getZeroBit(63) == 1) {
                res.setZeroBit(63); 
            }
            long unified_mask_sequence = mask.ZEROS | mask.ONES; 
            for (int i = 0, j = 0; i < 64; i++) {
                if (((unified_mask_sequence >>> i) & 1) == 1) {
                    long src_bit = ((src >>> j++) & 1L) << i;
                    if (mask.getOneBit(i) == 1) {
                        res.ONES |= src_bit; 
                    } else {
                        res.ZEROS |= src_bit; 
                    }
                } else {
                    break;
                }
            }
        } else {
            // Case 4: both mask and source are unknown at compile time,
            // we can still perform some hairline tunings on result knownbits.
            if (mask.getZeroBit(63) == 1) {
                res.setZeroBit(63);
            }

            // For consecutive sequence of least significant known source
            // and mask bits we can determine the knownbits of the result.
            // Placing the consecutive sequence of source knownbits starting
            // from least significant source bit position, at bit positions
            // corresponding to set mask bits
            long unified_mask_sequence = mask.ZEROS | mask.ONES;
            long unified_source_sequence = src.ZEROS | src.ONES;
            for (int i = 0, j = 0; i < 64; i++) {
                // Since it's a bit expansion, hence contiguity of known
                // mask bits supersedes the contiguity of known source
                // bits e.g. 10 continuous least significant known mask bits
                // may only have two set bits, thus all we need is two
                // consecutive least significant known source bits.
                if (((unified_mask_sequence >>> i) & 0x1) == 1) { 
                    (((unified_source_sequence >>> j) & 0x1) == 1) {
                    if (mask.getOneBit(i) == 1) {
                       if (src.getOneBit(j++)) {
                           res.setOneBit(i);
                       } else {
                           res.setZeroBit(i);
                       } 
                    } 
                } else {
                    break;
                } 
            }
        }
        return res;
    }

    public KnownBits compress(KnownBits src, KnownBits mask) {
        assert src.conflicting() == false;
        assert mask.conflicting() == false;

        KnownBits res = new KnownBits();

        if (mask.isConstant() && src.isConstant()) {
            // Case 1: mask and source are both known at compile time. 
            return res.sync(Long.compress(src.getConstant(), mask.getConstant()));
        } else if (mask.isConstant()) {
            // Case 2: unknown source, but mask is known at compile time.
            long mask_value = mask.getConstant();
            for (int i = 0, j = 0; i < 64; i++) {
                // for constant mask all the known zero/one source bits
                // corresponding to set mask bits can be extracted and
                // placed at least significant bit positions corresponding
                // to count of the set bit e.g.
                // mask = 1 0 0 0 1 0 0 1
                // Here 0th, 3rd and 7th bit of mask are set, source
                // bits corresponding to these three bits can be laid out at
                // least significant 3 bits of result, where 0th bit of result
                // is picked up from 0th bit of source, 1st bit of result is
                // picked from 3rd bit of the source and 2nd bit of the result
                // is picked from the 7th bit of the source, in absence of constant
                // source we can still try to set the value of first three result
                // bits by consulting knownbits of the source.
                if (((mask_value >>> i) & 0x1) == 1) {
                    if (((src.ZEROS >> i) & 0x1) == 1) {
                        res.setZeroBit(j);
                    } else if (((src.ONES >> i ) & 0x1) == 1) {
                        res.setOneBit(j);
                    }
                    j++;
                }
            }
        } else if (src.isConstant()) {
            // Case 3: unknown mask, but source is known at compile time.
            // Here, we have compile time precise information about
            // the source bits, but an imprecise information about 
            // the mask bit, in order to compute the result, we need
            // exact count of set mask bits, this is because result 
            // is based on the popcount of mask bits.
            // We can only estimate the result knownbits from contiguous
            // least significant knowbits of mask, till we hit first unknown
            // mask.KnownBits.ONES
            long unified_mask_sequence = mask.ZEROS | mask.ONES;
            for (int i = 0, j = 0; i < 64; i++) {
                if (((unified_mask_sequence >>> i) & 0x1) == 1) {
                    long src_bit = ((src >>> i) & 0x1) << j;
                    if (src_bit == 0) {
                        res.ZEROS |= src_bit; 
                    } else {
                        res.ONES |= src_bit; 
                    }
                } else {
                    break;
                }
            }
        } else {
            // Case 4: both mask and src are unknown at compile time,
            // we can still perform some hairline tunings of result knownbits.
            if (mask.getZeroBit(63) == 1) {
                res.setZeroBit(63);
            }

            // Again for consecutive sequence of least significant known source
            // and mask bits we can determine the knownbits of the result.
            long unified_mask_sequence = mask.ZEROS | mask.ONES;
            long unified_source_sequence = src.ZEROS | src.ONES;
            for (int i = 0, j = 0; i < 64; i++) {
                if ((((unified_mask_sequence >>> i) & 0x1) == 1) && 
                    (((unified_source_sequence >>> i) & 0x1) == 1) {
                    if (mask.getOneBit(i) == 1) {
                       if (src.getOneBit(i)) {
                           res.setOneBit(j++);
                       } else {
                           res.setZeroBit(j++);
                       } 
                    } 
                } else {
                    break;
                } 
            }
        }
        return res;
    }
}
