import jdk.internal.misc.Unsafe;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.Field;

value class MyClass {
    private float f1;
    private float f2;

    public MyClass(float f1, float f2) {
        System.out.println("Running <init>(" + f1 + "," + f2 + ")");
        this.f1 = f1;
        this.f2 = f2;
    }

    @Override
    public String toString() {
        return "MyClass{f1=" + f1 + ", f2=" + f2 + "}";
    }
}

public class UnsafeCtorInitValueTest {

    public static void main(String[] args) throws Throwable {
        // Get Unsafe instance reflectively
        Unsafe unsafe = Unsafe.getUnsafe();

        // Allocate object without running constructor
        MyClass raw = (MyClass) unsafe.allocateInstance(MyClass.class);
        System.out.println("After allocateInstance: " + raw);

        // Get constructor handle
        MethodHandles.Lookup lookup = MethodHandles.lookup();
        MethodType mt = MethodType.methodType(void.class, float.class, float.class);
        MethodHandle ctor = lookup.findConstructor(MyClass.class, mt);

        // Call constructor, returns the initialized instance
        MyClass inited = (MyClass) ctor.invoke(1.23f, 4.56f);
        System.out.println("Initialized object: " + inited);
    }
}

