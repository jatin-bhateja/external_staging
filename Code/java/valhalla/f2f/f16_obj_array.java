
import java.util.stream.IntStream;
import java.util.Arrays;

public class f16_obj_array {

   public static void micro (Float16 [] res, Float16 [] src1, Float16 [] src2) {
       for (int i = 0; i < res.length; i++) {
           res[i] = Float16.sum(src1[i], src2[i]);
       }
   }

   public static void main(String [] args) {
       Float16 [] res = new Float16[1024];
       Float16 [] src1 = new Float16[1024];
       Float16 [] src2 = new Float16[1024];
       for (int i = 0; i < src1.length; i++) {
           src1[i] = Float16.valueOf((short)i);
           src2[i] = Float16.valueOf((short)i);
           res[i] = Float16.valueOf((short)0);
       }
       for (int i = 0; i < 100000; i++) {
           micro(res, src1, src2);
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 100000; i++) {
           micro(res, src1, src2);
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
   }
}
