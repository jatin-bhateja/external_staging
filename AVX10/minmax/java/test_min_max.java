import java.util.stream.IntStream;
import jdk.incubator.vector.*;

public class test_min_max {

   public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_PREFERRED;

   public static float micro1(float [] src) {
     float res1 = Float.NEGATIVE_INFINITY;
     float res2 = Float.NEGATIVE_INFINITY;
     for (int i = 0; i < src.length; i++) {
        res1 = Math.max(res1, src[i]);
        res2 = Math.max(res2, src[i]);
     }
     return res2 + res2;
   }
   
   public static float micro2(float [] src) {
     float res1 = Float.POSITIVE_INFINITY;
     float res2 = Float.POSITIVE_INFINITY;
     for (int i = 0; i < src.length; i++) {
        res1 = Math.min(res1, src[i]);
        res2 = Math.min(res2, src[i]);
     }
     return res2 + res2;
   }

   public static float micro3(float [] src) {
     float res = Float.POSITIVE_INFINITY;
     for (int i = 0; i < FSP.loopBound(src.length); i += FSP.length()) {
        res = Math.min(res, FloatVector.fromArray(FSP, src, i)
                              .reduceLanes(VectorOperators.MIN));
     }
     return res;
   }

   public static float micro4(float [] src) {
     float res = Float.NEGATIVE_INFINITY;
     for (int i = 0; i < FSP.loopBound(src.length); i += FSP.length()) {
        res = Math.max(res, FloatVector.fromArray(FSP, src, i)
                              .reduceLanes(VectorOperators.MAX));
     }
     return res;
   }

   public static VectorMask<Float> MASK = VectorMask.fromLong(FSP, 0xAAAAAAAA);

   public static float micro5(float [] src) {
     float res = Float.POSITIVE_INFINITY;
     for (int i = 0; i < FSP.loopBound(src.length); i += FSP.length()) {
        res = Math.min(res, FloatVector.fromArray(FSP, src, i)
                              .reduceLanes(VectorOperators.MIN, MASK));
     }
     return res;
   }

   public static float micro6(float [] src) {
     float res = Float.NEGATIVE_INFINITY;
     for (int i = 0; i < FSP.loopBound(src.length); i += FSP.length()) {
        res = Math.max(res, FloatVector.fromArray(FSP, src, i)
                              .reduceLanes(VectorOperators.MAX, MASK));
     }
     return res;
   }

   public static void main(String [] args) {
      float res = 0.0f;
      float [] src = new float[1024];
      IntStream.range(0, 1024).forEach(
         i ->  { src[i] = (float)i; }
      ); 

      for (int i = 0; i < 10000; i++) {
         res += micro6(src);
      }
      long t1 = System.currentTimeMillis();
      for (int i = 0; i < 10000; i++) {
         res += micro6(src);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[time] " + (t2-t1) + " ms [res] " + res);
   }
}
