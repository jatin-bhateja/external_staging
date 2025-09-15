
import java.lang.invoke.*;
import jdk.internal.vm.annotation.*;

public class test_constant_gen {
    // To get compile-time constants for comparison operation

    static final MutableCallSite MUTABLE_INT_CONSTANT = new MutableCallSite(MethodType.methodType(Integer.class));
    static final MethodHandle MUTABLE_INT_CONSTANT_HANDLE = MUTABLE_INT_CONSTANT.dynamicInvoker();

    @Stable
    static int [] stable_arr = new int[1024];

    public static int yeild_constant_int() throws Throwable {
        return (Integer)(MUTABLE_INT_CONSTANT_HANDLE.invokeExact()) + 20;
    } 

    public static int yeild_constant_array_element() throws Throwable {
        return stable_arr[(Integer)(MUTABLE_INT_CONSTANT_HANDLE.invokeExact())];
    } 

    public static void main(String [] args) throws Throwable {
        int res = 0;
        for (int i = 0; i < stable_arr.length; i++) {
            stable_arr[i] = i;
        }

        MUTABLE_INT_CONSTANT.setTarget(MethodHandles.constant(Integer.class, Integer.parseInt(args[0])));

        for (int i = 0; i < 100000; i++) {
           res =+ yeild_constant_int() + yeild_constant_array_element();
        }

        System.out.println("[res] " + res);
    }
}
