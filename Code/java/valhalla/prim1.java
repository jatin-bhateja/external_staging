
primitive class Point {
//class Point {
  int x; 
  Point(int x) {
     this.x = x; 
  }
  int getX() { return x;}
}

public class prim1 {
   public static int doSum(Point[] val) {
      int res = 0;
      for(int i = 0; i < val.length; i++) {
         res += val[i].getX();
      }
      return res;
   }

   public static void main(String [] args) {
      Point [] p = new Point[4096];
      for(int i = 0; i < p.length; i++) {
          p[i] = new Point(i);
      }
      int res = 0;
      for(int i = 0 ; i < 10000; i++) {
          res = doSum(p);
      }
      res = 0;
      long t1 = System.currentTimeMillis();
      for(int i = 0 ; i < 10000; i++) {
          res = doSum(p);
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[Time] " + (t2-t1) +  "ms  [Res] " + res);
   }
}
