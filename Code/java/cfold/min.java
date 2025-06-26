

public class min {
   public static int micro(int [] arr) {
      int res = 0;
      for (int i = 0; i < arr.length; i++) {
         res +=  Math.min(arr[i], 0) > 0 ? 1 : 0;
      }
      return res;
   }
   public static void main(String [] args) {
       java.util.Random r = new java.util.Random(10);
       int [] arr = new int[1024];
       for (int i = 0; i < 1024; i++) {
          arr[i] = r.nextInt();
       }
       int res = 0;
       for (int i = 0; i < 1024; i++) {
          res +=  micro(arr);
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 1024; i++) {
          res +=  micro(arr);
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2-t1) + " ms     [res] " + res);
   }
}
