
class Base {
  public String getMessage() { return "Base"; }
}

class Derived1 extends Base {
  public String getMessage() { return "Derived1"; }
}

class Derived2 extends Base {
  public String getMessage() { return "Derived2"; }
}

class Derived3 extends Base {
  public String getMessage() { return "Derived3"; }
}

public class test {
   //public static Object [] arr = { Integer.valueOf(10), Float.valueOf(20.0f), Double.valueOf(30.0), Long.valueOf(40L) };
   public static Base [] arr = { new Derived1(), new Derived2(), new Derived3()};

   public static String micro(Base obj) {
      return obj.getMessage();
   }

   public static void main(String [] args) {
      int mask = Integer.parseInt(args[0]);
      int length = 0;
      for (int ctr = 0; ctr < 500000; ctr++) {
            length += micro(arr[ctr % mask]).length();
      }
      long t1 = System.currentTimeMillis();
      for (int ctr = 0; ctr < 500000; ctr++) {
            length += micro(arr[ctr % mask]).length();
      }
      long t2 = System.currentTimeMillis();
      System.out.println("[time] " + (t2-t1) + " ms   [res] " + length);
   }
}
