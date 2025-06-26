
class t {
   public static void main(String [] args) {
      long val = Long.parseLong(args[0]);
      val = val & 0xFFL;
      System.out.println(val);
   }
}
