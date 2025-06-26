
public class test {
   public static int recurse_levels(int start, int end) {
       if (end <= start) {
          return 5;
       }

       if (start == (end - 1)) {
           return 10;
       }

       int mid = (start + end) / 2;
       int res_left  = recurse_levels(start, mid - 1);
       int res_right = recurse_levels(mid, end);
       return res_left + res_right;
   }

   public static void main(String [] args) {
      int res = 0;
      int end = Integer.parseInt(args[0]);
      for (int i = 0; i < 100000; i++) {
         res += recurse_levels(0, end); 
      }
      System.out.println("[res] " + res);
   }
}
