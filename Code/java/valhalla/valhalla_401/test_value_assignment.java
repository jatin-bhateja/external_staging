import jdk.internal.vm.annotation.*;
import jdk.internal.misc.Unsafe;

@LooselyConsistentValue
value class MyValue {
    public float f1;
    public float f2;
    public float f3;
    public float f4;

    public MyValue(float f1, float f2, float f3, float f4) {
        this.f1 = f1;
        this.f2 = f2;
        this.f3 = f3;
        this.f4 = f4;
    }

    public float accum() {
        return f1 + f2 + f3 + f4;
    }
}


public value class test_value_assignment {
    @Strict
    @NullRestricted
    public MyValue field;
    
    public float micro(float f) {
        return field.accum();
    }

    public test_value_assignment(MyValue val) {
        field = val;
    }

    public static void main(String [] args) {
        float res = 0;
        for (int i = 0; i < 10000; i++) {
            test_value_assignment obj = new test_value_assignment(new MyValue((float)i, (float)i, (float)i, (float)i));
            res += obj.micro((float)i);
        }
        System.out.println("[res] " + res);
    }
}
