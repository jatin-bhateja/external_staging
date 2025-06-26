
import java.util.stream.*;
import jdk.incubator.vector.*;

class convert {
  public static Byte[] getBoxedArray(byte[] arr) {
    Byte[] boxed_arr = new Byte[arr.length];
    for (int i = 0; i < arr.length; i++)
      boxed_arr[i] = Byte.valueOf(arr[i]);
    return boxed_arr;
  }
  public static Short[] getBoxedArray(short[] arr) {
    Short[] boxed_arr = new Short[arr.length];
    for (int i = 0; i < arr.length; i++)
      boxed_arr[i] = Short.valueOf(arr[i]);
    return boxed_arr;
  }
  public static Integer[] getBoxedArray(int[] arr) {
    Integer[] boxed_arr = new Integer[arr.length];
    for (int i = 0; i < arr.length; i++)
      boxed_arr[i] = Integer.valueOf(arr[i]);
    return boxed_arr;
  }
  public static Long[] getBoxedArray(long[] arr) {
    Long[] boxed_arr = new Long[arr.length];
    for (int i = 0; i < arr.length; i++)
      boxed_arr[i] = Long.valueOf(arr[i]);
    return boxed_arr;
  }
  public static Float[] getBoxedArray(float[] arr) {
    Float[] boxed_arr = new Float[arr.length];
    for (int i = 0; i < arr.length; i++)
      boxed_arr[i] = Float.valueOf(arr[i]);
    return boxed_arr;
  }
  public static Double[] getBoxedArray(double[] arr) {
    Double[] boxed_arr = new Double[arr.length];
    for (int i = 0; i < arr.length; i++)
      boxed_arr[i] = Double.valueOf(arr[i]);
    return boxed_arr;
  }

  public static <E > Number zeroValue(E to) {
    if (to.getClass().equals(Byte.class))
      return Byte.valueOf((byte)0);
    if (to.getClass().equals(Short.class))
      return Short.valueOf((short)0);
    else if (to.getClass().equals(Integer.class))
      return Integer.valueOf(0);
    else if (to.getClass().equals(Long.class))
      return Long.valueOf((long)0);
    else if (to.getClass().equals(Float.class))
      return Float.valueOf((float)0);
    else if (to.getClass().equals(Double.class))
      return Double.valueOf((double)0);
    else
      assert (false);
    return null;
  }

  public static <E , F > Number convertValue(E from,
                                                                         F to) {
    if (to.getClass().equals(Byte.class))
      return Byte.valueOf(((Number)(from)).byteValue());
    if (to.getClass().equals(Short.class))
      return Short.valueOf(((Number)(from)).shortValue());
    else if (to.getClass().equals(Integer.class))
      return Integer.valueOf(((Number)(from)).intValue());
    else if (to.getClass().equals(Long.class))
      return Long.valueOf(((Number)(from)).longValue());
    else if (to.getClass().equals(Float.class))
      return Float.valueOf(((Number)(from)).floatValue());
    else if (to.getClass().equals(Double.class))
      return Double.valueOf(((Number)(from)).doubleValue());
    else
      assert (false);
    return null;
  }

  public static <E> void compareResults(E[] ref, E[] res) {
    assert (res.length == ref.length);
    for (int i = 0; i < ref.length; i++) {
      System.out.println("res[" + i + "] = " + res[i] + " ref[" + i +
                         "] = " + ref[i]);
      assert (res[i] == ref[i]);
    }
  }

  public static <E , F > void
  convert_scalar_expanding(E[] inp, F[] out, int inp_vec_len, int out_vec_len, int inp_idx,  int out_idx, int part) {
    int SLICE_FACTOR = inp_vec_len / out_vec_len;
    assert (part < SLICE_FACTOR && part >= 0);
    int start_idx = part * out_vec_len;
    for (int i = 0; i < out_vec_len; i++)
      out[i] = (F)(convert.<E, F>convertValue(inp[i + start_idx + inp_idx], out[i + out_idx]));
  }

  public static <E , F > void
  convert_scalar_compacting(E[] inp, F[] out, int inp_vec_len, int out_vec_len, int inp_idx,  int out_idx, int part) {
    int SLICE_FACTOR = out_vec_len / inp_vec_len;
    assert (part > -SLICE_FACTOR && part <= 0);
    int start_idx = -part * inp_vec_len;
    for (int i = 0; i < out_vec_len; i++)
      out[i+out_idx] = (F)(zeroValue(out[i+out_idx]));
    for (int i = 0; i < inp_vec_len; i++)
      out[i + start_idx + out_idx] =
          (F)(convert.<E, F>convertValue(inp[i+inp_idx], out[i + start_idx+ out_idx]));
  }


  public static void workload_convert(long[] arr, byte[] res, int part) {
    byte[] ref = new byte[res.length];
    LongVector LV = LongVector.fromArray(LongVector.SPECIES_256, arr, 0);

    Vector<Byte> BV = LV.convert(VectorOperators.L2B, part);
    ((ByteVector)(BV)).intoArray(res, 0);

    Byte[] boxed_res = getBoxedArray(res);
    Byte[] boxed_ref = getBoxedArray(ref);
    Long[] boxed_arr = getBoxedArray(arr);

    convert.<Long, Byte>convert_scalar_compacting(
        boxed_arr, boxed_ref, LongVector.SPECIES_256.length(), ByteVector.SPECIES_256.length() ,0 ,0,part);

    convert.<Byte>compareResults(boxed_ref, boxed_res);
  }

  public static void workload_convert_shape(long[] arr, byte[] res, int part) {
    byte[] ref = new byte[res.length];
    LongVector LV = LongVector.fromArray(LongVector.SPECIES_128, arr, 0);

    Vector<Byte> BV =
        LV.convertShape(VectorOperators.L2B, ByteVector.SPECIES_256, part);
    ((ByteVector)(BV)).intoArray(res, 0);

    Byte[] boxed_res = getBoxedArray(res);
    Byte[] boxed_ref = getBoxedArray(ref);
    Long[] boxed_arr = getBoxedArray(arr);

    convert.<Long, Byte>convert_scalar_compacting(
        boxed_arr, boxed_ref, LongVector.SPECIES_128.length(), ByteVector.SPECIES_256.length() ,0 ,0,part);

    convert.<Byte>compareResults(boxed_ref, boxed_res);
  }

  public static void workload_convert_expand(byte[] arr, long[] res, int part) {
    long[] ref = new long[res.length];
    ByteVector BV = ByteVector.fromArray(ByteVector.SPECIES_256, arr, 0);

    Vector<Long> LV = BV.convert(VectorOperators.B2L, part);
    ((LongVector)(LV)).intoArray(res, 0);

    Byte[] boxed_arr = getBoxedArray(arr);
    Long[] boxed_res = getBoxedArray(res);
    Long[] boxed_ref = getBoxedArray(ref);

    convert.<Byte,Long>convert_scalar_expanding(
        boxed_arr, boxed_ref, ByteVector.SPECIES_128.length(), LongVector.SPECIES_256.length() ,0 ,0,part);

    convert.<Long>compareResults(boxed_ref, boxed_res);
  }

  public static void workload_convert_expand_shape(byte[] arr, long[] res,
                                                   int part) {
    long[] ref = new long[res.length];
    ByteVector BV = ByteVector.fromArray(ByteVector.SPECIES_128, arr, 0);

    Vector<Long> LV =
        BV.convertShape(VectorOperators.B2L, LongVector.SPECIES_512, part);
    ((LongVector)(LV)).intoArray(res, 0);

    Byte[] boxed_arr = getBoxedArray(arr);
    Long[] boxed_res = getBoxedArray(res);
    Long[] boxed_ref = getBoxedArray(ref);

    convert.<Byte, Long>convert_scalar_expanding(
        boxed_arr, boxed_ref, ByteVector.SPECIES_128.length(), LongVector.SPECIES_512.length() ,0 ,0,part);

    convert.<Long>compareResults(boxed_ref, boxed_res);
  }

  public static void workload_cast_extend_shape(byte[] arr, long[] res,
                                                int part) {
    long[] ref = new long[res.length];
    ByteVector BV = ByteVector.fromArray(ByteVector.SPECIES_128, arr, 0);

    Vector<Long> LV = BV.castShape(LongVector.SPECIES_512, part);
    ((LongVector)(LV)).intoArray(res, 0);

    Byte[] boxed_arr = getBoxedArray(arr);
    Long[] boxed_res = getBoxedArray(res);
    Long[] boxed_ref = getBoxedArray(ref);

    convert.<Byte,Long>convert_scalar_expanding(
        boxed_arr, boxed_ref, ByteVector.SPECIES_128.length(), LongVector.SPECIES_512.length() ,0 ,0,part);

    convert.<Long>compareResults(boxed_ref, boxed_res);
  }

  public static void workload_cast_shape(long[] arr, byte[] res, int part) {
    byte[] ref = new byte[res.length];
    LongVector LV = LongVector.fromArray(LongVector.SPECIES_128, arr, 0);

    Vector<Byte> BV = LV.castShape(ByteVector.SPECIES_256, part);
    ((ByteVector)(BV)).intoArray(res, 0);

    var boxed_res = getBoxedArray(res);
    var boxed_ref = getBoxedArray(ref);
    var boxed_arr = getBoxedArray(arr);

    convert.<Long,Byte>convert_scalar_compacting(
        boxed_arr, boxed_ref, LongVector.SPECIES_128.length(), ByteVector.SPECIES_256.length() ,0 ,0,part);

    convert.<Byte>compareResults(boxed_ref, boxed_res);
  }

  public static void main(String[] args) {
    assert false;
    long[] arr = new long[8];
    byte[] res = new byte[32];
    for (int i = 0; i < arr.length; i++)
      arr[i] = i + 1;

    // Warmup
    for (int i = 0; i < 1; i++)
      workload_cast_shape(arr, res, -1);

    for (var elem : res) {
      System.out.println(elem + " ");
    }
  }
}
