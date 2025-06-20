

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.FIELD})
@interface MyAnnotate {
  Class<?> value();
}

class VectorSize {}

class Abc {
   //static int VectorSize = 16;           // Executed during Initialization stage.
   @MyAnnotate(value = VectorSize.class)   // concretized value needed during field parsing for layout computation of multifield.
   int field;                              // Parser can query VM for max vector size (which is only known after VM initialization)
                                           // if value holds a predefined class reference.
                                           // This will again be a symbol based lookup of classes known to VM as is being done currently. 
   Abc() {
      try {
        var f = Abc.class.getDeclaredField("field");
        f.setAccessible(true);
        var annot = f.getDeclaredAnnotation(MyAnnotate.class);   
        System.out.println(annot.toString() + " = " + annot.value());
      } catch (Exception e) {
        System.out.println(e);
      }
   }
}


public class myannot {
   public static void main(String [] args) {
      Abc obj = new Abc();
      System.out.println(obj.toString());
   }
}
