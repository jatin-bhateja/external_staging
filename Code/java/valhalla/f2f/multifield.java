
import jdk.internal.vm.annotation.MultiField;
import jdk.internal.vm.annotation.ImplicitlyConstructible;
import jdk.internal.vm.annotation.LooselyConsistentValue;
import jdk.internal.misc.Unsafe;
import java.util.stream.IntStream;

//@ImplicitlyConstructible
//@LooselyConsistentValue
//value class VectorPayload512I {
//value class VectorPayload512I {
class VectorPayload512I {
  @MultiField(value = 16)
  int _value;
  
  public static final Unsafe UNSAFE = Unsafe.getUnsafe();

  public VectorPayload512I() {
     _value = 0;
  }
  
  public VectorPayload512I init(int [] arr) {
     assert arr.length == 16;
     //VectorPayload512I obj = UNSAFE.makePrivateBuffer(this);
     for (int i = 0; i < arr.length; i++) {
        //UNSAFE.putInt(obj, 12 + i * Integer.BYTES, UNSAFE.getInt(arr, 16 + i * Integer.BYTES));
        UNSAFE.putInt(this, 12 + i * Integer.BYTES, UNSAFE.getInt(arr, 16 + i * Integer.BYTES));
     }
     //obj = UNSAFE.finishPrivateBuffer(obj);
     return this;
  }

  public int getInt(int index) {
     if (index < 0 || index >= 16) {
        throw new IndexOutOfBoundsException("Index " + index + " is OOB");
     }
     return UNSAFE.getInt(this, 12 + index * Integer.BYTES);
  } 
}

public class multifield {
   public static int micro(int [] arr, int index) {
     VectorPayload512I obj = new VectorPayload512I();
     obj = obj.init(arr);
     return obj.getInt(index);
   }
   public static void main (String [] args) {
      int res = 0;
      int [] arr = IntStream.range(0, 16).toArray();
      for (int i = 0; i < 1000; i++) {
         res += micro(arr, i & 15);
      } 
      System.out.println("[res] " + res);
   }
}
