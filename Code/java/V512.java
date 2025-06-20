class VP {}

class V extends VP {}

public class V512 extends V {
   public static
   <VM extends VP>
   VM leaf(Class<? extends VM> cls) throws Exception {
      return cls.newInstance();
   }
   public static V caller() throws Exception {
      return leaf(V512.class);
   }
   public static void main(String [] args) {
      try {
         System.out.println(caller().getClass());
      } catch(Exception e) {
         System.out.println(e);
      }
   }
}
