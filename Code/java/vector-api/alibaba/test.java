/*
      if (valueCount - totalRead  < 8) {
        buffer = 0;
        int bitsToRead = 7 * (int)(valueCount - totalRead);
        int bytesToRead = alignToBytes(bitsToRead);
        for (int i = 7 - 1; i >= 7 - bytesToRead ; i--) {
          buffer |= (((long)in.read()) & 255) << (i * 8);
        }
        count = 8;
        totalRead = valueCount;
      } else {
        buffer =
            ((((long)in.read()) & 255) << 56)
            ((((long)in.read()) & 255) << 48)
            + ((((long)in.read()) & 255) << 40)
            + ((((long)in.read()) & 255) << 32)
            + ((((long)in.read()) & 255) << 24)
            + (in.read() << 16)
            + (in.read() << 8)
            + in.read();
        count = 8;
        totalRead += 8;
      }
    }
    int result = (((int)(buffer >> ((count - 1) * 7))) & 127);
    -- count;
    return result;
*/

import jdk.incubator.vector.*;

class test {
  public static byte [] arr;

  public static int micro1(int offset, boolean tail) {
     long buffer = 0;
     if (false == tail) {
       buffer =
            ((((long)arr[offset+7]) & 255) << 56)
            + ((((long)arr[offset+6]) & 255) << 48)
            + ((((long)arr[offset+5]) & 255) << 40)
            + ((((long)arr[offset+4]) & 255) << 32)
            + ((((long)arr[offset+3]) & 255) << 24)
            + ((((long)arr[offset+2]) & 255) << 16)
            + ((((long)arr[offset+1]) & 255) << 8)
            + ((long)arr[offset] & 255);
    } else {
       for (int i = offset; i < arr.length; i++) {
          buffer |= (((long)arr[i]) & 255) << (i * 8);
       }
    }
    return (int)buffer;
  }

  public static int micro1_vec(int offset, boolean tail) {
     int bytes = 0;
     ByteVector bvec = null;
     LongVector lvec = null;
     if (false == tail) {
        bvec = ByteVector.fromArray(ByteVector.SPECIES_64, arr, offset);
        lvec = (LongVector)bvec.castShape(LongVector.SPECIES_512, 0);
        bytes = (int)lvec.lanewise(VectorOperators.AND, 255)
                   .lanewise(VectorOperators.LSHL, LongVector.SPECIES_512.broadcast(0).addIndex(8))
                   .reduceLanes(VectorOperators.ADD);
     } else {
        VectorMask<Byte> mask = VectorMask.fromLong(ByteVector.SPECIES_64, arr.length-offset);
        bvec = ByteVector.fromArray(ByteVector.SPECIES_64, arr, offset, mask);
        lvec = (LongVector)bvec.castShape(LongVector.SPECIES_512, 0);
        bytes = (int)lvec.lanewise(VectorOperators.AND, 255)
                   .lanewise(VectorOperators.LSHL, LongVector.SPECIES_512.broadcast(0).addIndex(8))
                   .reduceLanes(VectorOperators.OR, mask.cast(LongVector.SPECIES_512));
     }
     return bytes;
  }

  public static int SIZE;
  public static int LOOP_SIZE;

  public static void main(String [] args) {
     SIZE = Integer.parseInt(args[0]);
     LOOP_SIZE = SIZE - (SIZE % 8);

     System.out.println("SIZE = " + SIZE);
     System.out.println("LOOP_SIZE = " + LOOP_SIZE);

     arr = new byte[SIZE];
     for(int i = 0 ; i < SIZE; i++) {
        arr[i] = (byte)i;
     }

     int res = 0;
     for(int i = 0; i < 700000; i++) {
        int j = 0;
        for (; j < LOOP_SIZE ; j += 8) {
           res += micro1(j, false);
        }
        if (j < LOOP_SIZE) res += micro1(j, true);
     }
     res = 0;
     long t1 = System.currentTimeMillis();
     for(int i = 0; i < 100000; i++) {
        int j = 0;
        for (; j < LOOP_SIZE; j += 8) {
           res += micro1(j, false);
        }
        if (j < LOOP_SIZE) res += micro1(j, true);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[Scalar Time] " + (t2-t1) + "ms [Res] " + res);
 
     res = 0;
     for(int i = 0; i < 700000; i++) {
        int j = 0;
        for (; j < LOOP_SIZE; j += 8) {
           res += micro1_vec(j, false);
        }
        if (j < LOOP_SIZE) res += micro1_vec(j, true);
     }
     res = 0;
     t1 = System.currentTimeMillis();
     for(int i = 0; i < 100000; i++) {
        int j = 0;
        for (; j < LOOP_SIZE; j += 8) {
           res += micro1_vec(j, false);
        }
        if (j < LOOP_SIZE) res += micro1_vec(j, true);
     }
     t2 = System.currentTimeMillis();
     System.out.println("[Vector Time] " + (t2-t1) + "ms [Res] " + res);
  }
}
