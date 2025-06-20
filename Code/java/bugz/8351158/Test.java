import java.util.Random;

public class Test {
    public static int field = -1;

    static final int GOLD = test();


    // Value Range pruning.
    //  -  Integral value range is delimited by [lo, hi)
    //  -  By looking at the value ranges of Mask we can prune the value range of compress / expand result.
    //  if [ Mask.lo >= 0 ], MSB bit of result will alwyas be zero, hence we discover a known zero bit. 
    //  if [ bitcount(Mask.con) < 32 ] res_expand = +ve value 
    //  if [ mask.hi < -1 ] in this case some bits will be sets to zero as for -1 all bits are set. Thus final expansion result will still be +ve value i.e.    //     MSB is always zero which is why we reduce 1 from max_bw of the results

    //  Compression always squeezes the source bits corresponding to the set mask bits. 
    //  Thus under no-situation compression can result into a value greater than the original source
    //  For mask value of -1, we return the original source value.


    // Current Case
    //  constant input = 0x8000_0000
    //           mask  = [0x7fff_ffff , 0x8000_0000] 
    //  res.hi =  0x8000_0000
    //  res.lo =  0x8000_0000
    
    // Other cases.
    //  constant input = 0xF
    //          mask = [0x7fff_ffff, 0xF]
    //  res.hi = 0xf
    //  res.lo = 0xf

    // Other cases.
    // constant input = -4
    //          mask = [0x7fff_ffff, 0xF]
    // res.hi = -4
    // res.lo = 0xF
    // 
    // This may lead to illegal value range.

    public static int test() {
        // There is no overlap in the bits of the two values, so the return value should be zero.
        // But somehow, C2 creates code that produces 0x8000_0000.
	// In fact, it seems to be constant folded in CompressBitsNode::Value which calls
        // bitshuffle_value. We end up here:
        //
        //  if ( opc == Op_CompressBits) {
        //    lo = mask_max_bw == max_bw ? lo : 0L;
        //    // Compress operation is inherently an unsigned operation and
        //    // result value range is primarily dependent on true count
        //    // of participating mask value.
        //    hi = mask_max_bw < max_bw ? (1L << mask_max_bw) - 1 : src_type->hi_as_long();
        //
        // We have mask_max_bw = max_bw = 32.
        // And src_type = int:min = 0x8000_0000.
        //
        // I'm not sure what assumption the code made here, but maybe that the src_type
        // spans into the positive range?

        // 
        int t = field & 0xF;
        return Integer.compress(15, t);
        //return Integer.compress(0x10, field & 0xFFFF_FFF0);
    }

    public static void main(String[] args) {
        for (int i = 0; i < 10_000; i++) {
            test();
        }

        int res = test();
        if (res != GOLD) {
            throw new RuntimeException("Bad value: " + res + " " + GOLD);
        }
    }
}
