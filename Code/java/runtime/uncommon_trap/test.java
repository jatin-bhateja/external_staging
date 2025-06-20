
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
        ABC obj = new ABC(ctr);
        if (ctr < 10) {
            System.out.println(arr);
        }
        return obj.getAccum();
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
