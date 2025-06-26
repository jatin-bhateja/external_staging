
import jdk.internal.vm.annotation.Stable;

abstract class AbstractBox<E extends Number> {
  abstract int getVal();
}

value class Box<E extends Number> extends AbstractBox<E> {
   public int val;
   Box(int val) {
      this.val = val;
   }
   public int getVal() { return val; }
}

class pfields_base<E extends Number> {
   @Stable
   AbstractBox<E> field;

   public AbstractBox dummyVec(E val) {
     if (field != null) {
        return field;
     }
     return newObject(val);
   }

   public AbstractBox newObject(E val) {
      switch(val.intValue()) {
        case 10 : 
           return field = new Box(val.intValue());
        default: 
           throw new AssertionError("");
      }
   }
}

public class pfields<E extends Number> extends pfields_base<E> {
   public static final pfields SPECIES = new pfields<Integer>();  // ConP

   public static int micro(int val) {
      return SPECIES.dummyVec(10).getVal() + val;
   }

   public static void main(String [] args) {
      int res = 0;
      for(int i = 0; i < 10000; i++) {
         res += micro(i);
      }
      System.out.println("res = " + res);
   }
}
