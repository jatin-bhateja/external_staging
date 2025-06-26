
class Point {
//primitive class Point {
  int x; 
  int y;
  int [] arr;
  Point(int x, int y) {
     this.x = x; 
     this.y = y;
     this.arr = new int[2];
     this.arr[0] = x;
     this.arr[1] = y;
    
  }
}

public class test {
   public static int doSum(int val) {
       int res = 0;
       int [] arr = new arr[64];
       for(int i = 0; i < arr.length; i++) {
          res += arr[i];
       }
       return res;
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
