
//import jdk.internal.vm.annotation.MultiField;
import jdk.internal.value.ValueClass;
import jdk.internal.vm.annotation.NullRestricted;
import jdk.internal.vm.annotation.LooselyConsistentValue;
import jdk.internal.vm.annotation.ImplicitlyConstructible;

@ImplicitlyConstructible
@LooselyConsistentValue
value class MyComplexValue {
   public float real;
   public float imaginary;
   public MyComplexValue(float r, float i) {
      this.real = r;
      this.imaginary = i;
   }
   public float root() {
      return imaginary + real;
   }
}

// @MultiField hash code should be analogous to array.
public class inline_type_multifield {
    @NullRestricted
    //@MultiField(value = 8) 
    MyComplexValue cfields;

    MyComplexValue carr[];

    public static void main(String [] args) {
        inline_type_multifield obj = new inline_type_multifield();

        obj.carr = (MyComplexValue[])ValueClass.newNullRestrictedArray(MyComplexValue.class, 8);
        for (int i = 0; i < obj.carr.length; i++) {
            obj.carr[i] = new MyComplexValue(1.0f, 1.0f);
        }
        System.out.println("carr.hashCode = " +  obj.carr.hashCode());
        System.out.println("cfields.hashCode = " +  obj.cfields.hashCode());
    }
}
