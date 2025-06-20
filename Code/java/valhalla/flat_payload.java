

@jdk.internal.vm.annotation.LooselyConsistentValue
value class MyValue {
    public float f1;
    public float f2;
    public float f3;
    public float f4;
    public float f5;
    public float f6;
    public float f7;
    public float f8;
    public MyValue(float f1, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
        this.f1 = f1;
        this.f2 = f2;
        this.f3 = f3;
        this.f4 = f4;
        this.f5 = f5;
        this.f6 = f6;
        this.f7 = f7;
        this.f8 = f8;
    }
    public float getAccum() {
        return f1 + f2 + f3 + f4 + f5 + f6 + f7 + f8;
    }
}


public class flat_payload {
    @jdk.internal.vm.annotation.Strict
    @jdk.internal.vm.annotation.NullRestricted
    public MyValue payload;

    public flat_payload() {
        payload = new MyValue(1.0f, 2.0f, 3.0f, 4.0f, 5.0f, 6.0f, 7.0f, 8.0f);
    }

    public static void main(String [] args) {
        flat_payload obj = new flat_payload();
        System.out.println(obj.payload.hashCode());
    } 
}
