import jdk.internal.vm.annotation.Strict;
import jdk.internal.vm.annotation.NullRestricted;
import jdk.internal.vm.annotation.LooselyConsistentValue;


@LooselyConsistentValue
value class MyValue {
    public short fld0;
    public short fld1;
    public short fld2;
    public short fld3;
    public short fld4;
    public short fld5;
    public short fld6;
    public short fld7;


    public MyValue(
short fld0, short fld1, short fld2, short fld3, short fld4, short fld5, short fld6, short fld7)  {
        this.fld0 = fld0; 
        this.fld1 = fld1; 
        this.fld2 = fld2; 
        this.fld3 = fld3; 
        this.fld4 = fld4; 
        this.fld5 = fld5; 
        this.fld6 = fld6; 
        this.fld7 = fld7; 
    }

    public MyValue add(MyValue augend) {
        return new MyValue(
(short) (this.fld0 + augend.fld0), (short) (this.fld1 + augend.fld1), (short) (this.fld2 + augend.fld2), (short) (this.fld3 + augend.fld3), (short) (this.fld4 + augend.fld4), (short) (this.fld5 + augend.fld5), (short) (this.fld6 + augend.fld6), (short) (this.fld7 + augend.fld7));
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[MyValue] => ");
        sb.append(fld0);
        sb.append(fld1);
        sb.append(fld2);
        sb.append(fld3);
        sb.append(fld4);
        sb.append(fld5);
        sb.append(fld6);
        sb.append(fld7);
        return sb.toString();
    }
}

public class ValueClassS128 {
    @Strict
    @NullRestricted
    public MyValue init = new MyValue((short)1686, (short)1756, (short)4056, (short)5538, (short)5643, (short)9280, (short)7661, (short)6080);

    public void micro(MyValue augend) {
        init = init.add(augend);
    }

    public static void main(String [] args) {
        ValueClassS128 obj = new ValueClassS128();

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
