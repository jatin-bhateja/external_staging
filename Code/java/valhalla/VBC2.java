
package dummy;

import jdk.internal.ValueBased;
import java.util.stream.IntStream;

@ValueBased
final class MyValue {
  public final int field;
  private MyValue(int val) {
    this.field = val;
  }
  public static MyValue valueOf(int val) {
     return new MyValue(val); 
  }
  public static int add(MyValue addened, MyValue augend) {
     return addened.field + augend.field;
  }
}

public class VBC2 {
   static int [] src1 = IntStream.range(0, 1024).toArray();
   static int [] src2 = IntStream.range(0, 1024).toArray();
   static int [] res = new int[1024];

   public static int micro(int ctr) {
      for (int i = 0; i < res.length; i++) {
          res[i] = MyValue.add(MyValue.valueOf(src1[i]), MyValue.valueOf(src2[i])); 
      }
      return res[ctr];
   }

   public static void main(String [] args) {
      int res = 0;
      for (int i = 0; i < 100000; i++) {
         res += micro(i & 1023);
      }
      System.out.println("[res] " + res);
   }
}
