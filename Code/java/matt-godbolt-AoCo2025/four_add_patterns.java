
public class four_add_patterns {
    static int add_v1(int x, int y) {
      return x + y;
    }
    
    static int add_v2(int x, int y) {
      x += y;
      return x;
    }
    
    static int add_v3(int x, int y) {
      while (x-- >= 0) ++y;
      return y;
    }
    
    static int add_v4(int x, int y) {
      if (y == 0) return x;  // x + 0 = x
      // x + y == (x + 1) + (y - 1)
      return add_v4(x + 1, y - 1);
    }
    
    static int micro(int x, int y) {
        return add_v1(x, y) + add_v2(x, y); //+ add_v3(x, y) + add_v4(x, y);
    }

    public static void main(String [] argv) {
        int x = Integer.parseInt(argv[0]);
        int y = Integer.parseInt(argv[1]);
         
        int res = 0;
        for (int i = 0; i < 10000; i++) {
           res += micro(x, y);
        }
        IO.println("[res] " + res);
    }
}
