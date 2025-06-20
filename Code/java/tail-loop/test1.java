

import java.util.Arrays;
import java.util.Random;

public class test1 {
   public static void micro (int [] dst, int [] src1, int [] src2) {
       for (int i = 0; i < dst.length; i++) {
           dst[i] = src1[i] * src2[i];
       }
   }
   public static void main(String [] args) {
       Random r = new Random(1024);
       int [] dst = new int[Integer.parseInt(args[0])];
       int [] src1 = new int[Integer.parseInt(args[0])];
       int [] src2 = new int[Integer.parseInt(args[0])];
       for (int i = 0; i < src1.length; i++) {
          src1[i] = r.nextInt();
          src2[i] = r.nextInt();
       }
       for (int i = 0; i < 100000; i++) {
           micro(dst, src1, src2);
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 100000; i++) {
           micro(dst, src1, src2);
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2-t1) + " ms  [res] " +  Arrays.stream(dst).sum());
   }
}
