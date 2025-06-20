
import jdk.incubator.vector.*;

public class test {
   public static final VectorSpecies<Float> SPECIES = FloatVector.SPECIES_64;

   public static void micro1(float [] res, float [] src1, float [] src2) {
       for (int i = 0; i < res.length -1 ; i ++) {
           FloatVector.fromArray(SPECIES, src1, i)
                      .lanewise(VectorOperators.MAX, FloatVector.fromArray(SPECIES, src2, i))
                      .intoArray(res, i);
       }
   }
   
   public static void micro2(float [] res, float[] src1, float[] src2) {
       res[0] = Math.max(src1[0], src2[0]);
   }

   public static float micro3(float[] src) {
       float res = Float.MIN_VALUE;
       for (int i = 0; i < src.length; i++) {
           res = Math.max(res, src[i]);
       }
       return res;
   }

   public static void main(String [] args) {
       float [] src1 = new float[1024];
       java.util.stream.IntStream.range(0, src1.length).forEach( i -> { src1[i] = 10.3f; });
       float [] src2 = new float[1024];
       java.util.stream.IntStream.range(0, src2.length).forEach( i -> { src2[i] = 10.3f; });
       float [] res  = new float[1024];
       float scalar_res = 0.0f;

       for (int i = 0; i < 1000000; i++) {
           micro1(res, src1, src2);
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 1000000; i++) {
           micro1(res, src1, src2); 
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time vector micro1] " + (t2-t1) + " ms ");

       for (int i = 0; i < 1000000; i++) {
           //micro2(res, src1, src2); 
           scalar_res += micro3(src1); 
       }
       t1 = System.currentTimeMillis();
       for (int i = 0; i < 1000000; i++) {
           //micro2(res, src1, src2); 
           scalar_res += micro3(src1); 
       }
       t2 = System.currentTimeMillis();
       System.out.println("[time scalar micro2] " + (t2-t1) + " ms ");
   }
}
