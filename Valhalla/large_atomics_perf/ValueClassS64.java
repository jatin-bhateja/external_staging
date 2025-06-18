import jdk.internal.vm.annotation.Strict;
import jdk.internal.vm.annotation.NullRestricted;
import jdk.internal.vm.annotation.LooselyConsistentValue;


@LooselyConsistentValue
value class MyValue {
    public short fld0;
    public short fld1;
    public short fld2;
    public short fld3;


    public MyValue(
short fld0, short fld1, short fld2, short fld3)  {
        this.fld0 = fld0; 
        this.fld1 = fld1; 
        this.fld2 = fld2; 
        this.fld3 = fld3; 
    }

    public MyValue add(MyValue augend) {
        return new MyValue(
(short) (this.fld0 + augend.fld0), (short) (this.fld1 + augend.fld1), (short) (this.fld2 + augend.fld2), (short) (this.fld3 + augend.fld3));
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

public class ValueClassS64 {
    @Strict
    
    public MyValue init = new MyValue((short)9127, (short)5190, (short)6396, (short)2168);

    public void micro(MyValue augend) {
        init = init.add(augend);
    }

    public static void main(String [] args) {
        ValueClassS64 obj = new ValueClassS64();

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
