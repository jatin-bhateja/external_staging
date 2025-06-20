
interface I {
    private int foo(int val) { return val + 10; }
    default int bar(int val) { return foo(val); }
}

class I_class implements I {
    public int xyz() { return 1000; } 
}

public class test extends I_class {
   public int micro(I_class obj, int ctr) {
       int res = obj.bar(ctr);
       if (ctr == 500000) {
           throw new AssertionError("Blah-blah");
       }
       return res;
   }

   public static void main(String [] args) {
       int res = 0;
       test inst1 = new test();
       I_class inst2 = new I_class();
       for (int i = 0; i < 10000000; i++) {
           res += inst1.micro(inst2, i);
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 10000000; i++) {
           res += inst1.micro(inst2, i);
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2-t1) + " ms [res] " + res);
   }
}
