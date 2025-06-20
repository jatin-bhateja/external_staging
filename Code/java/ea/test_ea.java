
import java.lang.foreign.*;

class MyClass {
   public int field1;
   public int field2;
   public int field3;
   public int field4;
   public MyClass(int field1, int field2, int field3, int field4) {
       this.field1 = field1;
       this.field2 = field2;
       this.field3 = field3;
       this.field4 = field4; 
   }
}

/*
*  Escape Analysis:
// Adaptation for C2 of the escape analysis algorithm described in:
//
// [Choi99] Jong-Deok Shoi, Manish Gupta, Mauricio Seffano,
//          Vugranam C. Sreedhar, Sam Midkiff,
//          "Escape Analysis for Java", Proceedings of ACM SIGPLAN
//          OOPSLA  Conference, November 1, 1999
*/   
public class test_ea {
   
   public static int micro1(int ctr) {
      // non-escaping object, EA sweepable, values are forwarded to users, additional bookeeping (SafepointScalarObjectNode) for eliminated objects at SafePoints 
      // With -XX:-Inline, constructor will not be inlined and hence AllocateNode are considered escapable.
      MyClass obj = new MyClass(10,20,30,40);
      return obj.field1 * ctr + obj.field2 + obj.field3 + obj.field4;
   }
   public static int micro2(int ctr) {
      // small known lenght arrays of size less than -XX:+EliminateAllocationArraySizeLimit are eliminatable if non-escaping.
      int [] arr = new int[5];
      arr[0] = 10;
      arr[1] = 10;
      arr[2] = 10;
      arr[3] = 10;
      arr[4] = 10;
      // value forwarding will forward constants to expressions. 
      return ctr * arr[0] + arr[1] + arr[2] + arr[3] + arr[4];
   }
   public static int micro3(int ctr) {
      int [] arr = new int[8];
      MemorySegment ms = MemorySegment.ofArray(arr);
      ms.fill((byte)10);
      return ctr * ms.get(ValueLayout.JAVA_INT, 12) + 
                   ms.get(ValueLayout.JAVA_INT, 16) +  
                   ms.get(ValueLayout.JAVA_INT, 20) +  
                   ms.get(ValueLayout.JAVA_INT, 24);
   }
   public static void main(String [] args) {
     int micro = Integer.parseInt(args[0]);
     if (micro == 0) {
        int res = 0;
        for (int i = 0; i < 100000; i++) {
            res += micro1(i);
        }
        System.out.println("[res] " + res);
     } else if (micro == 1) {
        int res = 0;
        for (int i = 0; i < 100000; i++) {
            res += micro2(i);
        }
        System.out.println("[res] " + res);
     } else if (micro == 2) {
        int res = 0;
        for (int i = 0; i < 100000; i++) {
            res += micro3(i);
        }
        System.out.println("[res] " + res);
     }
   }
}
