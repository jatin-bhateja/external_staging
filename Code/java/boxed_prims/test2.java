
class MyType {
  public int field1;
  public int field2;

  public MyType(int a, int b) {
    field1 = a;
    field2 = b;
  }

  public MyType add(MyType o) {
    MyType r = new MyType(0,0);
    r.field1 = this.field1 + o.field1;
    r.field2 = this.field2 + o.field2;
    return r;
  }

  public String toString() {
    return Integer.toString(field2, 0) + ":" + Integer.toString(field1, 0);
  }
}

class test2 {
   public static MyType workload(MyType f1, MyType f2) {
     return f1.add(f2);
   }
   public static void main(String [] args) {
     MyType s1 = new MyType(4, 5);
     MyType s2 = new MyType(5, 6);
     MyType s3 = new MyType(0, 0);
     System.out.println("s1  =  " + s1.field1 + ":" + s1.field2);
     System.out.println("s2  =  " + s2.field1 + ":" + s2.field2);
     for(int i = 0 ; i < 100000 ; i++)
       s3 = s3.add(workload(s1,s2));
     System.out.println("Res = " + s3);
  }
}
