
value class Point {
   static int field1;
   static int field2;
   public int field3;
   public Point() {
      field3 = 10;
   }
   public Point(int val) {
      field3 = val;
   }
}

public class staticValues {
   public static void main(String [] args) {
     Point obj = new Point();
     Point obj1 = new Point(obj.field3);
     Point.field1 = 10; 
     Point.field2 = 20; 
   }
} 
