
import java.util.Arrays;

abstract class root_class  {
   public abstract int getElement(int index);
}

class subclass1 extends root_class {
  int [] arr;
  public subclass1 (int length) {
     arr = new int[length];
     Arrays.fill(arr, 10);
  }
  public int getElement(int index) {
      return arr[index];
  }
}

class subclass2 extends root_class {
  int [] arr;
  public subclass2 (int length) {
     arr = new int[length];
     Arrays.fill(arr, 20);
  }
  public int getElement(int index) {
      return arr[index];
  }
}

public class method_dispatch_patching {
   public static root_class obj;
   public static int micro(int index) {
      return obj.getElement(index);
   } 
   public static void main(String [] args) {
      int res = 0;
      for (int i = 1; i < 10000; i++) {
         obj = (i & 1) == 0  ? new subclass1(i) : new subclass2(i);
         res += micro(0); 
      }
      System.out.println("[res] " + res);
   }
}
