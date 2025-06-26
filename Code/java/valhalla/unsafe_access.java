
import jdk.internal.misc.Unsafe;

value abstract class PointAbs {
  public abstract int reduce();  
}

value class Point extends PointAbs {
   public int f1;
   public int f2;

   public Point() {
      this.f1 = 0;
      this.f2 = 0;
   }
   public Point(int f1, int f2) {
      this.f1 = f1;
      this.f2 = f2;
   }
   public int reduce() {
      return f1 + f2;
   }
}

value class Point2 extends PointAbs {
   public int f1;
   public int f2;

   public Point2() {
      this.f1 = 0;
      this.f2 = 0;
   }
   public Point2(int f1, int f2) {
      this.f1 = f1;
      this.f2 = f2;
   }
   public int reduce() {
      return f1 + f2;
   }
}

public class  unsafe_access {
   public static final Unsafe UNSAFE = Unsafe.getUnsafe();
   public static int last_hash = 0;

   public static void main(String [] args) {
       long res = 0;
       // Point2 obj  = new Point2(10,20);

       try {
           for (int i = 0; i < 100000; i++) {
               Point p = new Point(i, i + 10);
               res += micro(p, i).reduce();
           }
           System.out.println(res);
       } catch (Exception e) {
           System.out.println(obj.hashCode());
       }
   }

   public static PointAbs micro(PointAbs p, int val) throws Exception {
       // C2 uses CHA to associate most approproite type with a refernece.
       // If an abstract class (not-exact) has only one sub-class then 
       // C2 create an TypeInst for sub-class, if UseUniqueSubclasses
       // is set. If we uncomment above Point2 instance allocation
       // then both the subclasses of PointAbs i.e. Point1 and Point2
       // are loaded hence compile cannot assign a concrete type to reference p.
       if (val > 50000) {
           p = UNSAFE.makePrivateBuffer(p);
           UNSAFE.putInt(p, UNSAFE.objectFieldOffset(Point.class.getDeclaredField("f1")), val + 10);
       }
       last_hash = p.hashCode(); 
       if (val > 50000) {
           p = UNSAFE.finishPrivateBuffer(p);
       }
       return p;
   }
}
