import jdk.internal.vm.annotation.Strict;
import jdk.internal.vm.annotation.NullRestricted;
import jdk.internal.vm.annotation.LooselyConsistentValue;


@LooselyConsistentValue
value class MyValue {
    public float fld0;
    public float fld1;


    public MyValue(
float fld0, float fld1)  {
        this.fld0 = fld0; 
        this.fld1 = fld1; 
    }

    public MyValue add(MyValue augend) {
        return new MyValue(
(float) (this.fld0 + augend.fld0), (float) (this.fld1 + augend.fld1));
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[MyValue] => ");
        sb.append(fld0);
        sb.append(fld1);
        return sb.toString();
    }
}

public class ValueClassF64 {
    @Strict
    
    public MyValue init = new MyValue(7738.972f, 4663.14f);

    public void micro(MyValue augend) {
        init = init.add(augend);
    }

    public static void main(String [] args) {
        ValueClassF64 obj = new ValueClassF64();

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
