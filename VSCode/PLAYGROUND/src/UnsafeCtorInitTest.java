import jdk.internal.misc.Unsafe;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.Field;

class MyClass {
    private float f1;
    private float f2;

    private MyClass(float f1, float f2) {
        System.out.println("Running <init>(" + f1 + "," + f2 + ")");
        this.f1 = f1;
        this.f2 = f2;
    }

    @Override
    public String toString() {
        return "MyClass{f1=" + f1 + ", f2=" + f2 + "}";
    }
}

public class UnsafeCtorInitTest {


    public static void main(String[] args) throws Throwable {
        // Get Unsafe instance reflectively
        Unsafe unsafe = Unsafe.getUnsafe();

        // Allocate object without running constructor
        MyClass raw = (MyClass) unsafe.allocateInstance(MyClass.class);
        System.out.println("After allocateInstance: " + raw);

        // Lookup private constructor <init>(float,float)
        MethodHandles.Lookup lookup =
                MethodHandles.privateLookupIn(MyClass.class, MethodHandles.lookup());
        MethodType ctorType = MethodType.methodType(void.class, float.class, float.class);

        MethodHandle ctorMH = lookup.findConstructor(MyClass.class, ctorType);

        // Call constructor manually using linkToSpecial semantics
        ctorMH.invokeExact(raw, 1.23f, 4.56f);

        // Now object is fully initialized
        System.out.println("After manual <init>: " + raw);
    }
}
