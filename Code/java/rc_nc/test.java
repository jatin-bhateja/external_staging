import java.util.Arrays;

public class test {
   public static void micro(int [] a) {
       for (int i = 0; i < arr.length; i++) {
           a[i] = 10;
       }
   }

   public static void main(String [] args) {
       int [] a = IntStream.range(0, 2048).toArray();
       for (int i = 0; i < 100000; i++) {
           micro(a);
       }
       System.out.println("[res] " + Arrays.hashCode(a));
   }
}
