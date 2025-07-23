
public class test_compress {

   public static int micro(int src, int mask) {
       src = Math.max(0, Math.min(5, src));
       int cond = Integer.compress(src, mask);
       if (cond < 0) {
           throw new AssertionError("Unexpected control path");
       }
       return cond;
   }

   public static void main(String [] args) {
       int res = 0;
       for (int i = Integer.MIN_VALUE; i < Integer.MAX_VALUE; i++) {
           res = micro(i, i);
       }
       long t1 = System.currentTimeMillis();
       for (int i = Integer.MIN_VALUE; i < Integer.MAX_VALUE; i++) {
           res = micro(i, i);
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time]  " + (t2-t1) + " ms [res] " + res);
   }
}
