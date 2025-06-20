
import java.util.Arrays;

public class slp_align_micro  {
   public static void micro(int [] res, int [] src1, int [] src2) {
       for (int i = 0; i < res.length - 1; i++) {
           res[i] = src1[i] + src2[i]; 
       }
   }

   public static void main(String [] args) {
       int [] res = new int[9024];
       int [] src1 = java.util.stream.IntStream.range(0, 9024).toArray();
       int [] src2 = java.util.stream.IntStream.range(0, 9024).toArray();

       for (int i = 0; i < 10000; i++) {
           micro(res, src1, src2);
       }

       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 10000; i++) {
           micro(res, src1, src2);
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2-t1) + " ms [res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
   }
}
