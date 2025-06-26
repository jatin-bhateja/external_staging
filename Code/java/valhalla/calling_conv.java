

value class MyBox {
  public long f1;
  public long f2;
  public long f3;
  public long f4;

  public MyBox(long val) {
    this.f1 = val + 10;
    this.f2 = val + 20;
    this.f3 = val + 30;
    this.f4 = val + 40;
  }
}

public class calling_conv {
   public static long micro(MyBox obj) {
      return obj.f1 + obj.f2 + obj.f3 + obj.f4;
   }
   public static void main(String [] args) {
      long res = 0;
      for (int i = 0; i < 100000; i++) {
          res += micro(new MyBox(i)); 
      }
      System.out.println("[res] " + res);
   }
}
