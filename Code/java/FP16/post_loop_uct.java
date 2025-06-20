

public class post_loop_uct {
   public static int [] arr; 

   public static int micro(int ctr) {
      for (int i = 0; i < arr.length; i++) {
          arr[i] *= 2;
      }
      return arr[ctr];
   }

   public static void main(String [] args) {
      int size = Integer.parseInt(args[0]);
      int res = 0;
      arr = new int[size];
      for (int i = 0; i < 100000; i++) {
          res += micro(i % size);
      }
      System.out.println("[res] " + res);
   }

}
