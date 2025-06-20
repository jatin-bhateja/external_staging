
import java.util.Arrays;

class ABC {
    public int field1;
    public int field2;

    ABC (int init) {
        this.field1 = init;
        this.field2 = init + 10;
    }
    int getAccum() { return this.field1 + this.field2; }
}

public class test {
    public static int micro(int [] arr, int ctr) {
        int hash = 0;
        ABC obj1 = new ABC(ctr);
        ABC obj2 = new ABC(ctr + 1);
        ABC obj3 = new ABC(ctr + 2);
        ABC obj4 = new ABC(ctr + 3);
        for (int i = 0; i < 10000; i++) {
            hash += arr[i & 3];
        }
        if (hash < 10) {
            System.out.println(arr);
        }
        return hash + obj1.getAccum() + obj2.getAccum() + obj3.getAccum() + obj4.getAccum();
    }

    public static void main(String [] args) {
       int res = 0;
       int [] arr = {1,2,3,4};
       for (int i = 0; i < 1000000; i++) {
          res += micro(arr, i);
       }
       System.out.println("[res] " + res);
    }
}
