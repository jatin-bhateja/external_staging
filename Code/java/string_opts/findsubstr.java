

public class findsubstr {
   public static int micro(String haystack, String needle) {
      return haystack.indexOf(needle);
   }

   public static void main(String [] args) {
      String haystack = "11110000111100001111000011110000" +
                        "11110000111100001111000011110000" +
                        "11110000111100001111000011110000" +
                        "11111000111100001111000011110000";
      String needle =  "11111"; 
      int res = 0;
      for (int i = 0; i < 1000000; i++) {
          res += micro(haystack, needle);
      }
      long t1 = System.currentTimeMillis();
      for (int i = 0; i < 1000000; i++) {
          res += micro(haystack, needle);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
   }
}
