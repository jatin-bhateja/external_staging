
import jdk.incubator.vector.*;
import java.util.Random;
import java.nio.ByteBuffer;

public class VarIntUtils {
  public static final int ITERS = 10000;
  public static final int[] shift_arr = { 0, 7, 14, 21, 28, 35, 42, 49, 56, 63 };

  public static final VectorSpecies<Byte> BSPEC64 = ByteVector.SPECIES_64;
  public static final VectorSpecies<Byte> BSPEC128 = ByteVector.SPECIES_128;

  public static final VectorSpecies<Integer> ISPEC128 = IntVector.SPECIES_128;
  public static final VectorSpecies<Integer> ISPEC256 = IntVector.SPECIES_256;
  public static final VectorSpecies<Integer> ISPEC512 = IntVector.SPECIES_512;

  static class ByteBufferWrapper {
    private byte[] barr;
    private int bpos;

    public ByteBufferWrapper(ByteBuffer bbuf) {
      barr = new byte[bbuf.capacity()];
      bpos = 0;
    }

    public void setpos(int step) {
      bpos += step;
    }

    public int position() {
      return bpos;
    }

    public byte[] bytes() {
      return barr;
    }

    public void rewind() {
      bpos = 0;
    }

    public byte getByte(int idx) {
      return barr[idx];
    }
  }

  public static int readVarInt32(ByteBuffer src) {
    int tmp;
    if ((tmp = src.get()) >= 0) {
      return tmp;
    }
    int result = tmp & 0x7f;
    if ((tmp = src.get()) >= 0) {
      result |= tmp << 7;
    } else {
      result |= (tmp & 0x7f) << 7;
      if ((tmp = src.get()) >= 0) {
        result |= tmp << 14;
      } else {
        result |= (tmp & 0x7f) << 14;
        if ((tmp = src.get()) >= 0) {
          result |= tmp << 21;
        } else {
          result |= (tmp & 0x7f) << 21;
          result |= (tmp = src.get()) << 28;
          while (tmp < 0) {
            // We get into this loop only in the case of overflow.
            // By doing this, we can call getVarInt() instead of
            // getVarLong() when we only need an int.
            tmp = src.get();
          }
        }
      }
    }
    return result;
  }

  public static int readVarInt32_Vector(ByteBufferWrapper src, int idx) {
    IntVector ivec_pl = null;
    IntVector shift_vec = null;
    ByteVector bvec = ByteVector.fromArray(BSPEC64, src.bytes(), idx, VectorMask.fromLong(BSPEC64, ((1L << 5) - 1)));
    IntVector ivec = bvec.convertShape(VectorOperators.B2I, ISPEC256, 0).reinterpretAsInts();
    VectorMask<Integer> cmp_mask = ivec.compare(VectorOperators.LT, 0).not();
    int scan_window = cmp_mask.firstTrue();
    src.setpos(scan_window + 1); // Overhead.
    switch (scan_window) {
      case 0:
        return (int) src.getByte(0);
      case 1:
        ivec_pl = ivec.lanewise(VectorOperators.AND, 0x7f);
        shift_vec = IntVector.fromArray(ISPEC128, shift_arr, 0, VectorMask.fromLong(ISPEC128, 3));
        return ivec_pl.castShape(ISPEC128, 0)
            .lanewise(VectorOperators.LSHL, shift_vec)
            .reinterpretAsInts()
            .reduceLanes(VectorOperators.OR);
      case 2:
        ivec_pl = ivec.lanewise(VectorOperators.AND, 0x7f);
        shift_vec = IntVector.fromArray(ISPEC128, shift_arr, 0, VectorMask.fromLong(ISPEC128, 7));
        return ivec_pl.castShape(ISPEC128, 0)
            .lanewise(VectorOperators.LSHL, shift_vec)
            .reinterpretAsInts()
            .reduceLanes(VectorOperators.OR);
      case 3:
        ivec_pl = ivec.lanewise(VectorOperators.AND, 0x7f);
        shift_vec = IntVector.fromArray(ISPEC128, shift_arr, 0, VectorMask.fromLong(ISPEC128, 15));
        return ivec_pl.castShape(ISPEC128, 0)
            .lanewise(VectorOperators.LSHL, shift_vec)
            .reinterpretAsInts()
            .reduceLanes(VectorOperators.OR);
      case 4:
        ivec_pl = ivec.lanewise(VectorOperators.AND, 0x7f);
        shift_vec = IntVector.fromArray(ISPEC256, shift_arr, 0, VectorMask.fromLong(ISPEC256, 31));
        return ivec_pl.lanewise(VectorOperators.LSHL, shift_vec)
            .reinterpretAsInts()
            .reduceLanes(VectorOperators.OR);
      default:
        assert false : "Unexpected mask";
        return -1;
    }
  }

  public static long readVarInt64(ByteBuffer src) {
    long tmp;
    if ((tmp = src.get()) >= 0) {
      return tmp;
    }
    long result = tmp & 0x7f;
    if ((tmp = src.get()) >= 0) {
      result |= tmp << 7;
    } else {
      result |= (tmp & 0x7f) << 7;
      if ((tmp = src.get()) >= 0) {
        result |= tmp << 14;
      } else {
        result |= (tmp & 0x7f) << 14;
        if ((tmp = src.get()) >= 0) {
          result |= tmp << 21;
        } else {
          result |= (tmp & 0x7f) << 21;
          if ((tmp = src.get()) >= 0) {
            result |= tmp << 28;
          } else {
            result |= (tmp & 0x7f) << 28;
            if ((tmp = src.get()) >= 0) {
              result |= tmp << 35;
            } else {
              result |= (tmp & 0x7f) << 35;
              if ((tmp = src.get()) >= 0) {
                result |= tmp << 42;
              } else {
                result |= (tmp & 0x7f) << 42;
                if ((tmp = src.get()) >= 0) {
                  result |= tmp << 49;
                } else {
                  result |= (tmp & 0x7f) << 49;
                  if ((tmp = src.get()) >= 0) {
                    result |= tmp << 56;
                  } else {
                    result |= (tmp & 0x7f) << 56;
                    result |= ((long) src.get()) << 63;
                  }
                }
              }
            }
          }
        }
      }
    }
    return result;
  }

  public static long readVarInt64_Vector(ByteBufferWrapper src, int idx) {
    IntVector ivec_pl = null;
    IntVector shift_vec = null;
    ByteVector bvec = ByteVector.fromArray(BSPEC128, src.bytes(), idx, VectorMask.fromLong(BSPEC128, ((1L << 10) - 1)));
    IntVector ivec = bvec.convertShape(VectorOperators.B2I, ISPEC512, 0).reinterpretAsInts();
    VectorMask<Integer> cmp_mask = ivec.compare(VectorOperators.LT, 0).not();
    int scan_window = cmp_mask.firstTrue();
    src.setpos(scan_window + 1); // Overhead
    switch (scan_window) {
      case 0:
        return (int) src.getByte(0);
      case 1:
        ivec_pl = ivec.lanewise(VectorOperators.AND, 0x7f);
        shift_vec = IntVector.fromArray(ISPEC128, shift_arr, 0, VectorMask.fromLong(ISPEC128, 3));
        return ivec_pl.castShape(ISPEC128, 0)
            .lanewise(VectorOperators.LSHL, shift_vec)
            .reinterpretAsInts()
            .reduceLanes(VectorOperators.OR);
      case 2:
        ivec_pl = ivec.lanewise(VectorOperators.AND, 0x7f);
        shift_vec = IntVector.fromArray(ISPEC128, shift_arr, 0, VectorMask.fromLong(ISPEC128, 7));
        return ivec_pl.castShape(ISPEC128, 0)
            .lanewise(VectorOperators.LSHL, shift_vec)
            .reinterpretAsInts()
            .reduceLanes(VectorOperators.OR);
      case 3:
        ivec_pl = ivec.lanewise(VectorOperators.AND, 0x7f);
        shift_vec = IntVector.fromArray(ISPEC128, shift_arr, 0, VectorMask.fromLong(ISPEC128, 15));
        return ivec_pl.castShape(ISPEC128, 0)
            .lanewise(VectorOperators.LSHL, shift_vec)
            .reinterpretAsInts()
            .reduceLanes(VectorOperators.OR);
      case 4:
        ivec_pl = ivec.lanewise(VectorOperators.AND, 0x7f);
        shift_vec = IntVector.fromArray(ISPEC256, shift_arr, 0, VectorMask.fromLong(ISPEC256, 31));
        return ivec_pl.castShape(ISPEC256, 0)
            .lanewise(VectorOperators.LSHL, shift_vec)
            .reinterpretAsInts()
            .reduceLanes(VectorOperators.OR);
      case 5:
        ivec_pl = ivec.lanewise(VectorOperators.AND, 0x7f);
        shift_vec = IntVector.fromArray(ISPEC256, shift_arr, 0, VectorMask.fromLong(ISPEC256, 63));
        return ivec_pl.castShape(ISPEC256, 0)
            .lanewise(VectorOperators.LSHL, shift_vec)
            .reinterpretAsInts()
            .reduceLanes(VectorOperators.OR);
      case 6:
        ivec_pl = ivec.lanewise(VectorOperators.AND, 0x7f);
        shift_vec = IntVector.fromArray(ISPEC256, shift_arr, 0, VectorMask.fromLong(ISPEC256, 127));
        return ivec_pl.castShape(ISPEC256, 0)
            .lanewise(VectorOperators.LSHL, shift_vec)
            .reinterpretAsInts()
            .reduceLanes(VectorOperators.OR);
      case 7:
        ivec_pl = ivec.lanewise(VectorOperators.AND, 0x7f);
        shift_vec = IntVector.fromArray(ISPEC256, shift_arr, 0, VectorMask.fromLong(ISPEC256, 255));
        return ivec_pl.castShape(ISPEC256, 0)
            .lanewise(VectorOperators.LSHL, shift_vec)
            .reinterpretAsInts()
            .reduceLanes(VectorOperators.OR);
      case 8:
        ivec_pl = ivec.lanewise(VectorOperators.AND, 0x7f);
        shift_vec = IntVector.fromArray(ISPEC512, shift_arr, 0, VectorMask.fromLong(ISPEC512, 511));
        return ivec_pl.lanewise(VectorOperators.LSHL, shift_vec)
            .reinterpretAsInts()
            .reduceLanes(VectorOperators.OR);
      case 9:
        ivec_pl = ivec.lanewise(VectorOperators.AND, 0x7f);
        shift_vec = IntVector.fromArray(ISPEC512, shift_arr, 0, VectorMask.fromLong(ISPEC512, 1023));
        return ivec_pl.lanewise(VectorOperators.LSHL, shift_vec)
            .reinterpretAsInts()
            .reduceLanes(VectorOperators.OR);
      default:
        assert false : "Unexpected mask";
        return -1;
    }
  }

  public static ByteBuffer initializeInputs(int selectivity, boolean is64bit, ByteBuffer bb, byte[] ba) {
    byte[][] init_matrix = {
        { 127 }, // LE 7bits
        { -128, 127 }, // GE 8bits LE 14bits
        { -128, -128, 127 }, // GE 15bits LE 21bits
        { -128, -128, -128, 127 }, // GE 22bits LE 28bits
        { -128, -128, -128, -128, 8 }, // GE 29bits LE 35bits
        { -128, -128, -128, -128, -128, 127 }, // GE 36bits LE 42bits
        { -128, -128, -128, -128, -128, -128, 127 }, // GE 43bits LE 49bits
        { -128, -128, -128, -128, -128, -128, -128, 127 }, // GE 50bits LE 56bits
        { -128, -128, -128, -128, -128, -128, -128, -128, 127 }, // GE 57bits LE 63bits
        { -128, -128, -128, -128, -128, -128, -128, -128, -128, 1 }, // GT 63bits
    };

    // ByteBuffer initialization with longs/integers.
    int cap = is64bit ? 10 : 5;
    if (selectivity < 0) {
      // Random initialization
      Random r = new Random(1024);
      int i = 0;
      while (i < bb.capacity() - cap) {
        selectivity = r.nextInt(cap);
        bb = bb.put(init_matrix[selectivity]);
        i += init_matrix[selectivity].length;
      }
    } else {
      int i = 0;
      while (i < bb.capacity() - cap) {
        bb = bb.put(init_matrix[selectivity]);
        i += init_matrix[selectivity].length;
      }
    }
    bb.rewind();
    bb.get(ba);
    bb.rewind();
    return bb;
  }

  public static void main(String[] args) {
    int algo = Integer.parseInt(args[0]);
    int capacity = Integer.parseInt(args[1]);
    int selectivity = Integer.parseInt(args[2]);
    int dbits = Integer.parseInt(args[3]);

    ByteBuffer bbuf = ByteBuffer.allocateDirect(capacity);
    // Since vectors do not accept ByteBuffer inputs dump the ByteBuffer into byte
    // [].

    // FIXME: Rebase scalar algorithm to use MemorySegments.
    ByteBufferWrapper bbufw = new ByteBufferWrapper(bbuf);

    initializeInputs(selectivity, 64 == dbits, bbuf, bbufw.barr);

    if (algo == 0) {
      if (dbits == 32) {
        long res = 0;
        for (int i = 0; i < ITERS; i++) {
          while (bbuf.position() < (capacity - 10)) {
            res += readVarInt32(bbuf);
          }
          bbuf.rewind();
        }
        res = 0;
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < ITERS; i++) {
          while (bbuf.position() < (capacity - 10)) {
            res += readVarInt32(bbuf);
          }
          bbuf.rewind();
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[Time readVarInt32] " + (t2 - t1) + " ms    [Res] " + res);

      } else {
        long res = 0;
        for (int i = 0; i < ITERS; i++) {
          while (bbuf.position() < (capacity - 10)) {
            res += readVarInt64(bbuf);
          }
          bbuf.rewind();
        }
        res = 0;
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < ITERS; i++) {
          while (bbuf.position() < (capacity - 10)) {
            res += readVarInt64(bbuf);
          }
          bbuf.rewind();
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[Time readVarInt64] " + (t2 - t1) + " ms    [Res] " + res);

      }
    } else {
      if (dbits == 32) {
        long res = 0;
        for (int i = 0; i < ITERS; i++) {
          while (bbufw.position() < (capacity - 10)) {
            res += readVarInt32_Vector(bbufw, bbufw.position());
          }
          bbufw.rewind();
        }
        res = 0;
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < ITERS; i++) {
          while (bbufw.position() < (capacity - 10)) {
            res += readVarInt32_Vector(bbufw, bbufw.position());
          }
          bbufw.rewind();
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[Time readVarInt32_Vector] " + (t2 - t1) + " ms    [Res] " + res);

      } else {
        long res = 0;
        for (int i = 0; i < ITERS; i++) {
          while (bbufw.position() < (capacity - 10)) {
            res += readVarInt64_Vector(bbufw, bbufw.position());
          }
          bbufw.rewind();
        }
        res = 0;
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < ITERS; i++) {
          while (bbufw.position() < (capacity - 10)) {
            res += readVarInt64_Vector(bbufw, bbufw.position());
          }
          bbufw.rewind();
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[Time readVarInt64_Vector] " + (t2 - t1) + " ms    [Res] " + res);

      }
    }
  }
}