
primitive class FixedPoint {
  private int x;
  private int y;
  FixedPoint(int x, int y) {
     this.x = x;
     this.y = y;
  }
  int getX() { return x;}
  int getY() { return y;}
}

value class Line {
  public final FixedPoint p1;
  public final FixedPoint p2;
  public Line(int x, int y) {
     this.p1 = new FixedPoint(x, y); 
     this.p2 = new FixedPoint(x + 10, y + 10);
  }
  public int lengthX() { return p2.getX() - p1.getX();}
  public int lengthY() { return p2.getY() - p1.getY();}
  public Line add(Line obj) {
     return new Line(this.lengthX() + obj.lengthX(), this.lengthY() + obj.lengthY());  
  }
}

public class test1 {
   public static Line doSum(Line val) {
      return val.add(val);
   }

   public static Line micro(Line val, int count) {
      for(int i = 0 ; i < count; i++) {
         val = doSum(val);
      }
      return val;
   }
 
   public static void main(String [] args) {
      Line val = new Line(1, 1);
      for(int i = 0 ; i < 10000; i++) {
         val = micro(val, 10000);
      }
      long t1 = System.currentTimeMillis();
      for(int i = 0 ; i < 10000; i++) {
         val = micro(val, 10000);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[Time] " + (t2-t1) +  " ms [Res] x = " + val.lengthX()  + " y = " + val.lengthY());
   }
}
