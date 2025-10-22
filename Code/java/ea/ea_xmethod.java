
class MyClass {
   public long f1;
   public long f2;
   public long f3;
   public long f4;

   public MyClass(long f1, long f2, long f3, long f4) {
       this.f1 = f1;
       this.f2 = f2;
       this.f3 = f3;
       this.f4 = f4;
   }

   public long accum() {
       return f1 + f2 + f3 + f4;
   }
}

public class ea_xmethod {
    public static long counter = 0;

    public static long caller(long f1, long f2, long f3, long f4) {
        MyClass obj = new MyClass(f1, f2, f3, f4);
        obj = callee(obj);
        return obj.accum();
    }

    public static MyClass callee(MyClass param) {
        synchronized(param) {
            counter++;  
        }
        return param;
    }
  
    public static void main(String [] args) {
        long res = 0;
        for (long i = 0; i < 100000000000L; i++) {
            res += caller(i, i + 1, i + 2, i + 3); 
        }
        IO.println("[res] " + res);
    }
}
