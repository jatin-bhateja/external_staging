import jdk.internal.vm.annotation.Strict;
import jdk.internal.vm.annotation.NullRestricted;
import jdk.internal.vm.annotation.LooselyConsistentValue;


@LooselyConsistentValue
value class MyValue {
    public float fld0;
    public float fld1;
    public float fld2;
    public float fld3;


    public MyValue(
float fld0, float fld1, float fld2, float fld3)  {
        this.fld0 = fld0; 
        this.fld1 = fld1; 
        this.fld2 = fld2; 
        this.fld3 = fld3; 
    }

    public MyValue add(MyValue augend) {
        return new MyValue(
(float) (this.fld0 + augend.fld0), (float) (this.fld1 + augend.fld1), (float) (this.fld2 + augend.fld2), (float) (this.fld3 + augend.fld3));
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

public class ValueClassF128 {
    @Strict
    @NullRestricted
    public MyValue init = new MyValue(7375.3374f, 1348.1527f, 456.58768f, 4795.141f);

    public void micro(MyValue augend) {
        init = init.add(augend);
    }

    public static void main(String [] args) {
        ValueClassF128 obj = new ValueClassF128();

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
