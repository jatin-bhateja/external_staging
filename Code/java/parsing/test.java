public class test {
   public static int micro(int [] arr, int cond, int idx) {
      if (cond > 1000) {
         arr[idx] = 10000;
      } else {
         arr[idx] = 20000;
      }
      return arr[idx];
   }
   public static void main(String [] args) {
      System.out.println(micro(new int[128], 4345, 32));
   }
}
