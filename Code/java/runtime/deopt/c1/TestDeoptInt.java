
public class TestDeoptInt {

    static class A {
        volatile int vl;
        A(int v) {
            vl = v;
        }
    }

    static void m(int b) {
        A a = new A(10);
        int c;
        c = b + a.vl; //accessing volatile field of class not loaded at compile time forces a deopt
        if(c != 20) {
            System.out.println("a (= " + a.vl + ") + b (= " + b + ") = c (= " + c + ") != 20");
            throw new InternalError();
        }
    }

    public static void main(String[] args) {
        m(10);
    }

}
