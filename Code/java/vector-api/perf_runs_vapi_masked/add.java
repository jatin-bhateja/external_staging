

import jdk.incubator.vector.*;
import java.nio.ByteBuffer;
import java.nio.IntBuffer;
import java.nio.ByteOrder;

public class add {
  public static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_512;
  public static final int LONG_INT_SIZE = 2;

  public static void workload_auto_vec(int[] r, int[] a, int[] b) {
    for (int i = 0; i < r.length; i++) {
      r[i] = a[i] + b[i];
    }
  }

  public static void workload_vector_api_scalar_post_loop(int[] r, int[] a, int[] b) {
    int i = 0;
    for (; i < SPECIES.loopBound(r.length); i += SPECIES.length()) {
      IntVector IV1 = IntVector.fromArray(SPECIES, a, i);
      IntVector IV2 = IntVector.fromArray(SPECIES, b, i);
      IV1 = IV1.add(IV2);
      IV1.intoArray(r, i);
    }
    for (; i < r.length; i++) {
      r[i] = a[i] + b[i];
    }
  }

  public static void workload_vector_api_masked_post_loop(int[] r, int[] a, int[] b) {
    int i = 0;
    for (; i < SPECIES.loopBound(r.length); i += SPECIES.length()) {
      IntVector IV1 = IntVector.fromArray(SPECIES, a, i);
      IntVector IV2 = IntVector.fromArray(SPECIES, b, i);
      IV1 = IV1.add(IV2);
      IV1.intoArray(r, i);
    }
    // BOX
    VectorMask<Integer> MASK = VectorMask.fromLong(SPECIES, (1 << (r.length - i)) - 1);
    // VectorMask<Integer> MASK = SPECIES.indexInRange(i, r.length);
    // BOX UNBOX
    IntVector.fromArray(SPECIES, a, i, MASK)
        // BOX UNBOX BOX UNBOX
        .add(IntVector.fromArray(SPECIES, b, i, MASK), MASK)
        // UNBOX
        .intoArray(r, i, MASK);
  }

  public static void workload_vector_api_bytebuffer_pre_post(ByteBuffer r, ByteBuffer a, ByteBuffer b) {
    int i = 0;
    int elem_size_in_bytes = SPECIES.elementSize() / 8;
    int int_buf_size = r.capacity() / elem_size_in_bytes;
    //int pre_loop_indices = r.alignmentOffset(0, SPECIES.vectorByteSize());
    int pre_loop_indices = 14*4;

    assert (pre_loop_indices % elem_size_in_bytes) == 0;

    pre_loop_indices >>= LONG_INT_SIZE;
    if (pre_loop_indices > 0) {
      // BOX
      VectorMask<Integer> MASK = VectorMask.fromLong(SPECIES, (1L << pre_loop_indices) - 1L);
      // BOX UNBOX
      IntVector.fromByteBuffer(SPECIES, a, 0, ByteOrder.nativeOrder(), MASK)
          // BOX UNBOX BOX UNBOX
          .add(IntVector.fromByteBuffer(SPECIES, b, 0, ByteOrder.nativeOrder(), MASK), MASK)
          // UNBOX
          .intoByteBuffer(r, 0, ByteOrder.nativeOrder(), MASK);

      i += pre_loop_indices;
    }

    for (; i + SPECIES.length() < SPECIES.loopBound(int_buf_size); i += SPECIES.length()) {
      IntVector IV1 = IntVector.fromByteBuffer(SPECIES, a, i * elem_size_in_bytes, ByteOrder.nativeOrder());
      IntVector IV2 = IntVector.fromByteBuffer(SPECIES, b, i * elem_size_in_bytes, ByteOrder.nativeOrder());
      IV1 = IV1.add(IV2);
      IV1.intoByteBuffer(r, i * elem_size_in_bytes, ByteOrder.nativeOrder());
    }

    int post_loop_indices = int_buf_size - i;
    if (post_loop_indices > 0) {
      // BOX
      VectorMask<Integer> MASK = VectorMask.fromLong(SPECIES, (1L << post_loop_indices) - 1L);
      // BOX UNBOX
      IntVector.fromByteBuffer(SPECIES, a, i * elem_size_in_bytes, ByteOrder.nativeOrder(), MASK)
          // BOX UNBOX BOX UNBOX
          .add(IntVector.fromByteBuffer(SPECIES, b, i * elem_size_in_bytes, ByteOrder.nativeOrder(), MASK), MASK)
          // UNBOX
          .intoByteBuffer(r, i * elem_size_in_bytes, ByteOrder.nativeOrder(), MASK);
    }
  }

  public static void main(String[] args) {
    int config = Integer.parseInt(args[0]);

    int[] a = new int[1039];
    int[] b = new int[1039];
    int[] r = new int[1039];

    int elem_size_in_bytes = SPECIES.elementSize() / 8;

    ByteBuffer buf1 = ByteBuffer.allocateDirect(1039 * 4);
    ByteBuffer buf2 = ByteBuffer.allocateDirect(1039 * 4);
    ByteBuffer bufr = ByteBuffer.allocateDirect(1039 * 4);
    //buf1 = buf1.alignedSlice(elem_size_in_bytes);
    //buf2 = buf2.alignedSlice(elem_size_in_bytes);
    //bufr = bufr.alignedSlice(elem_size_in_bytes);
    IntBuffer ibuf1 = buf1.asIntBuffer();
    IntBuffer ibuf2 = buf2.asIntBuffer();

    for (int i = 0; i < a.length; i++) {
     a[i] = i;
     b[i] = i;
    }   

    ibuf1 = ibuf1.put(a);
    ibuf2 = ibuf2.put(b);

    long t1, t2;

    // Configuration 1
    if ( config == 1 || config < 0) {
      for (int i = 0; i < 900000; i++) {
        workload_auto_vec(r, a, b);
      }
  
      t1 = System.currentTimeMillis();
      for (int i = 0; i < 90000000; i++) {
        workload_auto_vec(r, a, b);
      }
      t2 = System.currentTimeMillis();
      System.out.println("Auto-Vectorized : [Time] " + (t2 - t1) + " ms");
      for (int i = 0; i < 8; i++) {
        System.out.println("r[" + i + "] = " + r[i]);
      }
    }

    // Configuration 2
    if ( config == 2 || config < 0) {
      for (int i = 0; i < 900000; i++) {
        workload_vector_api_scalar_post_loop(r, a, b);
      }
  
      t1 = System.currentTimeMillis();
      for (int i = 0; i < 90000000; i++) {
        workload_vector_api_scalar_post_loop(r, a, b);
      }
      t2 = System.currentTimeMillis();
      System.out.println("VectorAPI-scalar post-loop: [Time] " + (t2 - t1) + " ms");
  
      for (int i = 0; i < 8; i++) {
        System.out.println("r[" + i + "] = " + r[i]);
      }
    }

    // Configuration 3
    if (config == 3 || config < 0) {
      for (int i = 0; i < 900000; i++) {
        workload_vector_api_masked_post_loop(r, a, b);
      }
  
      t1 = System.currentTimeMillis();
      for (int i = 0; i < 90000000; i++) {
        workload_vector_api_masked_post_loop(r, a, b);
      }
      t2 = System.currentTimeMillis();
      System.out.println("VectorAPI-masked post-loop: [Time] " + (t2 - t1) + " ms");
  
      for (int i = 0; i < 8; i++) {
        System.out.println("r[" + i + "] = " + r[i]);
      }
    }

    // Configuration 4
    if (config == 4 || config < 0) {
      for (int i = 0; i < 900000; i++) {
        workload_vector_api_bytebuffer_pre_post(bufr, buf1, buf2);
      }
  
      t1 = System.currentTimeMillis();
      for (int i = 0; i < 90000000; i++) {
      workload_vector_api_bytebuffer_pre_post(bufr, buf1, buf2);
      }
      t2 = System.currentTimeMillis();
      IntBuffer irbuf  = bufr.asIntBuffer();
      System.out.println("VectorAPI-aligned ByteBuffer per-post masked : [Time] " + (t2 - t1) + " ms");
      for (int i = 0; i < 8; i++) {
        System.out.println("r[" + i + "] = " + irbuf.get(i));
      }
    }
  }
}
