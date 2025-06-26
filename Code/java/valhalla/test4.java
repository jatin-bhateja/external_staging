
//class Point {
primitive class Point {  // For vectors saving on Boxing-Unboxing allocation which is anyways
                         // optimized currently.
                         // vector payload still on heap.  
                         // 
  int [] vec;
  Point(int x, int y) {
    vec = new int[8]; // Heap allocation.
  }
}

public class test4 {
   // Inline VEP : 
   //  Flatten/scalarize object into registers
   // Verified Entry:
   //  Expects unboxed arguments.
   public static Point doSum(Point val) {
       Point p = new Point(10+val.vec[0],10+val.vec[2]);
       return p;
   }

   public static Point micro(Point p) {
      for(int i = 0 ; i < 800000000; i++) {
          //Savings on allocations needed for boxing.
          //Scalarize the fields and pass arguments though 
          //Registers or stack allocated in caller frame.
          p = doSum(p);
      }
      return p;
   }
 
   public static void main(String [] args) {
      Point p = new Point(20,20);
      long t1 = System.currentTimeMillis();
      p = micro(p);
      long t2 = System.currentTimeMillis();
      System.out.println("[Time] " + (t2-t1) +  "ms ");
   }
}
