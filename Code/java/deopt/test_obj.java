
class ABC {
   public int field;
   public ABC(int val) {
      field = val;
   }
}
class XYZ {
   public int field;
   public XYZ(int val) {
      field = val;
   }
}

public class test_obj {
   public static int micro(int ctr) {
       ABC obj1 = new ABC(ctr);
       XYZ obj2 = new XYZ(ctr);
       if (ctr == 10000) {
          throw new AssertionError("micro" + obj1.field + " " + obj2.field);
       }
       return obj1.field + obj2.field;
   }
   public static void main (String [] args) {
      int res = 0; 
      for (int i = 0; i < 1000000; i++) {
          res += micro(i);
      }
      System.out.println("[res] " + res); 
   }
}
