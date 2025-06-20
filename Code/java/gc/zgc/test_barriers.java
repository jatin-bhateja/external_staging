
class MyClass {
   public Object field;
   public MyClass(Object field) {
       this.field = field;
   }
}

public class test_barriers {
/*   ZGC: Quick reference.
 *    - Fully concurrent marking.
 *    - Fully concurrent evacuation.
 *    - Very short STW phase for root set enumeration. Ultra low pause time.
 *    - Generational. 
 *    - Adaptive heap size.
 *    - Min page size 2MB
 *    - No support for compressed pointers.
 *    - Phases
          -  Mark / Remap
          -  STW
               - Drop Forwarding tables.
               - EC set
          -  Relocation.
               - Record movements into forwarding table.  
               - Reclaim the evacuation candidates on completion.
               - Remaining dangling pointers are healed along with next gc marking phase (remapping). 
          -  Barriers
               - Load
               - Write
               - Global state comparison is optimized by patching the barrier code.
          - Old gen collections happens parallely with young collection to identify young to old references.
          - Remember set bookkeeps old to young cross references. 
      - https://openjdk.org/jeps/439
                
 *   Write Barriers  
 *        - Only needed for Generational.
 */
   
   public static int leaf(Object obj) {
       return obj.hashCode(); 
   }
   public static int micro(MyClass inst) {
       return leaf(inst.field) ;
   }

   public static void main(String [] args) {
       int res = 0;
       for (int i = 0; i < 10000000; i++) {
           MyClass inst = new MyClass(Integer.valueOf(i));
           res += micro(inst);
       }
       System.out.println("[res] " + res);
   }
}
