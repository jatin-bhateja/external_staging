
value class value_cls {
   public static int field1 = 20;
   public int field2;
   private final int field4;
   public static final int field3 = 10;
   value_cls(int val) {
      field2 = val;
      field4 = val;
   }
}

public class myvalue {
  public static void main(String [] args) {
    value_cls obj = new value_cls(10);
    System.out.println(obj);
  }
}
