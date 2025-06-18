import jdk.internal.vm.annotation.Strict;
import jdk.internal.vm.annotation.NullRestricted;
import jdk.internal.vm.annotation.LooselyConsistentValue;


@LooselyConsistentValue
value class MyValue {
    public byte fld0;
    public byte fld1;
    public byte fld2;
    public byte fld3;
    public byte fld4;
    public byte fld5;
    public byte fld6;
    public byte fld7;


    public MyValue(
byte fld0, byte fld1, byte fld2, byte fld3, byte fld4, byte fld5, byte fld6, byte fld7)  {
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
(byte) (this.fld0 + augend.fld0), (byte) (this.fld1 + augend.fld1), (byte) (this.fld2 + augend.fld2), (byte) (this.fld3 + augend.fld3), (byte) (this.fld4 + augend.fld4), (byte) (this.fld5 + augend.fld5), (byte) (this.fld6 + augend.fld6), (byte) (this.fld7 + augend.fld7));
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

public class ValueClassB64 {
    @Strict
    
    public MyValue init = new MyValue((byte)75, (byte)-9, (byte)114, (byte)-60, (byte)103, (byte)11, (byte)-81, (byte)-54);

    public void micro(MyValue augend) {
        init = init.add(augend);
    }

    public static void main(String [] args) {
        ValueClassB64 obj = new ValueClassB64();

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
