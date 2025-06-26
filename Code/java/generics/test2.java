
import jdk.internal.misc.Unsafe;

value class MyValue1 {
    int f1;
    MyValue1(int f1) {
       this.f1 = f1;
    }
}

value class MyValue2 {
    int f1;
    MyValue2(int f1) {
       this.f1 = f1;
    }
}

public class test2 {
   public static final Unsafe UNSAFE = Unsafe.getUnsafe();
   public static void main(String [] args) {
       var obj1 = UNSAFE.makePrivateBuffer(new MyValue1(10)); 
       var obj2 = UNSAFE.makePrivateBuffer(new MyValue2(20)); 
       System.out.println(obj1.f1 + obj2.f1);
   }
}
