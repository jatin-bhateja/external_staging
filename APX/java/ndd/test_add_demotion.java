

public class test_add_demotion {
    //public static int micro(int a, int b, int c, int d, int e, int f, int g, int h, int i, int j , int k, int l, int m, int n, int o, int p) {
    //  return  a + b + c + 100L + d + e + f + 100L + g + h + i + j + k + l + m + n + o + p;
    //}

    public static int micro(int a, int b, int c, int [] arr) {
      return  a + b + c + arr[0];
    }

    public static void main(String [] args) {
      int res = 0;
      int [] arr = {103};
      for (int i = 0; i < 100000; i++) {
         //res += micro(i, i + 100, i + 200, i + 300, i + 400, i + 500, i + 600, i + 700, i + 800, i + 900, i + 1000, i + 1100, i + 1200, i + 1300, i + 1400,i + 1500);
         res += micro(i, i + 100, i + 200, arr);
      }
      System.out.println("[res] "  + res);
    }
}
