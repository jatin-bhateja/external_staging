

import jdk.incubator.vector.*;
import jdk.incubator.vector.VectorOperators.Operator.*;

class vapi_compare {
  public static VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_256;

  public int micro_vector(byte [] src1, byte [] src2, int length) {
    int i = 0;
    int nvectors_tail = length & (SPECIES.length() - 1);
    int veclength = SPECIES.loopBound(length);
    for (; i < veclength; i += SPECIES.length()) {
      Vector<Byte> vec1 = ByteVector.fromArray(SPECIES, src1, i);
      Vector<Byte> vec2 = ByteVector.fromArray(SPECIES, src2, i);
      VectorMask<Byte> vres  = vec1.compare(VectorOperators.EQ, vec2);
      if ( false == vres.allTrue()) {
         return i + vres.not().firstTrue();
      } 
    }

    if (nvectors_tail > 0) {
      VectorMask<Byte> vmask = VectorMask.fromLong(SPECIES, ((1L << nvectors_tail)-1));
      Vector<Byte> vec1 = ByteVector.fromArray(SPECIES, src1, i , vmask); 
      Vector<Byte> vec2 = ByteVector.fromArray(SPECIES, src2, i , vmask); 
      VectorMask<Byte> tres = vec1.compare(VectorOperators.EQ, vec2);
      int mindex = tres.not().firstTrue();
      return mindex >= nvectors_tail ? -1 : veclength + mindex;
    }
    return -1;
  }


  public int micro_scalar(byte [] src1, byte [] src2, int length) {
    for(int i = 0 ; i < length ; i++)
       if (src1[i] != src2[i])
         return i;
    return -1;
  }


  public static byte [] alloc_init_buffers(int length) {
    byte [] buf = new byte[length];
    for(int i = 0 ; i < buf.length; i++) {
      buf[i] = 1;
    }
    return buf;
  }

  public static void main(String [] args) {
    int buff_len = Integer.parseInt(args[0]);
    int mismatch_index = Integer.parseInt(args[1]);
 
    byte [] src1 = alloc_init_buffers(buff_len);
    byte [] src2 = alloc_init_buffers(buff_len);
    src2[mismatch_index] = 0;

    vapi_compare obj = new vapi_compare();
    long t1 = System.currentTimeMillis();
    int index = -1;
    for(int i = 0 ; i < 1000000 ; i++) {
       index = obj.micro_vector(src1, src2, src1.length);
       assert index == mismatch_index : "Incorrect mismatch";
    }
    long t2 = System.currentTimeMillis();
    System.out.println("[Time] " + (t2-t1) + " ms  , Vector Mismatch Index = " +  index);

    t1 = System.currentTimeMillis();
    for(int i = 0 ; i < 1000000 ; i++) {
       index = obj.micro_scalar(src1, src2, src1.length);
       assert index == mismatch_index : "Incorrect mismatch";
    }
    t2 = System.currentTimeMillis();
    System.out.println("[Time] " + (t2-t1) + " ms  , Scalar Mismatch Index = " +  index);
  }
}
