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
    public byte fld8;
    public byte fld9;
    public byte fld10;
    public byte fld11;
    public byte fld12;
    public byte fld13;
    public byte fld14;
    public byte fld15;


    public MyValue(
byte fld0, byte fld1, byte fld2, byte fld3, byte fld4, byte fld5, byte fld6, byte fld7, byte fld8, byte fld9, byte fld10, byte fld11, byte fld12, byte fld13, byte fld14, byte fld15)  {
        this.fld0 = fld0; 
        this.fld1 = fld1; 
        this.fld2 = fld2; 
        this.fld3 = fld3; 
        this.fld4 = fld4; 
        this.fld5 = fld5; 
        this.fld6 = fld6; 
        this.fld7 = fld7; 
        this.fld8 = fld8; 
        this.fld9 = fld9; 
        this.fld10 = fld10; 
        this.fld11 = fld11; 
        this.fld12 = fld12; 
        this.fld13 = fld13; 
        this.fld14 = fld14; 
        this.fld15 = fld15; 
    }

    public MyValue add(MyValue augend) {
        return new MyValue(
(byte) (this.fld0 + augend.fld0), (byte) (this.fld1 + augend.fld1), (byte) (this.fld2 + augend.fld2), (byte) (this.fld3 + augend.fld3), (byte) (this.fld4 + augend.fld4), (byte) (this.fld5 + augend.fld5), (byte) (this.fld6 + augend.fld6), (byte) (this.fld7 + augend.fld7), (byte) (this.fld8 + augend.fld8), (byte) (this.fld9 + augend.fld9), (byte) (this.fld10 + augend.fld10), (byte) (this.fld11 + augend.fld11), (byte) (this.fld12 + augend.fld12), (byte) (this.fld13 + augend.fld13), (byte) (this.fld14 + augend.fld14), (byte) (this.fld15 + augend.fld15));
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
        sb.append(fld8);
        sb.append(fld9);
        sb.append(fld10);
        sb.append(fld11);
        sb.append(fld12);
        sb.append(fld13);
        sb.append(fld14);
        sb.append(fld15);
        return sb.toString();
    }
}

public class ValueClassB128 {
    @Strict
    @NullRestricted
    public MyValue init = new MyValue((byte)75, (byte)-9, (byte)114, (byte)-60, (byte)103, (byte)11, (byte)-81, (byte)-54, (byte)-89, (byte)70, (byte)-4, (byte)120, (byte)28, (byte)43, (byte)74, (byte)-19);

    public void micro(MyValue augend) {
        init = init.add(augend);
    }

    public static void main(String [] args) {
        ValueClassB128 obj = new ValueClassB128();

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
