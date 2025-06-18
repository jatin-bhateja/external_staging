import jdk.internal.vm.annotation.Strict;
import jdk.internal.vm.annotation.NullRestricted;
import jdk.internal.vm.annotation.LooselyConsistentValue;


@LooselyConsistentValue
value class MyValue {
    public long fld0;


    public MyValue(
long fld0)  {
        this.fld0 = fld0; 
    }

    public MyValue add(MyValue augend) {
        return new MyValue(
(long) (this.fld0 + augend.fld0));
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[MyValue] => ");
        sb.append(fld0);
        return sb.toString();
    }
}

public class ValueClassL64 {
    @Strict
    
    public MyValue init = new MyValue(7277);

    public void micro(MyValue augend) {
        init = init.add(augend);
    }

    public static void main(String [] args) {
        ValueClassL64 obj = new ValueClassL64();

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
