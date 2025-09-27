
// javac --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED --add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED -cp . multifield_initialization.java
// java -Xbootclasspath/a:. --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED --add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED -cp . multifield_initialization

import jdk.internal.vm.annotation.MultiField;
import jdk.internal.misc.Unsafe;

class multifield_initialization {
    @MultiField(value=4)
    public float field = 2.0f;

    public static void main(String [] args) {
        Unsafe U = Unsafe.getUnsafe();
        multifield_initialization obj = new multifield_initialization();

        System.out.println("field0 = " + U.getFloat(obj, 12));
        System.out.println("field1 = " + U.getFloat(obj, 16));
        System.out.println("field2 = " + U.getFloat(obj, 20));
        System.out.println("field3 = " + U.getFloat(obj, 24));

    }
} 

/*

PROMPT>java -Xbootclasspath/a:. --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED --add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED -cp . multifield_initialization
field0 = 0.0
field1 = 2.0
field2 = 0.0
field3 = 0.0

*/
