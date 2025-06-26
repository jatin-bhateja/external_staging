import jdk.internal.vm.annotation.Strict;
import jdk.internal.vm.annotation.NullRestricted;
import jdk.internal.vm.annotation.LooselyConsistentValue;


@LooselyConsistentValue
value class MyValue {
    public int fld0;
    public int fld1;


    public MyValue(
int fld0, int fld1)  {
        this.fld0 = fld0; 
        this.fld1 = fld1; 
    }

    public MyValue add(MyValue augend) {
        return new MyValue(
(int) (this.fld0 + augend.fld0), (int) (this.fld1 + augend.fld1));
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[MyValue] => ");
        sb.append(fld0);
        sb.append(fld1);
        return sb.toString();
    }
}

public class ValueClassI64 {
    @Strict
    
    public MyValue init = new MyValue(6940, 8491);

    public void micro(MyValue augend) {
        init = init.add(augend);
    }

    public static void main(String [] args) {
        ValueClassI64 obj = new ValueClassI64();

        for (int i = 0; i < 1000000; i++) {
            obj.micro(obj.init);
        }

        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 1000000; i++) {
            obj.micro(obj.init);
        }
        long t2 = System.currentTimeMillis();

        System.out.println("[time] " + (t2-t1) + "ms [res]" + obj.init);
    }
}
