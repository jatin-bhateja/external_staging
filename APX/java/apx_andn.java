public class apx_andn {
    public static int micro(int [] src1, int src2) {
       return ~src1[0] & src2;
    }
    public static void main(String [] args) {
       int res = 0;
       int [] src1 = {1};
       for (int i = 0; i < 100000; i++) {
           res += micro(src1 , i+10);
       }
       System.out.println("[res] " + res);
    }
}
