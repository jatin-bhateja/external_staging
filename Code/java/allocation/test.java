
class Point {
   int x;
   int y;
   public Point(int x, int y) {
       this.x = x;
       this.y = y;
   }
   public int getDist() {
       return x + y;
   }
}


public class test {
   public static Point p = null;

   public static int micro(int val) {
       p = new Point(val, val + 10);
       return p.hashCode();
   }

   public static void main(String [] args) {
       long res = 0;
       for (int i = 0; i < 1000000000; i++) {
           res += micro(i);
       }
       IO.println("[res] "  + res);
   }
}

