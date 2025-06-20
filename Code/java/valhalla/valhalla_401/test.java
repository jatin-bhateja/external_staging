
value class MyValue42 {
   int x;

   MyValue42(int x) {
       this.x = x;
       call();
       super();
   }
   static Object make(int x) {
       return new MyValue42(x);
   }
}

public class test {
    public static int rI = 100;

    public static test43(int x) {
        return (MyValue42) MyValue42.make(x);
    }

    public static void main (String [] args) {
        MyValue42 v = test43(rI);
        System.out.println(v);
    }
}
