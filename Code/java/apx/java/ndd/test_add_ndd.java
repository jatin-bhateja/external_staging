

public class test_add_ndd {
   public static int micro(int [] src1, int src2, int idx) {
       return src2 + src1[idx] + 1000;
   }

   public static void main(String [] args) {
       int res = 0;
       int [] src1 = java.util.stream.IntStream.range(0, 4096).toArray();
       for (int i = 0; i < 100000; i++) {
           res += micro(src1, 10, i & 4095);
       }
       System.out.println("[res] " + res);
   }
}
