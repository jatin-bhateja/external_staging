import jdk.internal.vm.annotation.Strict;
import jdk.internal.vm.annotation.NullRestricted;
import jdk.internal.vm.annotation.LooselyConsistentValue;


@LooselyConsistentValue
value class MyValue {
    public int fld0;
    public int fld1;
    public int fld2;
    public int fld3;


    public MyValue(
int fld0, int fld1, int fld2, int fld3)  {
        this.fld0 = fld0; 
        this.fld1 = fld1; 
        this.fld2 = fld2; 
        this.fld3 = fld3; 
    }

    public MyValue add(MyValue augend) {
        return new MyValue(
(int) (this.fld0 + augend.fld0), (int) (this.fld1 + augend.fld1), (int) (this.fld2 + augend.fld2), (int) (this.fld3 + augend.fld3));
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[MyValue] => ");
        sb.append(fld0);
        sb.append(fld1);
        sb.append(fld2);
        sb.append(fld3);
        return sb.toString();
    }
}

public class ValueClassI128 {
    @Strict
    @NullRestricted
    public MyValue init = new MyValue(4705, 5616, 3456, 5842);

    public void micro(MyValue augend) {
        init = init.add(augend);
    }

    public static void main(String [] args) {
        ValueClassI128 obj = new ValueClassI128();

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
