

import jdk.incubator.vector.ByteVector;
import jdk.incubator.vector.IntVector;
import jdk.incubator.vector.VectorMask;
import jdk.incubator.vector.VectorOperators;
import jdk.incubator.vector.VectorSpecies;
import java.util.Random;

//
//           4bit index
//  Table1 : 16 entry => {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
//  Table2 : 16 entry => {16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31}
//  Table2 : 16 entry => {32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47}
//
//  Total key size bits = 12, byte1=8 byte2=4(upper)
//
//

public class ThreeVsTwoTableLookup {

    // Pattens to detect         3TB0N1 3TB0N0 3TB1N1    2TL6Bit   2TU6bit
    //        B0        B1
    //        LN   UN   UN 
    // PAT1 = 0000 0000 0000     0000   0000   0000      000000    000000
    // PAT2 = 0010 0010 0000     0010   0010   0000      100010    000000
    // PAT3 = 0010 0000 0010     0000   0010   0010      000010    001000
    // PAT4 = 0100 0100 0100     0100   0100   0100      000100    010001
    // PAT5 = 1000 1000 1000     1000   1000   1000      001000    100010
    // PAT6 = 1000 0100 0011     0100   1000   0011      001000    001101
    // PAT7 = 1000 0010 1111     0010   1000   1111      101000    111100
    // PAT8 = 1111 1111 1111     1111   1111   1111      111111    111111

    // Where, 3TB1N1 = Three table, byte 1 upper nibble
    //        3TB0N0 = Three table, byte 0 lower nibble
    //        3TB0N1 = Three table, byte 0 upper nibble
    //        2TL6Bit = Two table, least significant 6 bits of first byte
    //        2TU6bit = Two table, upper nibble of second byte prepended by
    //                  most significant two bits of first byte 
    public static byte [] genStream() {
        Random rd = new Random(1111);
        byte [] stream = new byte[2048];
        for (int i = 0; i < stream.length; i++) {
            stream[i] = (byte)(rd.nextInt());
        }
        return stream;
    }

    public static byte [] stream = genStream();

    public static final byte PAT1 = (byte)1;
    public static final byte PAT2 = (byte)2;
    public static final byte PAT3 = (byte)4;
    public static final byte PAT4 = (byte)8;
    public static final byte PAT5 = (byte)16;
    public static final byte PAT6 = (byte)32;
    public static final byte PAT7 = (byte)64;
    public static final byte PAT8 = (byte)0b1000_0000;

    // Index = lower nibble of byte 1
    public static byte [] genTable1() {
        byte [] table = new byte[16];
        table[0b00_00] = PAT1;
        table[0b00_10] = (byte)(PAT2 | PAT3);
        table[0b01_00] = PAT4;
        table[0b10_00] = (byte)(PAT5 | PAT6 | PAT7);
        table[0b11_11] = PAT8;
        return table;
    }

    // Index = upper nibble of byte 1
    public static byte [] genTable2() {
        byte [] table = new byte[16];
        table[0b00_00] = (byte)(PAT1 | PAT3);
        table[0b00_10] = (byte)(PAT2 | PAT7);
        table[0b01_00] = (byte)(PAT4 | PAT6);
        table[0b10_00] = PAT5;
        table[0b11_11] = PAT8;
        return table;
    }

    // Index = upper nibble of byte 2
    public static byte [] genTable3() {
        byte [] table = new byte[16];
        table[0b00_00] = (byte)(PAT1 | PAT2);
        table[0b00_10] = PAT3;
        table[0b00_11] = PAT6;
        table[0b01_00] = PAT4;
        table[0b10_00] = PAT5;
        table[0b11_11] = (byte)(PAT7 | PAT8);
        return table;
    }

    // Index = lower 6bits of byte1
    public static byte [] genTable4() {
        byte [] table = new byte[64];
        table[0b0000_00] = PAT1;
        table[0b1000_10] = PAT2;
        table[0b0000_10] = PAT3;
        table[0b0001_00] = PAT4;
        table[0b0010_00] = (byte)(PAT5 | PAT6);
	table[0b1010_00] = PAT7;
        table[0b1111_11] = PAT8;
        return table;
    }

    // Index = lower 2 lsb bits are upper two bits of byte1, and next 4 bits
    // are upper nibble of byte2.
    public static byte [] genTable5() {
        byte [] table = new byte[64];
        table[0b0000_00] = (byte)(PAT1 | PAT2);
        table[0b0010_00] = PAT3;
        table[0b0100_01] = PAT4;
        table[0b1000_10] = PAT5;
        table[0b0011_01] = PAT6;
        table[0b1111_00] = PAT7;
        table[0b1111_11] = PAT8;
        return table;
    }

    // 2Table -> 2TK1, 2TK2 each key 6bit wide.
    // 3Table -> 3TK1, 3TK2, 3TK3 each key 4bit wide.
    // Total number of key bits is 12 in both the case which are extracted from two

    public static final VectorSpecies<Byte> BSP = ByteVector.SPECIES_PREFERRED;
    public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_PREFERRED;

    public static final ByteVector tbl1 = loadTable(1);
    public static final ByteVector tbl2 = loadTable(2);
    public static final ByteVector tbl3 = loadTable(3);

    public static final ByteVector tbl4 = loadTable(4);
    public static final ByteVector tbl5 = loadTable(5);

    public static ByteVector loadTable(int table_number) {
        byte [] orig_table = switch(table_number) {
            case 1 -> genTable1();
            case 2 -> genTable2();
            case 3 -> genTable3();
            case 4 -> genTable4();
            case 5 -> genTable5();
            default -> null;
        };

        byte [] table = new byte[BSP.length()];
        System.arraycopy(orig_table, 0, table, 0, orig_table.length);
        return ByteVector.fromArray(BSP, table, 0);
    }

    public static long three_table_distributed_lookup() {
        long match = 0;
        ByteVector v0 = ByteVector.broadcast(BSP, 0);
        for (int i = 0; i < BSP.loopBound(stream.length); i += BSP.length()) {
            ByteVector v1 = ByteVector.fromArray(BSP, stream, i);
            ByteVector prev1BVec = v0.slice(BSP.length() - 1, v1);
            ByteVector lookup_res1 = prev1BVec.and((byte)0xF)
                                              .selectFrom(tbl1);
            ByteVector lookup_res2 = prev1BVec.reinterpretAsInts()
                                              .lanewise(VectorOperators.LSHR, 4)
                                              .and(ISP.broadcast(0x0F0F0F0F))
                                              .reinterpretAsBytes()
                                              .selectFrom(tbl2);
            ByteVector lookup_res3 = v1.reinterpretAsInts()
                                       .lanewise(VectorOperators.LSHR, 4)
                                       .and(ISP.broadcast(0x0F0F0F0F))
                                       .reinterpretAsBytes()
                                       .selectFrom(tbl3);
            VectorMask<Byte> res = lookup_res3.and(lookup_res2)
                                              .and(lookup_res1)
                                              .compare(VectorOperators.GT, (byte)0);
            v0 = v1;
            match += res.trueCount();
        }
        return match;
    }

    public static long two_table_distributed_lookup() {
        long match = 0;
        ByteVector v0 = ByteVector.broadcast(BSP, 0);
        for (int i = 0; i < BSP.loopBound(stream.length); i += BSP.length()) {
            ByteVector v1 = ByteVector.fromArray(BSP, stream, i);
            ByteVector prev1BVec  = v0.slice(BSP.length() - 1, v1);
            ByteVector lookup_res1 = prev1BVec.reinterpretAsInts()
                                              .and(ISP.broadcast(0x3F3F3F3F))
                                              .reinterpretAsBytes()
                                              .selectFrom(tbl4);
            ByteVector lookup_res2 = v1.reinterpretAsInts()
                                       .lanewise(VectorOperators.LSHR, 2)
                                       .and(ISP.broadcast(0x3C3C3C3C))
                                       .reinterpretAsBytes()
                                       .or(prev1BVec.reinterpretAsInts()
                                                    .lanewise(VectorOperators.LSHR, 6)
                                                    .and(ISP.broadcast(0x03030303))
                                                    .reinterpretAsBytes())
                                       .selectFrom(tbl5);
            VectorMask<Byte> res = lookup_res1.and(lookup_res2)
                                              .compare(VectorOperators.GT, (byte)0);
            v0 = v1;
            match += res.trueCount();
        }
        return match;
    }

    interface BMInterface {
        public long apply();
    }

    public static void runBm(String msg, BMInterface bm) {
        long match = 0;
        for (int i = 0; i < 1000000; i++) {
            match += bm.apply();
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 1000000; i++) {
            match += bm.apply();
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[ " + msg + " time ] " + (t2 - t1) + " ms  [res]  " + match);
    }

    public static void main(String [] args) {
        if (Integer.parseInt(args[0]) == 0) {
            runBm("two_table_distributed_lookup", () -> two_table_distributed_lookup());
        } else {
            runBm("three_table_distributed_lookup", () -> three_table_distributed_lookup());
        }
    }
}
