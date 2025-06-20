
value class FixedPoint {
  int x;
  int y;
  FixedPoint(int x, int y) {
     this.x = x;
     this.y = y;
  }
  FixedPoint add(FixedPoint p) {
     return new FixedPoint(p.x + x, p.y + y);
  }
  int value() {
     return x + 10 * y;
  }
}

public class point {
   public static int micro(int cox, int coy) {
      FixedPoint p1 = new FixedPoint(cox, coy);
      FixedPoint p2 = new FixedPoint(cox + 10, coy + 10);
      return p1.add(p2).value();
   }
 
   public static void main(String [] args) {
      int res = 0;
      for(int i = 0 ; i < 10000; i++) {
         res += micro(i, i);
      }
      long t1 = System.currentTimeMillis();
      for(int i = 0 ; i < 10000; i++) {
         res +=  micro(i, i);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[Time] " + (t2-t1) +  " ms [Res] " + res);
   }
}
