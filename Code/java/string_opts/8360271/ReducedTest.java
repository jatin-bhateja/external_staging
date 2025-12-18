
public class ReducedTest {
    public static int micro(String haystack, String needle, int ctr) {
        int res = 0;
        //int i   = 70;
        int i   = 20;
        //for (int i = 0; i < haystack.length() - needle.length(); i++) {
        res += haystack.indexOf(needle, i);
        if (ctr == 20000 || ctr == 0) {
            IO.println(" [spos]  " + i + " [ctr] " + ctr + " [res] " + res);
        }
        //}
        return res;
    }

  public static void main(String [] args) {
     int res = 0;
     //String haystack = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaddddddddddddddd";
     String haystack = "aaaaaaaaaaaaaaaaaaaaaaddddddddddddddd";
     String needle = "ad";

     for (int i = 0; i < 1000000000; i++) {
         res += micro(haystack, needle, i);
     }

     long t1 = System.currentTimeMillis();
     for (int i = 0; i < 1000000000; i++) {
         res += micro(haystack, needle, i);
     }
     long t2 = System.currentTimeMillis();
     IO.println("[tes] " + (t2-t1) + "ms  [res] " + res);
  }
}

