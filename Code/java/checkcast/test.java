
public class test {
   public static Object genTest() {
      return new test();
   }
   public static test micro() {
      return genTest(); // implicit checkcast
   } 
   public static void main(String [] args) {
      System.out.println(micro());
   }
}
