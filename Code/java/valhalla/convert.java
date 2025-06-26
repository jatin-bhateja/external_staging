
import jdk.incubator.vector.*;
import java.util.stream.*;

class convert {
  public static <E> E zeroValue(E to) { 
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
  }

  public static <E, F> F convertValue(E from , F to) { 
     if (to.getClass().equals(Byte.class)) 
       return Byte.valueOf(from.byteValue());
     if (to.getClass().equals(Short.class))
       return Short.valueOf(from.shortValue());
     else if (to.getClass().equals(Integer.class)) 
       return Integer.valueOf(from.intValue());
     else if (to.getClass().equals(Long.class)) 
       return Long.valueOf(from.longValue());
     else if (to.getClass().equals(Float.class)) 
       return Float.valueOf(from.floatValue());
     else if (to.getClass().equals(Double.class)) 
       return Double.valueOf(from.doubleValue());
  }

  public static <E , F> void convert_scalar_expanding(E [] inp, F [] out, int part) {
      int SLICE_FACTOR = inp.length / out.length;
      assert ( part < SLICE_FACTOR && part >= 0);
      int start_idx = part*out.length;
      for (int i = 0 ; i < out.length; i++)
        out[i] = convert.<E,F>convertValue(inp[i+start_idx], out[i]);
  }

  public static <E , F > void convert_scalar_compacting(E [] inp, F [] out, int part) {
      int SLICE_FACTOR = out.length / inp.length;
      assert ( part > -SLICE_FACTOR && part <= 0);
      int start_idx = -part*inp.length;
      for (int i = 0 ; i < out.length ; i++)
        out[i] = zeroValue(out[i]);
      for (int i = 0 ; i < inp.length; i++)
        out[i+start_idx] = convert.<E,F>convertValue(inp[i], out[i+start_idx]);
  }

  public static <E> void compareResults(E [] ref, E [] res) {
     assert(res.length == ref.length);
     for(int i = 0 ; i < ref.length ; i++)
        assert(res[i] == ref[i]);
  }

  public static Byte [] getBoxedByteArray(byte [] arr) {
     Byte [] boxed_arr = new Byte[arr.length];
     for(int i = 0 ; i < arr.length ; i++)
       boxed_arr[i] = Byte.valueOf(arr[i]);
     return boxed_arr;   
  }

  public static void workload(long [] arr, byte [] res, int j) {
     byte [] ref = new byte[res.length];
     LongVector LV = LongVector.fromArray(LongVector.SPECIES_256, arr, 0);

     Vector<Byte> BV = LV.convert(VectorOperators.L2B, 0);
     ((ByteVector)(BV)).intoArray(res,0);

     Byte [] boxed_res = getBoxedByteArray(res);
     Long [] boxed_arr = LongStream.of(arr).boxed().toArray(Long[]::new);
     Byte [] boxed_ref = getBoxedByteArray(ref);
     convert.<Long, Byte>convert_scalar_compacting(boxed_arr,boxed_ref,0); 
     convert.<Byte>compareResults(boxed_ref, boxed_res);
  }

  public static void main(String [] args) {
     long [] arr = new long[4];
     byte [] res = new byte[32];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = i+1;

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       workload(arr, res, i);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       workload(arr, res, i);

     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);

     for (var elem : res) {
       System.out.println(elem + " ");
     }
  }
}

