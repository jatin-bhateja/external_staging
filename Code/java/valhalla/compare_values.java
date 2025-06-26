
values class MyValue {
  int f0;
  int f1;
  int f2;
  int f3;
  MyValue (int init1, int init2, int init3, int init4) {
     this.f0 = init1;
     this.f1 = init2;
     this.f2 = init3;
     this.f3 = init4;
  }
}


public class compare_values {
  public static void micro() {
     MyValue m1 = new MyValue(10, 20, 30, 40);
     MyValue m2 = new MyValue(10, 20, 30, 40);
     MyValue m3 = new MyValue(10, 20, 31, 40);
     System.out.print((m1 == m2) + "\n");
     System.out.print((m1 == m3) + "\n");
  }

  public static void main(String [] args) {
     micro();
     micro();
  }
}
