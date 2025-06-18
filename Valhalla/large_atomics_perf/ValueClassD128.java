import jdk.internal.vm.annotation.Strict;
import jdk.internal.vm.annotation.NullRestricted;
import jdk.internal.vm.annotation.LooselyConsistentValue;


@LooselyConsistentValue
value class MyValue {
    public double fld0;
    public double fld1;


    public MyValue(
double fld0, double fld1)  {
        this.fld0 = fld0; 
        this.fld1 = fld1; 
    }

    public MyValue add(MyValue augend) {
        return new MyValue(
(double) (this.fld0 + augend.fld0), (double) (this.fld1 + augend.fld1));
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[MyValue] => ");
        sb.append(fld0);
        sb.append(fld1);
        return sb.toString();
    }
}

public class ValueClassD128 {
    @Strict
    @NullRestricted
    public MyValue init = new MyValue(2726.7411941115383, 3719.493394860662);

    public void micro(MyValue augend) {
        init = init.add(augend);
    }

    public static void main(String [] args) {
        ValueClassD128 obj = new ValueClassD128();

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
