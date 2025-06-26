
import jdk.internal.vm.annotation.Stable;

abstract class AbstractBox<E extends Number> {
  abstract E getVal();
}

value class Box<E extends Number> extends AbstractBox<E> {
   public E val;
   Box(E val) {
      this.val = val;
   }
   public E getVal() { return val; }
}

class pfields_base<E extends Number> {
   @Stable
   public AbstractBox<E> field;

   public AbstractBox dummyVec(E val) {
     if (field != null) {
        return field;
     }
     field = newObject(val);
     return field;
   }

   public AbstractBox newObject(E val) {
      switch(val.intValue()) {
        case 10 : 
           return new Box(val);
        default: throw new AssertionError("");
      }
   }
}

public class pfields<E extends Number> extends pfields_base<E> {
   public static final pfields SPECIES = new pfields<Integer>();  // ConP

   public static int micro(int val) {
      return SPECIES.dummyVec(10).getVal().intValue() + val;
   }

   public static void main(String [] args) {
      int res = 0;
      for(int i = 0; i < 10000; i++) {
         res += micro(i);
      }
      System.out.println("res = " + res);
   }
}
