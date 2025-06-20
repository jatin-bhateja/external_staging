
class MyClass {
  int f1;
  int f2;
  int f3;
  int f6;
  int f7;
  int f8;
  int f9;
  char f4;
  byte f5;
}


public class test {
  public static MyClass obj = null;

  public static int micro(int val) {
     obj = new MyClass();
     obj.f1 = val;
     return obj.f1 + obj.f2;
  }

  public static void main(String [] args) {
     int res = 0;
     for (int i = 0;i < 10000; i++) {
        res += micro(20);
     }
     System.out.println(res);
  }

}

