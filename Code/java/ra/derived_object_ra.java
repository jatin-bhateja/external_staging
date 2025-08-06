class Payload {
    public float field1;
    public float field2;
    public float field3;
    public float field4;

    public Payload(float f1, float f2, float f3, float f4) {
        this.field1 = f1;
        this.field2 = f2;
        this.field3 = f3;
        this.field4 = f4;
    }
    public String toString() {
        return "obj = { " + field1 + ", " + field2 + ", " + field3 + ", " + field4 + " }";
    }
}

class MyClass {
    public Payload field;

    public MyClass(float f1, float f2, float f3, float f4) {
        this.field = new Payload(f1, f2, f3, f4);
    }

    public String toString() {
        return field.toString();
    }
}

public class derived_object_ra {
    public static void micro(MyClass obj, int cond) {
        obj.field.field1 = 50.0f;
        obj.field.field2 = 70.0f;
        if (cond > 20000) {
           obj.field.field3 = 30.0f;
        }
        obj.field.field4 = 40.0f;
    }

    public static void main(String [] args) {
        MyClass obj = new MyClass(10.0f, 20.0f, 30.0f, 40.0f);
        for (int i = 0; i < 10000; i++) {
            micro(obj, i);
        }
        System.out.println(obj);
    }
}
