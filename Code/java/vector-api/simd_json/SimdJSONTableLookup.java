

import jdk.incubator.vector.*;

//
//           4bit index
//  Table1 : 16 entry. {index:error_flag} => {0=ERROR_BIT1,  1=ERROR_BIT2, ...15=ERROR_BIT16] // hop by 1
//  Table2 : 16 entry. {index:error_flag} => {0=ERROR_BIT1,  2=ERROR_BIT3, ...14=ERROR_BIT15] // hop by 2
//  Table3 : 16 entry. {index:error_flag} => {0=ERROR_BIT1,  3=ERROR_BIT4, ...15=ERROR_BIT16] // hop by 3
//
//  Total key size bits = 12, byte1=8 byte2=4(upper)

public class SimdJSONTableLookup {

    // Leading byte not followed by a continuation byte but by another leading or ASCII byte, e.g. 11______ 0_______, 11______ 11______
    private static final byte TOO_SHORT = 1;
    // ASCII followed by continuation byte e.g. 01111111 10_000000.
    private static final byte TOO_LONG = 1 << 1;
    // Any 3-byte sequence that could be represented by a shorter sequence (any sequence smaller than 1110_0000 10_100000 10_000000).
    private static final byte OVERLONG_3BYTE = 1 << 2;
    // Any decoded code point greater than U+10FFFF. e.g. 11110_100 10_010000 10_000000 10_000000.
    private static final byte TOO_LARGE = 1 << 3;
    // Code points in the range of U+D800 - U+DFFF (inclusive) are the surrogates for UTF-16.
    // These 2048 code points that are reserved for UTF-16 are disallowed in UTF-8, e.g. 1110_1101 10_100000 10_000000.
    private static final byte SURROGATE = 1 << 4;
    // First valid 2-byte sequence: 110_00010 10_000000. Anything smaller is considered overlong as it fits into a 1-byte sequence.
    private static final byte OVERLONG_2BYTE = 1 << 5;
    // Similar to TOO_LARGE, but for cases where the continuation byte's high nibble is 1000, e.g. 11110_101 10_000000 10_000000.
    private static final byte TOO_LARGE_1000 = 1 << 6;
    // Any decoded code point below above U+FFFF, e.g. 11110_000 10_000000 10_000000 10_000000.
    private static final byte OVERLONG_4BYTE = 1 << 6;
    // An example: 10_000000 10_000000.
    private static final byte TWO_CONTINUATIONS = (byte) (1 << 7);
    private static final byte MAX_2_LEADING_BYTE = (byte) 0b110_11111;
    private static final byte MAX_3_LEADING_BYTE = (byte) 0b1110_1111;
    private static final byte CARRY = TOO_SHORT | TOO_LONG | TWO_CONTINUATIONS;

    public static byte[] byte1HighArray = new byte[]{
            // ASCII high nibble = 0000 -> 0111, ie 0 -> 7 index in lookup table
            TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG,
            // Continuation high nibble = 1000 -> 1011
            TWO_CONTINUATIONS, TWO_CONTINUATIONS, TWO_CONTINUATIONS, TWO_CONTINUATIONS,
            // Two byte lead high nibble = 1100 -> 1101
            TOO_SHORT | OVERLONG_2BYTE, TOO_SHORT,
            // Three byte lead high nibble = 1110
            TOO_SHORT | OVERLONG_3BYTE | SURROGATE,
            // Four byte lead high nibble = 1111
            TOO_SHORT | TOO_LARGE | TOO_LARGE_1000 | OVERLONG_4BYTE
    };

    public static byte[] byte1LowArray = new byte[]{
            // ASCII, two byte lead and three byte leading low nibble = 0000 -> 1111,
            // Four byte lead low nibble = 0000 -> 0111.
            // Continuation byte low nibble is inconsequential
            // Low nibble does not affect the states TOO_SHORT, TOO_LONG, TWO_CONTINUATIONS, so they will
            // be carried over regardless.
            CARRY | OVERLONG_2BYTE | OVERLONG_3BYTE | OVERLONG_4BYTE,
            // 0001
            CARRY | OVERLONG_2BYTE,
            CARRY,
            CARRY,
            // 1111_0100 -> 1111 = TOO_LARGE range
            CARRY | TOO_LARGE,
            CARRY | TOO_LARGE | TOO_LARGE_1000,
            CARRY | TOO_LARGE | TOO_LARGE_1000,
            CARRY | TOO_LARGE | TOO_LARGE_1000,
            CARRY | TOO_LARGE | TOO_LARGE_1000,
            CARRY | TOO_LARGE | TOO_LARGE_1000,
            CARRY | TOO_LARGE | TOO_LARGE_1000,
            CARRY | TOO_LARGE | TOO_LARGE_1000,
            CARRY | TOO_LARGE | TOO_LARGE_1000,
            // 1110_1101
            CARRY | TOO_LARGE | TOO_LARGE_1000 | SURROGATE,
            CARRY | TOO_LARGE | TOO_LARGE_1000,
            CARRY | TOO_LARGE | TOO_LARGE_1000
    };

    public static byte[] byte2HighArray = new byte[] {
            // ASCII high nibble = 0000 -> 0111, ie 0 -> 7 index in lookup table
            TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT,
            // Continuation high nibble - 1000 -> 1011
            TOO_LONG | TWO_CONTINUATIONS | OVERLONG_2BYTE | OVERLONG_3BYTE | OVERLONG_4BYTE | TOO_LARGE_1000,
            TOO_LONG | TWO_CONTINUATIONS | OVERLONG_2BYTE | OVERLONG_3BYTE | TOO_LARGE,
            TOO_LONG | TWO_CONTINUATIONS | OVERLONG_2BYTE | SURROGATE | TOO_LARGE,
            TOO_LONG | TWO_CONTINUATIONS | OVERLONG_2BYTE | SURROGATE | TOO_LARGE,
            // 1100 -> 1111 = unexpected leading byte
            TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT
    };

    // 6 bit index, 64 entries
    public static byte [] byte1HighArrayNew = {
        // 0b0000_00  - 0b0111_11 -> ASCII -> continuation byte
        TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG,
        TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG,
        TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG,
        TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG, TOO_LONG,
        // 0b1000_00 - 0b1011_11 -> TWO_CONTINUATIONS
        TWO_CONTINUATIONS, TWO_CONTINUATIONS, TWO_CONTINUATIONS, TWO_CONTINUATIONS,
        TWO_CONTINUATIONS, TWO_CONTINUATIONS, TWO_CONTINUATIONS, TWO_CONTINUATIONS,
        TWO_CONTINUATIONS, TWO_CONTINUATIONS, TWO_CONTINUATIONS, TWO_CONTINUATIONS,
        TWO_CONTINUATIONS, TWO_CONTINUATIONS, TWO_CONTINUATIONS, TWO_CONTINUATIONS,
        // 0b1100_00 -> OVERLONG_2BYTE | TOO_SHORT
        OVERLONG_2BYTE | TOO_SHORT,
        // 0b1100_01 -> TOO_SHORT, cannot be OVERLONG_2BYTE since 3rd bit is 1 and 100 > 010 
        // 010 is least signifiant 3 bits of lower nibble of two byte UTF8 encoding.
        TOO_SHORT,
        // 0b1100_10 - 0b1100_11 -> TOO_SHORT
        TOO_SHORT,
        // 3 byte sequence, 0b1110_00 -> TOO_SHORT | OVERLONG_3BYTE sequence smalle than U+8000
        TOO_SHORT | OVERLONG_3BYTE,
        // 0b1110_01 -> TOO_SHORT
        TOO_SHORT,
        // 0b1110_11 -> TOO_SHORT | SURROGATE
        TOO_SHORT | SURROGATE,
        // 4 byte sequence, 0b11110_0
        OVERLONG_4BYTE | TOO_LARGE | TOO_SHORT | TOO_LARGE_1000
        // 4 byte sequence, 0b11110_1
        TOO_SHORT | TOO_LARGE, 
        // 11111_0 - 11111_1
        TOO_LARGE_1000
    } 

    // 2bit byte1lo | 4bits byte2hi
    public static byte [] byte1Lo2HighArrayNew = {
        // 0b0000_00  - 0b00_1111 -> leading byte -> ASCII -> TOO_SHORT
        TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT,
        TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT,
        // 0b01_0000 - 0b01_0111 -> leading  byte -> ASCII -> TOO_SHORT
        TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT,
        // 0b01_1000 - 0b01_1011 -> ASCII -> continuation byte -> TOO_LONG
        TOO_LONG | TWO_CONTINUATIONS | OVERLONG_2BYTE | OVERLONG_3BYTE | OVERLONG_4BYTE | TOO_LARGE_1000,
        TOO_LONG | TWO_CONTINUATIONS | OVERLONG_2BYTE | OVERLONG_3BYTE | TOO_LARGE,
        TOO_LONG | TWO_CONTINUATIONS | OVERLONG_2BYTE | SURROGATE | TOO_LARGE,
        TOO_LONG | TWO_CONTINUATIONS | OVERLONG_2BYTE | SURROGATE | TOO_LARGE,
        // 0b01_1100 - 0b01_1111 -> leading byte -> non-continuation byte -> TOO_SHORT
        TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT
        // 0b10_0000 - 0b10_0111 -> leading byte -> ASCII -> TOO_SHORT 
        TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT,
        // 0b10_1000 - 0b10_1011 
        TOO_LONG | TWO_CONTINUATIONS | OVERLONG_2BYTE | OVERLONG_3BYTE | OVERLONG_4BYTE | TOO_LARGE_1000,
        TOO_LONG | TWO_CONTINUATIONS | OVERLONG_2BYTE | OVERLONG_3BYTE | TOO_LARGE,
        TOO_LONG | TWO_CONTINUATIONS | OVERLONG_2BYTE | SURROGATE | TOO_LARGE,
        TOO_LONG | TWO_CONTINUATIONS | OVERLONG_2BYTE | SURROGATE | TOO_LARGE,
        // 0b10_1100 - 0b10_1111  leading byte -> non-continuation byte -> TOO_SHORT
        TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT,
        // 0b11_0000 - 0b11_0111  leading byte -> ASCII -> TOO_SHORT
        TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT,
        // 0b11_1000 - 0b11_1011  leading byte -> ASCII -> TOO_SHORT
        TOO_LONG | TWO_CONTINUATIONS | OVERLONG_2BYTE | OVERLONG_3BYTE | OVERLONG_4BYTE | TOO_LARGE_1000,
        TOO_LONG | TWO_CONTINUATIONS | OVERLONG_2BYTE | OVERLONG_3BYTE | TOO_LARGE,
        TOO_LONG | TWO_CONTINUATIONS | OVERLONG_2BYTE | SURROGATE | TOO_LARGE,
        TOO_LONG | TWO_CONTINUATIONS | OVERLONG_2BYTE | SURROGATE | TOO_LARGE,
        // 0b11_1100 - 0b11_1111  leading byte -> non continuation -> TOO_SHORT
        TOO_SHORT, TOO_SHORT, TOO_SHORT, TOO_SHORT
    }; 

    public static byte [] utf8_stream = {
            (byte)0b1100_0010, (byte)0b0000_0010, (byte)0b0100_0010, (byte)0b1100_0010, 
            (byte)0b1110_0010, (byte)0b0010_0010, (byte)0b0010_0010, (byte)0b0110_0010,
            (byte)0b1100_0010, (byte)0b0000_0010, (byte)0b0100_0010, (byte)0b1100_0010, 
            (byte)0b1100_0010, (byte)0b0000_0010, (byte)0b0100_0010, (byte)0b1100_0010, 
            (byte)0b1100_0010, (byte)0b0000_0010, (byte)0b0100_0010, (byte)0b1100_0010, 
            (byte)0b1100_0010, (byte)0b0000_0010, (byte)0b0100_0010, (byte)0b1100_0010, 
            (byte)0b1100_0010, (byte)0b0000_0010, (byte)0b0100_0010, (byte)0b1100_0010, 
            (byte)0b1100_0010, (byte)0b0000_0010, (byte)0b0100_0010, (byte)0b1100_0010, 
            (byte)0b1100_0010, (byte)0b0000_0010, (byte)0b0100_0010, (byte)0b1100_0010, 
            (byte)0b1110_0010, (byte)0b0010_0010, (byte)0b0010_0010, (byte)0b0110_0010,
            (byte)0b1100_0010, (byte)0b0000_0010, (byte)0b0100_0010, (byte)0b1100_0010, 
            (byte)0b1100_0010, (byte)0b0000_0010, (byte)0b0100_0010, (byte)0b1100_0010, 
            (byte)0b1100_0010, (byte)0b0000_0010, (byte)0b0100_0010, (byte)0b1100_0010, 
            (byte)0b1100_0010, (byte)0b0000_0010, (byte)0b0100_0010, (byte)0b1100_0010, 
            (byte)0b1100_0010, (byte)0b0000_0010, (byte)0b0100_0010, (byte)0b1100_0010, 
            (byte)0b1100_0010, (byte)0b0000_0010, (byte)0b0100_0010, (byte)0b1100_0010, 
    };

    public static final VectorSpecies<Byte> BSP = ByteVector.SPECIES_PREFERRED;

    public static final ByteVector tbl1 = loadTable(1);
    public static final ByteVector tbl2 = loadTable(2);
    public static final ByteVector tbl3 = loadTable(3);
 
    public static final ByteVector tbl4 = loadTable(4);
    public static final ByteVector tbl5 = loadTable(5);

    public static ByteVector loadTable(int table_number) {
        byte [] orig_table = switch(table_number) {
            case 1 -> byte1HighArray;
            case 2 -> byte1LowArray;
            case 3 -> byte2HighArray;
            case 4 -> byte1HighArrayNew;
            case 5 -> byte1Lo2HighArrayNew;
            default -> null;
        };

        byte [] table = new byte[BSP.length()];
        for (int i = 0; i < BSP.length() / orig_table.length; i++) {
            System.arraycopy(orig_table, 0, table, i * orig_table.length, orig_table.length);
        }
        return ByteVector.fromArray(BSP, table, 0);
    }
   
    public static long three_table_distributed_lookup() {
        long error = 0;
        ByteVector v0 = ByteVector.broadcast(BSP, 0);
        for (int i = 0; i < BSP.loopBound(utf8_stream.length); i += BSP.length()) {
            ByteVector v1 = ByteVector.fromArray(BSP, utf8_stream, i);
            ByteVector prev1V = v0.slice(BSP.length() - 1, v1);
            ByteVector prev1_msb_6b_ByteV = prev1V.reinterpretAsInts().lanewise(VectorOperators.LSHR, 2)
                                                  .lanewise(VectorOperators.AND, IntVector.broadcast(IntVector.SPECIES_256, 0x3F3F3F3F))
                                                  .reinterpretAsBytes();
            ByteVector perv1_lsb2_v1_msb_4bitV = prev1ByteV.lanewise(VectorOperators.LSHR, 4).selectFrom(tbl1); 
            ByteVector lookup_res2 = prev1ByteV.and((byte)0xF).selectFrom(tbl2); 
            ByteVector lookup_res3 = v1.lanewise(VectorOperators.LSHR, 4).selectFrom(tbl3); 
            VectorMask<Byte> res = lookup_res3.and(lookup_res2).and(lookup_res1).compare(VectorOperators.GT, (byte)0);
            v0 = v1;
            error += res.trueCount();
        }
        return error;
    }

    public static long two_table_distributed_lookup() {
        long error = 0;
        ByteVector v0 = ByteVector.broadcast(BSP, 0);
        for (int i = 0; i < BSP.loopBound(utf8_stream.length); i += BSP.length()) {
            ByteVector v1 = ByteVector.fromArray(BSP, utf8_stream, i);
            ByteVector prev1ByteV  = v0.slice(BSP.length() - 1, v1);
            ByteVector lookup_res1 = prev1ByteV.lanewise(VectorOperators.LSHR, 4).selectFrom(tbl1); 
            ByteVector lookup_res2 = prev1ByteV.and((byte)0xF).selectFrom(tbl2); 
            ByteVector lookup_res3 = v1.lanewise(VectorOperators.LSHR, 4).selectFrom(tbl3); 
            VectorMask<Byte> res = lookup_res3.and(lookup_res2).and(lookup_res1).compare(VectorOperators.GT, (byte)0);
            v0 = v1;
            error += res.trueCount();
        }
        return error;
    }

    interface BMInterface {
        public long apply(); 
    }

    public static void runBm(String msg, BMInterface bm) {
        long error = 0;
        for (int i = 0; i < 1000000; i++) {
            error += bm.apply();
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 1000000; i++) {
            error += bm.apply();
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[ " + msg + " time ] " + (t2 - t1) + " ms  [res]  " + error);
    }

    public static void main(String [] args) {
        runBm("three_table_distributed_lookup", () -> three_table_distributed_lookup());         
    }
}
