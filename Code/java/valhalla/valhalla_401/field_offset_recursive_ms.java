// JAVAC : javac --enable-preview -source 25 --add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED field_offset_recursive_ms.java
// JAVA  : java --enable-preview -Xbootclasspath/a:. --add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED -XX:+PrintFieldLayout -cp . field_offset_recursive_ms

import jdk.internal.vm.annotation.MultiField;
import jdk.internal.vm.annotation.LooselyConsistentValue;
import jdk.internal.vm.annotation.NullRestricted;
import jdk.internal.vm.annotation.Strict;

@LooselyConsistentValue
value class Point {
    public float x;
    public float y;
    public float z;

    public Point(float x, float y, float z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }
}

public class field_offset_recursive_ms {
    @Strict
    @NullRestricted
    @MultiField(value=8)
    public Point obj = new Point(10.0f, 20.0f, 30.0f);

    public static void main(String [] args) {
        field_offset_recursive_ms inst = new field_offset_recursive_ms();
        //System.out.println(inst.obj.hashCode());
        System.out.println(inst.hashCode());
    }
}
