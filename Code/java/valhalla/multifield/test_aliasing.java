
import jdk.internal.misc.Unsafe;
import jdk.internal.vm.annotation.MultiField;
//import jdk.internal.vm.annotation.ImplicitlyConstructible;
//import jdk.internal.vm.annotation.LooselyConsistentValue;

//@LooselyConsistentValue
//@ImplicitlyConstructible
//value class IntPayload {
class IntPayload {
  @MultiField(4)
  int payload;
  IntPayload() {
     payload = 0;
  }
}

public class  test_aliasing {
   public static Unsafe UNSAFE = Unsafe.getUnsafe();

   public static int micro1(int [] arr) {
       UNSAFE.putInt(arr, 16, 10);
       UNSAFE.putInt(arr, 20, 20);
       UNSAFE.putInt(arr, 24, 30);
       UNSAFE.putInt(arr, 28, 40);
       return UNSAFE.getInt(arr, 20);
   }

   public static int micro2(IntPayload obj) {
       UNSAFE.putInt(obj, 16, 10);
       UNSAFE.putInt(obj, 20, 20);
       UNSAFE.putInt(obj, 24, 30);
       UNSAFE.putInt(obj, 28, 40);
       return UNSAFE.getInt(obj, 20);
   }

   public static int micro3(int [] arr) {
       arr[0] = 10;
       arr[1] = 20;
       arr[2] = 30;
       arr[3] = 40;
       return arr[1];
   }

   public static int micro4(IntPayload obj) {
       obj = UNSAFE.makePrivateBuffer(obj);
       UNSAFE.putInt(obj, 16, 10);
       UNSAFE.putInt(obj, 20, 20);
       UNSAFE.putInt(obj, 24, 30);
       UNSAFE.putInt(obj, 28, 40);
       obj = UNSAFE.finishPrivateBuffer(obj);
       return UNSAFE.getInt(obj, 20);
   }

   public static int micro5(IntPayload obj) {
       UNSAFE.putInt(obj, 16, 10);
       UNSAFE.putInt(obj, 20, 20);
       UNSAFE.putInt(obj, 24, 30);
       UNSAFE.putInt(obj, 28, 40);
       return (int) UNSAFE.getByte(obj, 22);
   }

   public static void main(String [] args) {
     int res = 0;
     int algo = Integer.parseInt(args[0]);
     switch(algo) {
       case 0: {
         int [] arr = new int[4];
         for (int i = 0; i < 10000; i++) {
            res += micro1(arr);
         }
       } break;
       case 1: {
         int [] arr = new int[4];
         for (int i = 0; i < 10000; i++) {
            res += micro3(arr);
         }
       } break;
       case 2: {
         IntPayload obj = new IntPayload();
         for (int i = 0; i < 10000; i++) {
            res += micro2(obj);
         }
       } break;
       case 3: {
         IntPayload obj = new IntPayload();
         for (int i = 0; i < 10000; i++) {
            res += micro5(obj);
         }
       } break;
       default:
         assert false;
     }
     System.out.println("[res] " + res);
   }
}
