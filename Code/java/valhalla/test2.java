
class Point {
//primitive class Point {
  int x; 
  int y;
  int z;
  int a;
  int b;
  int c;
  int d;
  int e;
  int f;
  int g;
  int i;
  int j;
  int k;
  int l;
  int m;
  int n;
  Point(int x, int y) {
     this.x = x; 
     this.y = y;
     this.z = 10;
     this.a = 10;
     this.b = 10;
     this.c = 10;
     this.d = 10;
     this.e = 10;
     this.f = 10;
     this.g = 10;
     this.i = 10;
     this.j = 10;
     this.k = 10;
     this.l = 10;
     this.m = 10;
     this.n = 10;
  }
}

public class test2 {
   public static Point doSum(Point val) {
       Point p = new Point(10+val.x,10+val.y);
       return p;
   }

   public static Point micro(Point p) {
      for(int i = 0 ; i < 800000000; i++) {
          p = doSum(p);
      }
      return p;
   }
 
   public static void main(String [] args) {
      Point p = new Point(20,20);
      for(int i = 0 ; i < 100000; i++) {
          p = doSum(p);
      }
      long t1 = System.currentTimeMillis();
      p = micro(p);
      long t2 = System.currentTimeMillis();
      System.out.println("[Time] " + (t2-t1) +  "ms [Res] x = " + p.x  + " y = " + p.y);
   }
}
