class MyClass {
    int field;
    MyClass(int field) {
       this.field = field;
    }
    int multAndGet(int val) {
       return val * field;
    }
    public String toString() {
       return "field := " + field;
    }
}

class MyClassWrapper {
    MyClass field = null;
    MyClassWrapper(MyClass field) {
       this.field = field;
    }
    int multAndGet(int val) {
       return field.multAndGet(val);
    }
    public String toString() {
       return "MyClass [ " + field + " ] ";
    }
}

public class test {
   public static int micro(int dummy1, int dummy2, int dummy3, int dummy4, int dummy5, int dummy6, MyClass ctr) {
      MyClassWrapper obj = new MyClassWrapper(ctr);
      if (ctr.field > 50000) {
         // Usage of obj.field with UCT.
         // With EA field value will be forwarded making allocations redundant.
         throw new RuntimeException("Deoptimizing : " + obj);
      } 
      return obj.multAndGet(10);
   }

   public static void main(String [] args) {
      int res = 0;
      for (int i = 0; i < 100000; i++) {
          res += micro(1, 2, 3, 4, 5, 6, new MyClass(i));
      }
      System.out.println("[res] " + res);
   }
}
